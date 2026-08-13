import 'package:flutter/material.dart';
import '../../core/styles/app_text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(child: Text(
            "Profile Page",
            style: AppTextStyles.body,
          ))
        ],
      ),
    );
  }
}
