import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScreenOne extends HookWidget {
  final PageController pageController;

  const ScreenOne({this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Contact Tracing Survey App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
              child: Text(
                'The easiest way to track your symptoms and ensure your safety!',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                child: Text('Get Started'),
                onPressed: () {
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
