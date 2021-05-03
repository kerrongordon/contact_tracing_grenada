import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:contact_tracing_grenada/models/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider.autoDispose((_) => AuthService());

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<User> get isLogin => _auth.authStateChanges();

  Stream<List<QuestionModel>> allAnwser() {
    final uid = _auth.currentUser.uid;
    Stream<QuerySnapshot> query = _db
        .collection('users')
        .doc(uid)
        .collection('answers')
        .orderBy('timestamp', descending: true)
        .snapshots();

    return query.map((element) =>
        element.docs.map((e) => QuestionModel.fromJson(e.data())).toList());
  }

  Stream<List<QuestionModel>> lastOneAnwser() {
    final uid = _auth.currentUser.uid;
    Stream<QuerySnapshot> query = _db
        .collection('users')
        .doc(uid)
        .collection('answers')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .snapshots();

    return query.map((element) =>
        element.docs.map((e) => QuestionModel.fromJson(e.data())).toList());
  }

  saveAnwser(QuestionModel data) async {
    final uid = _auth.currentUser.uid;
    return await _db
        .collection('users')
        .doc(uid)
        .collection('answers')
        .add(data.toJson());
  }

  Future<User> signUp({UserModel data}) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: data.email, password: data.password);

    await _db
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
