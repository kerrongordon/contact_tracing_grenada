import 'package:contact_tracing_grenada/models/user.model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userData = Provider.autoDispose((_) => UserModel());

final dataService = Provider.autoDispose<UserData>((_) => UserData());

class UserData extends StateNotifier<UserModel> {
  UserData() : super(UserModel());

  UserModel _user;

  UserModel get user => _user;

  UserModel adduser(UserModel user) {
    print(user.firstName);
    print(user.lastName);
    print(user.age);
    print(user.gender);
    print(user.optionOne);
    print(user.optionTwo);
    print(user.optionThree);
    print(user.optionFour);
    print(user.optionFive);
    return _user;
  }
}
