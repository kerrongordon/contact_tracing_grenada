import 'package:contact_tracing_grenada/screens/loading.screen.dart';
import 'package:contact_tracing_grenada/screens/wrapper.screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseProvider =
    FutureProvider.autoDispose((_) => Firebase.initializeApp());

class LoadFirebaseScreen extends HookWidget {
  const LoadFirebaseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebase = useProvider(firebaseProvider);

    return firebase.when(
      data: (data) => WrapperScreen(),
      loading: () => const LoadingScreen(),
      error: (error, _) => const SomethingWentWrong(),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Something Went Wrong'),
      ),
    );
  }
}
