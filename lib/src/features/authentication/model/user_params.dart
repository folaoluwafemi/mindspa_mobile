class UserParams {
  final String? fullName;
  final String emailAddress;
  final String password;

  UserParams({
    this.fullName,
    required this.emailAddress,
    required this.password,
  });
}
