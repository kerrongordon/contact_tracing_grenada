import 'package:contact_tracing_grenada/components/inforcard.comp.dart';
import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:flutter/material.dart';

Widget buildOutPutMessage(QuestionModel data) {
  final result0 = data.questions[0].answer;
  final result1 = data.questions[0].answer;
  final result2 = data.questions[0].answer;
  final result3 = data.questions[0].answer;

  if (result0 == 'yes' ||
      result1 == 'yes' ||
      result2 == 'yes' ||
      result3 == 'yes') {
    return InforCardComp(
      title: 'You Should Get Tested',
      subTitle: 'Please self-quarantine for 14 days',
      date: formatTimestamp(data.timestamp),
      content:
          'There is an high chance you are a carrier of SARS-CoV-2, popularly known as COVID-19The Corona Virus. \n \n Please self-quarantine for 14 days, then go to your local testing site and get tested or call the COVID-19 hotline @ (473)-438-4787 or (473) 538-4787. \n \n Thank you for using our app!',
    );
  } else {
    return InforCardComp(
      title: 'Monitor Your Symptoms',
      subTitle: 'You probably catching the common cold',
      date: formatTimestamp(data.timestamp),
      content:
          'You are most likely catching the common cold and should rest and drink heavy fluids. \n \n However, to be certain, contact the COVID-19 hotline @ (473)-438-4787 or (473) 538-4787. \n \n Thank you for using our app!',
    );
  }
}
