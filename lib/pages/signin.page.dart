import 'package:contact_tracing_grenada/pages/password.rest.page.dart';
import 'package:contact_tracing_grenada/pages/signup.page.dart';
import 'package:contact_tracing_grenada/routes/routes.dart';
import 'package:contact_tracing_grenada/screens/wrapper.screen.dart';
import 'package:contact_tracing_grenada/services/auth.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kgp_ui/kgp_ui.dart';

class SignInPage extends HookWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = useProvider(authProvider);

    void login({
      GlobalKey<FormState> loginKey,
      String email,
      String password,
      bool rememberMe,
      BuildContext context,
    }) async {
      if (loginKey.currentState.validate()) {
        loginKey.currentState.save();
        try {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Container(
                width: 50,
                height: 50,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          );
          await _auth.signIn(email: email, password: password);
          loginKey.currentState.reset();
          Navigator.of(context).popUntil((route) => route.isFirst);
        } on FirebaseAuthException catch (e) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message),
            ),
          );
        }
      }
    }

    return BaseLoginAuth(
      passwordResetBtn: () => Navigator.pushNamed(context, passwordRestPage),
      registerBtn: () => Navigator.pushNamed(context, signUpPage),
      onSignInBtn: login,
    );
  }
}
