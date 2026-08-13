import 'package:flutter/material.dart';
import '../../core/styles/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(child: Text(
            "Home Page",
            style: AppTextStyles.body,
          ))
        ],
      ),
    );
  }
}
