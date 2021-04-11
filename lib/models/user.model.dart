class UserModel {
  String firstName;
  String lastName;
  int age;
  String gender;
  bool optionOne;
  bool optionTwo;
  bool optionThree;
  bool optionFour;
  bool optionFive;

  UserModel({
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
    this.optionOne = false,
    this.optionTwo = false,
    this.optionThree = false,
    this.optionFour = false,
    this.optionFive = false,
  });
}
