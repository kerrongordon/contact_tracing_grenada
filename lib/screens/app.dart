import 'package:contact_tracing_grenada/routes/app-route.dart';
import 'package:contact_tracing_grenada/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    // String amIweb() => kIsWeb ? wrapperScreen : loadFirebaseScreen;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color.fromARGB(255, 249, 241, 247),
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: loadFirebaseScreen,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
