import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_grenada/models/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider.autoDispose((_) => AuthService());

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<User> get isLogin => _auth.authStateChanges();

  Future<User> signUp({UserModel data}) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: data.email, password: data.password);

    await db
        .collection('users')
        .doc(user.user.uid)
        .collection('profile')
        .add(data.toJson());
    await signIn(email: data.email, password: data.password);
    return user.user;
  }

  Future<User> signIn({String email, String password}) async {
    UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  Future<void> restPassword({String email}) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    return await _auth.signOut();
  }

  Future<void> addProfile({UserModel user}) async {
    final name = '${user.firstName} ${user.lastName}';
    return await _auth.currentUser.updateProfile(displayName: name);
  }
}
