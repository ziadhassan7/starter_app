import 'package:flutter/material.dart';
import '../../core/styles/app_text_styles.dart';

class GeminiPage extends StatelessWidget {
  const GeminiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
              child: Text(
                "Gemini Page",
                style: AppTextStyles.body,
              ))
        ],
      ),
    );
  }
}
