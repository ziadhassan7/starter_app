import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/router/app_navigator.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_styles.dart';
import '../../core/styles/color_theme_cubit.dart';
import '../../core/styles/decoration.dart';
import '../../l10n/l10n.dart';
import 'theme_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [

              Center(
                child: Text(
                  localText.welcomeMessage('Ziad Hassan'),
                  style: AppTextStyles.body,
              )),

              Padding(
                padding: const EdgeInsets.all(16),

                child: GestureDetector(
                  onTap: () {
                    AppNavigator.navigate(context, ThemePage());
                  },

                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: ContainerDecoration.roundedContainer(),
                    child: Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.brush, color: AppColors.text,),
                        ),

                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Theme',
                              style: AppTextStyles.labelMedium,
                            ),

                            BlocBuilder<ThemeCubit, ThemeMode>(
                              builder: (context, themeMode) {

                                String themeName = themeMode.name;

                                return Text(themeName,
                                  style: AppTextStyles.captionRegular.copyWith(
                                      fontWeight: FontWeight.w300),);
                              }
                            )
                          ]
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
