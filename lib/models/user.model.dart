class UserModel {
  String firstName;
  String lastName;
  int age;
  String gender;

  UserModel({
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
  });

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'gender': gender,
      };
}
