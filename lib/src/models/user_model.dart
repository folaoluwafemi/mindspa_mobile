import 'package:firebase_auth/firebase_auth.dart' as firebase;

class UserModel {
  final String? uid;
  final String? emailAddress;
  final String? displayName;

  UserModel({
    required this.uid,
    required this.emailAddress,
    required this.displayName,
  });

  factory UserModel.fromDatabase(firebase.User? user) => UserModel(
        uid: user!.uid,
        emailAddress: user.email,
        displayName: user.displayName,
      );
}
