import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScreenFour extends HookWidget {
  final PageController pageController;

  ScreenFour({this.pageController});
  @override
  Widget build(BuildContext context) {
    final _optionFour = useState(false);
    final _optionFive = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Survey App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _optionFour.value = !_optionFour.value,
                  child: Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Are you experiencing any of these following symptoms that are not a sign of the common cold?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text('Fever/Chills'),
                          Text('Cough'),
                          Text('Shortness of breath/ Difficulty breathing'),
                          Text('Fatigue'),
                          Text('Body aches'),
                          Text('Headache'),
                          Text('New loss of taste'),
                          Text('New loss of smell'),
                          Text('Sore throat'),
                          Text('Congestion/ Runny nose'),
                          Text('Nausea'),
                          Text('Diarrhea'),
                          Divider(),
                          Row(
                            children: [
                              Text('Yes/No'),
                              Checkbox(
                                  value: _optionFour.value,
                                  onChanged: (val) => _optionFour.value = val),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _optionFive.value = !_optionFive.value,
                  child: Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Are you experiencing any of these following emergency warning signs?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text('Difficulty in breathing'),
                          Text('Persistent pain or pressure in the chest'),
                          Text('New confusion'),
                          Text('Inability to wake or stay awake'),
                          Text(
                              'Pale, Gray, or blue-coloured skin, lips, or nail beds, depending on skin tone'),
                          Divider(),
                          Row(
                            children: [
                              Text('Yes/No'),
                              Checkbox(
                                  value: _optionFive.value,
                                  onChanged: (val) => _optionFive.value = val),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  child: Text('See Results'),
                  onPressed: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
