import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:contact_tracing_grenada/data/questions.data.dart';
import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:contact_tracing_grenada/services/auth.service.dart';
import 'package:contact_tracing_grenada/services/data.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kgp_ui/kgp_ui.dart';

class QuestionScreen extends HookWidget {
  QuestionScreen({Key key}) : super(key: key);

  final _anwserKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final count = useState(0);
    final longan = useState('');
    final tab = useTabController(initialLength: 1);
    final questionPush = useProvider(questionProvider);
    final auth = useProvider(authProvider);
    final Question questionItem = questionsList.questions[count.value];
    final pageCount = count.value + 1;

    void _saveItem({String type}) async {
      if (pageCount == questionsList.questions.length) {
        questionItem.answer = type;
        questionPush.addQuestion(questionItem);
        print(questionPush.question);
        try {
          await auth.saveAnwser(QuestionModel(
            timestamp: DateTime.now().millisecondsSinceEpoch,
            questions: questionPush.question,
          ));
        } catch (e) {
          print(e);
        }
        return Navigator.pop(context);
      }
      if (pageCount <= questionsList.questions.length) {
        questionItem.answer = type;
        questionPush.addQuestion(questionItem);
        print(questionPush.question);
        count.value++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Self Checkup'),
        centerTitle: true,
        bottom: TabBar(
          controller: tab,
          tabs: [
            RoundedProgressBar(
              height: 18,
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
                  questionItem.yesno
                      ? CardComp(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => _saveItem(type: 'yes'),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Yes',
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => _saveItem(type: 'no'),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'No ',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  questionItem.longanswer
                      ? Form(
                          key: _anwserKey,
                          child: CardComp(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  BaseTextFormField(
                                    prefixIcon: Icon(Icons.addchart_rounded),
                                    keyboardType: TextInputType.text,
                                    labelText: 'Answer',
                                    validator: answerValidator,
                                    onChanged: (val) => longan.value = val,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_anwserKey.currentState.validate()) {
                                        _anwserKey.currentState.save();
                                        _saveItem(type: longan.value);
                                        longan.value = '';
                                        _anwserKey.currentState.reset();
                                      }
                                    },
                                    child: Text('Submit'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final answerValidator = MultiValidator([
  RequiredValidator(errorText: 'Your Answer is required'),
]);
