import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_styles.dart';
import '../../core/styles/color_theme_cubit.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentMode = context.watch<ThemeCubit>().state;

    return Scaffold(
      backgroundColor: AppColors.background, // instant color switching — matches AppBar's behavior

      appBar: AppBar(
        title: Text('Theme', style: AppTextStyles.h3,),
        backgroundColor: AppColors.foreground,
        iconTheme: IconThemeData(color: AppColors.text),
      ),
      body: Column(
        children: [
          _ThemeOptionTile(
            title: 'Light',
            icon: Icons.light_mode_outlined,
            mode: ThemeMode.light,
            groupValue: currentMode,
            onTap: () => context.read<ThemeCubit>().setTheme(ThemeMode.light),
          ),
          _ThemeOptionTile(
            title: 'Dark',
            icon: Icons.dark_mode_outlined,
            mode: ThemeMode.dark,
            groupValue: currentMode,
            onTap: () => context.read<ThemeCubit>().setTheme(ThemeMode.dark),
          ),
          _ThemeOptionTile(
            title: 'System',
            icon: Icons.settings_suggest_outlined,
            mode: ThemeMode.system,
            groupValue: currentMode,
            onTap: () => context.read<ThemeCubit>().setTheme(ThemeMode.system),
          ),
        ],
      ),
    );
  }
}

class _ThemeOptionTile extends StatelessWidget {
  const _ThemeOptionTile({
    required this.title,
    required this.icon,
    required this.mode,
    required this.groupValue,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final ThemeMode mode;
  final ThemeMode groupValue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = mode == groupValue;

    return ListTile(
      leading: Icon(icon, color: isSelected ? AppColors.secondary : AppColors.text.withOpacity(0.6),),
      title: Text(
        title,
        style: AppTextStyles.labelMedium.copyWith(color: isSelected ? AppColors.secondary : AppColors.text.withOpacity(0.6)),
      ),
      trailing: Radio<ThemeMode>(
        value: mode,
        groupValue: groupValue,
        onChanged: (_) => onTap(),
      ),
      selected: isSelected,
      onTap: onTap,
    );
  }
}
