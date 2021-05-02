import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:contact_tracing_grenada/data/questions.data.dart';
import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

class QuestionScreen extends HookWidget {
  QuestionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = useState(0);
    final tab = useTabController(initialLength: 1);
    final Question questionItem = questionsList.questions[count.value];
    final pageCount = count.value + 1;

    print(pageCount / questionsList.questions.length * 100);
    print(questionsList.questions.length);
    print(pageCount);

    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Survey App'),
        centerTitle: true,
        bottom: TabBar(
          controller: tab,
          tabs: [
            RoundedProgressBar(
              height: 15,
              // theme: RoundedProgressBarTheme.yellow,
              style: RoundedProgressBarStyle(
                borderWidth: 0,
                widthShadow: 0,
                colorBorder: Colors.transparent,
                colorProgress: Colors.yellow,
                backgroundProgress: Colors.yellow[50],
              ),
              margin: EdgeInsets.symmetric(vertical: 16),
              borderRadius: BorderRadius.circular(20),
              percent: pageCount / questionsList.questions.length * 100,
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardComp(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questionItem.question,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 30),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: questionItem.list.length,
                            itemBuilder: (context, index) {
                              return Text(questionItem.list[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (count.value <= questionsList.questions.length - 1) {
                    if (count.value == questionsList.questions.length) {
                      return count.value = 0;
                    }
                    count.value++;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (count.value <= questionsList.questions.length - 1) {
                    count.value--;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'No ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
