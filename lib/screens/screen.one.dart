import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScreenOne extends HookWidget {
  final PageController pageController;

  const ScreenOne({this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Survey App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: const TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image(
                width: 150,
                image: AssetImage('assets/web_hi_res_512.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
              child: Text(
                'The easiest way to track your symptoms and ensure your safety!',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                child: Text('Get Started'),
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear);
                }),
          ],
        ),
      ),
    );
  }
}
