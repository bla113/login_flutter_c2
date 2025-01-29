import 'package:flutter/material.dart';
import 'package:login_app_c_2/pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Flutter',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
