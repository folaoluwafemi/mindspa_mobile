import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindspa_mobile/src/services/Authentication/auth_service.dart';

import '../../UI/authentication/model/user_params.dart';
import '../../models/user_model.dart';
import '../base/failure.dart';

class FirebaseAuthService extends AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  User? get loggedInUser => _firebaseAuth.currentUser;

  //Setup Stream to detect user authentication state and passed the return value to the user model class to better construct the user
  @override
  Stream get user {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<UserModel> register({required UserParams params}) async {
    try {
      final UserCredential _userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.emailAddress,
        password: params.password,
      );
      _userCredential.user!.updateDisplayName(params.fullName);

      await _userCredential.user!.sendEmailVerification();
      return UserModel.fromDatabase(_userCredential.user);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    } on SocketException catch (ex) {
      throw Failure(ex.toString());
    }
  }

  @override
  Future<UserModel> login({required UserParams params}) async {
    try {
      final UserCredential _userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: params.emailAddress,
        password: params.password,
      );

      return UserModel.fromDatabase(_userCredential.user);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  @override
  Future loginWithGoogle() async {
    final googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final googleSignInAuth = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAuth.idToken,
      );

      try {
        final UserCredential _userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        return UserModel.fromDatabase(_userCredential.user);
      } on FirebaseAuthException catch (ex) {
        throw Failure(ex.message ?? 'Something went wrong!');
      }
    }
  }

  @override
  Future<void> resetPassword(String emailAddress) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: emailAddress);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  @override
  Future<void> updateUser({required String fullName}) async {
    try {
      await loggedInUser?.updateDisplayName(fullName);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  @override
  Future<void> updateEmail({
    required String newEmailAddress,
    required String password,
  }) async {
    try {
      final AuthCredential authCredential = EmailAuthProvider.credential(
        email: loggedInUser!.email!,
        password: password,
      );

      await loggedInUser?.reauthenticateWithCredential(authCredential);

      await loggedInUser?.updateEmail(newEmailAddress);

      await loggedInUser?.sendEmailVerification();
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  @override
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final AuthCredential authCredential = EmailAuthProvider.credential(
        email: loggedInUser!.email!,
        password: oldPassword,
      );

      await loggedInUser?.reauthenticateWithCredential(authCredential);

      await loggedInUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  @override
  Future<void> logout() async {
    if (!kIsWeb) {
      await googleSignIn.signOut();
    }
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserModel> getUserDetails() async {
    try {
      User? user = _firebaseAuth.currentUser;
      return UserModel.fromDatabase(user);
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message.toString());
    } on FirebaseException catch (e) {
      throw Failure(e.message.toString());
    } on SocketException catch (e) {
      throw Failure(e.message);
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
