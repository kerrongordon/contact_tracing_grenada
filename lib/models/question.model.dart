import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    this.questions,
  });

  final List<Question> questions;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    this.id,
    this.question,
    this.list,
    this.yes,
    this.no,
  });

  final int id;
  final String question;
  final List<String> list;
  final int yes;
  final int no;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        list: List<String>.from(json["list"].map((x) => x)),
        yes: json["yes"],
        no: json["no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "list": List<dynamic>.from(list.map((x) => x)),
        "yes": yes,
        "no": no,
      };
}
