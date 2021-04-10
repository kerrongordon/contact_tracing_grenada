import 'package:contact_tracing_grenada/models/user.model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dataService = Provider.autoDispose<UserModel>((_) => UserData());

class UserData extends StateNotifier<UserModel> {
  UserData() : super(UserModel());

  UserModel adduser(UserModel user) {
    print(user.firstName);
    print(user.lastName);
    print(user.age);
    print(user.gender);
    return user;
  }
}
