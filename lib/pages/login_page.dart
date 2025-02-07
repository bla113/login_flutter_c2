import 'package:flutter/material.dart';
import 'package:login_app_c_2/controllers/login_controller.dart';
import 'package:login_app_c_2/controllers/register_controller.dart';
import 'package:login_app_c_2/pages/home_page.dart';
import 'package:login_app_c_2/pages/register_page.dart';
//import 'package:login_app_c_2/controllers/login_controller.dart';
//import 'package:login_app_c_2/pages/home_page.dart';

class LoginPage extends StatelessWidget {
//DECLARACION DE LA VARIABLES
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const SizedBox(height: 50),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              //onTap: login(userController.text, passwordController.text),
              onTap: () async {
                final response =
                    await login(emailController.text, passwordController.text);

                // debugPrint(response);
                if (response == 200) {
                  // ignore: use_build_context_synchronously
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              child: const Text(
                'Ingresar',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
