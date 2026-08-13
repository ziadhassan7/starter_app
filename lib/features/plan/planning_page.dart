import 'package:flutter/material.dart';
import '../../core/styles/app_text_styles.dart';

class PlanningPage extends StatelessWidget {
  const PlanningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(child: Text(
            "Planning Page",
            style: AppTextStyles.body,
          ))
        ],
      ),
    );
  }
}
