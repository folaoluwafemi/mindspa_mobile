import 'package:firebase_auth/firebase_auth.dart' as firebase;

class UserModel {
  String? uid;
  String? emailAddress;

  UserModel({
    required this.uid,
    required this.emailAddress,
  });

  factory UserModel.fromFirebase(firebase.User? user) => UserModel(
        uid: user!.uid,
        emailAddress: user.email,
      );
}
