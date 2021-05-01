import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:contact_tracing_grenada/data/questions.data.dart';
import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';

class QuestionScreen extends StatelessWidget {
  final LoopPageController page;
  final int pageIndex;
  QuestionScreen({Key key, this.page, this.pageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Question questionItem = questionsList.questions[pageIndex];
    print(pageIndex);
    return SafeArea(
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
          Container(
            color: Colors.indigo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Yes')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: () {}, child: Text('No'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
