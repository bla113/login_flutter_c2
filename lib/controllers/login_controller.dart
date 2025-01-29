import 'package:flutter/material.dart';

login(String email, String password) {
  debugPrint('desde login');
  if (password.length < 6) {
    debugPrint('Password must be at least 6 characters');
    return;
  }
  if (email == 'admin@email.com' && password == 'password') {
    debugPrint('Login success');
  } else {
    debugPrint('Login failed');
  }
}
