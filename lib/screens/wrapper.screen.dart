import 'package:contact_tracing_grenada/pages/checkup.page.dart';
import 'package:contact_tracing_grenada/pages/firsttime.page.dart';
import 'package:contact_tracing_grenada/services/auth.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WrapperScreen extends HookWidget {
  const WrapperScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = useProvider(authProvider);

    print(_auth.isLogin);

    return StreamBuilder(
      stream: _auth.isLogin,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return LoadingPage();
            break;
          case ConnectionState.waiting:
            return LoadingPage();
            break;
          case ConnectionState.active:
            if (snapshot.hasData) {
              return CheckupPage();
            } else {
              return FirstTimePage();
            }
            break;
          case ConnectionState.done:
            return LoadingPage();
            break;
          default:
            return LoadingPage();
        }
      },
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
