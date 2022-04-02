import '../../UI/authentication/model/user_params.dart';
import '../../models/user_model.dart';

abstract class AuthService {
  Stream get user;
  Future<UserModel> register({required UserParams params});
  Future<UserModel> login({required UserParams params});
  Future loginWithGoogle();
  Future<void> resetPassword(String emailAddress);
  Future<void> updateUser({required String fullName});
  Future<void> updateEmail({
    required String newEmailAddress,
    required String password,
  });
  Future<UserModel> getUserDetails();
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<void> logout();
}
