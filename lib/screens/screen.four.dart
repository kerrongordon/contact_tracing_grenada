import 'package:flutter/material.dart';

class ScreenFour extends StatelessWidget {
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
            SizedBox(
              height: 250,
            ),
            ElevatedButton(
              child: Text('Go To Page Five'),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => PageFive()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
