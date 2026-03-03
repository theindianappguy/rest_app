import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:rest_app/models/dart.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Convert Firebase [User] to [AppUser].
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  /// Auth state change stream.
  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  /// Sign in anonymously.
  Future<AppUser?> signInAnom() async {
    try {
      final UserCredential result = await _auth.signInAnonymously();
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// Sign in with email and password.
  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// Sign up with email and password.
  Future<AppUser?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential result =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// Sign out.
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
