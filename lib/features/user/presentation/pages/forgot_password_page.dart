import 'package:flutter/material.dart';
import 'package:authentication_firebase/share/presentation/widgets/button_long.dart';
import 'package:authentication_firebase/share/presentation/widgets/custom_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Icon(Icons.blur_on_sharp, size: 100, color: Colors.blue[800]),
              const SizedBox(height: 50),
              Text(
                'Enter your recovery email!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(height: 25),
              CustomTextField(
                controller: emailController,
                hintText: 'Confirm your email',
                obscureText: false,
              ),
              const SizedBox(height: 25),
              ButtonLong(text: 'Send', onTap: () {}),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('A member?', style: TextStyle(color: Colors.grey[700])),
                  const SizedBox(width: 4),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
