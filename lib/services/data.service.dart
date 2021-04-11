import 'package:contact_tracing_grenada/models/user.model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userData = Provider.autoDispose((_) => UserModel());

final dataService = Provider.autoDispose<UserData>((_) => UserData());

class UserData extends StateNotifier<UserModel> {
  UserData() : super(UserModel());

  UserModel _user;

  UserModel get user => _user;

  UserModel adduser(UserModel user) {
    return _user;
  }
}
