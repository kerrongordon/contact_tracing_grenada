import 'package:contact_tracing_grenada/models/user.model.dart';
import 'package:contact_tracing_grenada/services/auth.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kgp_ui/kgp_ui.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = useProvider(authProvider);

    void signUp({
      GlobalKey<FormState> registerKey,
      String gender,
      String firstName,
      String lastName,
      String address,
      String phoneNumber,
      String age,
      String email,
      String password,
      String passwordCon,
      BuildContext context,
    }) async {
      if (registerKey.currentState.validate()) {
        if (gender == '') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Please Select a Gender'),
            ),
          );
          return null;
        }
        if (password == passwordCon) {
          registerKey.currentState.save();
          final data = UserModel(
            age: age,
            address: address,
            email: email,
            firstName: firstName,
            phoneNumber: phoneNumber,
            gender: gender,
            lastName: lastName,
            password: password,
          );

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
            await _auth.signUp(data: data);
            registerKey.currentState.reset();
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
    }

    return BaseRegisterAuth(
      onSignUpBtn: signUp,
    );
  }
}
