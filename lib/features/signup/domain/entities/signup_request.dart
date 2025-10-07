class SignupRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SignupRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
