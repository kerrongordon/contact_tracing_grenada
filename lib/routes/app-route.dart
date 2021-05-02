import 'package:contact_tracing_grenada/pages/base.page.dart';
import 'package:contact_tracing_grenada/pages/checkup.page.dart';
import 'package:contact_tracing_grenada/pages/password.rest.page.dart';
import 'package:contact_tracing_grenada/pages/signin.page.dart';
import 'package:contact_tracing_grenada/pages/signup.page.dart';
import 'package:contact_tracing_grenada/pages/start.page.dart';
import 'package:contact_tracing_grenada/routes/routes.dart';
import 'package:contact_tracing_grenada/screens/wrapper.screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case wrapperScreen:
        return MaterialPageRoute(builder: (context) => const WrapperScreen());
      case startPage:
        return MaterialPageRoute(builder: (context) => const StartPage());
      case signUpPage:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case signInPage:
        return MaterialPageRoute(builder: (context) => const SignInPage());
      case passwordRestPage:
        return MaterialPageRoute(
            builder: (context) => const PasswordRestPage());
      case dashboardPage:
        return MaterialPageRoute(builder: (context) => const CheckupPage());
      case questionScreen:
        return MaterialPageRoute(builder: (context) => BasePage());
      default:
        return MaterialPageRoute(builder: (context) => const WrapperScreen());
    }
  }
}
