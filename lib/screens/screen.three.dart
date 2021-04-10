import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScreenThree extends HookWidget {
  final PageController pageController;

  const ScreenThree({this.pageController});

  @override
  Widget build(BuildContext context) {
    final _optionOne = useState(false);
    final _optionTwo = useState(false);
    final _optionThree = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Survey App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 25),
                    Card(
                      elevation: 5.0,
                      child: ListTile(
                        onTap: () => _optionOne.value = !_optionOne.value,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        title:
                            Text('Have you travelled in the past 2-14 days?'),
                        trailing: Checkbox(
                          onChanged: (bool value) => _optionOne.value = value,
                          value: _optionOne.value,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Card(
                      elevation: 5.0,
                      child: ListTile(
                        onTap: () => _optionTwo.value = !_optionTwo.value,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        title: Text(
                            'Does your country have any positive COVID-19 patients/cases that may be related to a community spread?'),
                        trailing: Checkbox(
                          onChanged: (bool value) => _optionTwo.value = value,
                          value: _optionTwo.value,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Card(
                      elevation: 5.0,
                      child: ListTile(
                        onTap: () => _optionThree.value = !_optionThree.value,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        title: Text(
                            'Have you encountered someone who tested positive for COVID-19 in the past 2-14 days?'),
                        trailing: Checkbox(
                          onChanged: (bool value) => _optionThree.value = value,
                          value: _optionThree.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                child: Text('Go To Next Page'),
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
    );
  }
}
