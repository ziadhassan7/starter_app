import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/styles/app_colors.dart';
import '../features/gemini/gemini_page.dart';
import '../features/home/home_page.dart';
import '../features/plan/planning_page.dart';
import '../features/profile/profile_page.dart';
import 'controller/nav_bar_cubit.dart';
import 'navbar/nav_bar.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavBarCubit(),
        child: _MainPage());
  }
}



class _MainPage extends StatefulWidget {
  const _MainPage();

  @override
  State<_MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: CustomNavBar(fabSize: 16),

      body: BlocBuilder<NavBarCubit, int>(
        builder: (context, currentIndex) {

          return IndexedStack(
            index: currentIndex,
            children: [
              HomePage(),
              GeminiPage(),
              PlanningPage(),
              ProfilePage()
            ],
          );
        }
      ),
    );
  }

}
