import 'dart:convert';

import 'package:time_formatter/time_formatter.dart';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    this.timestamp,
    this.questions,
  });

  final int timestamp;
  final List<Question> questions;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        timestamp: json["timestamp"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    this.id,
    this.question,
    this.list,
    this.answer,
    this.yesno,
    this.longanswer,
  });

  final int id;
  final String question;
  final List<String> list;
  String answer;
  final bool yesno;
  final bool longanswer;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        list: List<String>.from(json["list"].map((x) => x)),
        answer: json["answer"],
        yesno: json["yesno"],
        longanswer: json["longanswer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "list": List<dynamic>.from(list.map((x) => x)),
        "answer": answer,
      };
}

String formatTimestamp(int timestamp) {
  return formatTime(timestamp);
}
