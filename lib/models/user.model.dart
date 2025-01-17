import 'package:contact_tracing_grenada/models/question.model.dart';

class UserModel {
  String gender;
  String firstName;
  String lastName;
  String address;
  String phoneNumber;
  String age;
  String email;
  String password;
  QuestionModel questions;

  UserModel({
    this.gender,
    this.firstName,
    this.lastName,
    this.address,
    this.phoneNumber,
    this.age,
    this.email,
    this.password,
    this.questions,
  });

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'gender': gender,
        'email': email,
        'address': address,
        'phoneNumber': phoneNumber,
        'questions': questions,
      };
}
