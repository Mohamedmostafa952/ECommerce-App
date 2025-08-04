class RegisterRequestEntity {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  const RegisterRequestEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });
}
