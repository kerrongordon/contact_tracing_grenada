import 'package:contact_tracing_grenada/models/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider.autoDispose((_) => AuthService());

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get isLogin => _auth.authStateChanges();

  Future<User> login() async {
    try {
      UserCredential user = await _auth.signInAnonymously();
      return user.user;
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<void> logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<void> addProfile({UserModel user}) async {
    final name = '${user.firstName} ${user.lastName}';
    try {
      return await _auth.currentUser.updateProfile(displayName: name);
    } catch (e) {
      throw (e.toString());
    }
  }
}
