import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  String dropdownValue = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Contact Tracing Survey App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Have you travelled in the past 2-14 days?',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 250,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (newValue) {},
                items: <String>[
                  'Select',
                  'Yes',
                  'No',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                child: Text('Go To Page Four'),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => PageFour()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
