import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/hive/app_settings_local_data_source.dart';
import 'core/styles/app_colors.dart';
import 'core/styles/color_theme_cubit.dart';
import 'index/main_page.dart';
import 'l10n/generated/app_localizations.dart';
import 'l10n/l10n.dart';
import 'injection.dart' as inject;

ValueNotifier<Locale> local = ValueNotifier(Locale(L10n.all[0].languageCode)); //

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialization
  await inject.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AppSettingsLocalDataSource _appSettings = AppSettingsLocalDataSource();

  @override
  void initState() {
    super.initState();

    initLang(); //
    local.addListener(() {
      _appSettings.saveDefaultLang(local.value.languageCode);
    });
  }



  void initLang() async {
    final systemLanguage = window.locale.languageCode;
    bool systemHasMatchingLocaleLanguage = L10n.all.any((locale) => locale.languageCode == systemLanguage);

    String? defaultLang = _appSettings.getDefaultLang();

    if(defaultLang != null){
      // must use this function to be able to use localization without context
      LocalizationService.instance.setLocale(Locale(defaultLang));

      // no saved language preference => use system lang
    } else {
      if (systemHasMatchingLocaleLanguage) {
        LocalizationService.instance.setLocale(Locale(systemLanguage));
      } else {
        LocalizationService.instance.setLocale(Locale('en')); // fallback
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => ThemeCubit()),),
      ],

      child: ValueListenableBuilder<Locale>(
          valueListenable: local, //
          builder: (context, value, child) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {

                AppColors.setGlobalTheme(themeMode: themeMode);

                return MaterialApp(
                title: 'StarterApp',
                debugShowCheckedModeBanner: false,

                // localization
                locale: local.value,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],

                // default theme
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
                  scaffoldBackgroundColor: AppColors.background
                ),


                home: MainPage(),
              );
            }
          );
        }
      ),
    );
  }
}
