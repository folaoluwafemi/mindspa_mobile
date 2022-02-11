import 'dart:io';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../UI/authentication/model/user_params.dart';
import 'user_service.dart';

import 'base/failure.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final User? _firebaseAuth2 = FirebaseAuth.instance.authStateChanges();

  final GoogleSignIn googleSignIn = GoogleSignIn();

  User? get loggedInUser => _firebaseAuth.currentUser;

  //Setup Stream to detect user authentication state and passed the return value to the user model class to better construct the user
  Stream<UserModel> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => UserModel.fromFirebase(user));
  }

  Future<UserModel> register({required UserParams params}) async {
    try {
      final UserCredential _userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.emailAddress,
        password: params.password,
      );
      _userCredential.user!.updateDisplayName(params.fullName);

      await _userCredential.user!.sendEmailVerification();
      return UserModel.fromFirebase(_userCredential.user);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    } on SocketException catch (ex) {
      throw Failure(ex.toString());
    }
  }

  Future<UserModel> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final UserCredential _userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (!_userCredential.user!.emailVerified) {
        await _firebaseAuth.signOut();
        throw Failure('Email is not verified, Pls Check Your Email');
      }
      return UserModel.fromFirebase(_userCredential.user);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

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

        return UserModel.fromFirebase(_userCredential.user);
      } on FirebaseAuthException catch (ex) {
        throw Failure(ex.message ?? 'Something went wrong!');
      }
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = _firebaseAuth.currentUser;
      await user?.sendEmailVerification();
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    } on SocketException catch (ex) {
      throw Failure(
          'You are not connected to the internet\n Error: ${ex.message}');
    } catch (ex) {
      throw Failure(ex.toString());
    }
  }

  Future<void> checkVerificationAccount() async {
    try {
      await _firebaseAuth.currentUser?.reload();
    } on SocketException catch (ex) {
      throw Failure(
          'You are not connected to the internet\n Error: ${ex.message}');
    } on FirebaseException catch (ex) {
      throw Failure('Unable to verify email\n Error: ${ex.message}');
    } catch (ex) {
      ex.toString();
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
