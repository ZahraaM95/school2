
import 'package:flutter/material.dart';

import 'core/constant/routes.dart';
import 'featuers/auth/view/signup_screen.dart';
import 'featuers/auth/view/login_screen.dart';


Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const SignUpScreen(),
  AppRoute.signUp: (context) => const LoginScreen(),


};