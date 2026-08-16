import 'package:flutter/material.dart';
import '../../core/styles/app_text_styles.dart';
import '../../core/widgets/input_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
          child: Column(
            mainAxisAlignment: .start,
            children: [
              Center(child: Text(
                "Input Fields Test",
                style: AppTextStyles.sanchezH2,
              )),

              const SizedBox(height: 36),


              InputField(controller: TextEditingController(), title: 'Title', hint: "hints"),

              const SizedBox(height: 18,),

              PasswordField(controller: TextEditingController(),),
            ],
          ),
        ),
      ),
    );
  }
}
