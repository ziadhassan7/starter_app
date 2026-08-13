import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/styles/app_colors.dart';
import '../controller/nav_bar_cubit.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({super.key, required this.index, required this.icon});

  final int index;
  final String icon;

  @override
  Widget build(BuildContext context) {

    final currentIndex = context.watch<NavBarCubit>().state;

    bool isSelected = currentIndex == index;

    return InkWell(
      onTap: (){
        context.read<NavBarCubit>().navigate(index: index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: SvgPicture.asset(
            icon,
            key: ValueKey(isSelected), // triggers cross-fade on change
            color: isSelected ? AppColors.primary : Colors.black54,
          ),
        ),
      ),
    );
  }
}
