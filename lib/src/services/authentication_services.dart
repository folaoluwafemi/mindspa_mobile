import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../UI/authentication/model/user_params.dart';

import 'base/failure.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  User? get loggedInUser => _firebaseAuth.currentUser;

  Future<void> register({required UserParams params}) async {
    try {
      final UserCredential _userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.emailAddress,
        password: params.password,
      );
      _userCredential.user!.updateDisplayName(params.fullName);

      await _userCredential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    } on SocketException catch (ex) {
      throw Failure(ex.toString());
    }
  }

  Future<void> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final UserCredential _userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      // if (!_userCredential.user!.emailVerified) {
      //   await _firebaseAuth.signOut();
      //   throw Failure('Email is not verified, Pls Check Your Email');
      // }
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  Future<User?> loginWithGoogle() async {
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

        return _userCredential.user;
      } on FirebaseAuthException catch (ex) {
        throw Failure(ex.message ?? 'Something went wrong!');
      }
    }
  }

  Future<void> resetPassword(String emailAddress) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: emailAddress);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  Future<void> updateUser({required String fullName}) async {
    try {
      await loggedInUser?.updateDisplayName(fullName);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

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

  Future<void> logout() async {
    if (!kIsWeb) {
      await googleSignIn.signOut();
    }
    await _firebaseAuth.signOut();
  }
}
