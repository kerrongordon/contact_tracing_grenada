import 'package:contact_tracing_grenada/services/auth.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kgp_ui/kgp_ui.dart';

class PasswordRestPage extends HookWidget {
  const PasswordRestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = useProvider(authProvider);

    void reset({
      BuildContext context,
      GlobalKey<FormState> resetKey,
      String email,
    }) async {
      if (resetKey.currentState.validate()) {
        resetKey.currentState.save();
        try {
          await _auth.restPassword(email: email);
          resetKey.currentState.reset();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please Check Your Email'),
            ),
          );
          Navigator.pop(context);
        } on FirebaseAuthException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message),
            ),
          );
        }
      }
    }

    return BasePasswordRestAuth(
      onSendBtn: reset,
    );
  }
}
