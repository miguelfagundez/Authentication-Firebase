import 'package:authentication_firebase/features/user/presentation/pages/login_page.dart';
import 'package:authentication_firebase/features/user/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Firebase',
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}
