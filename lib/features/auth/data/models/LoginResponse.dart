import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttii40123mmmmmmm@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4Njg1YTNmMDdkOTk4OWYzMDAwNmE5MiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzUxNjcwMTk5LCJleHAiOjE3NTk0NDYxOTl9.OOdpmjeZ3zeSA0GGGQPyFmIqf_io-WUaJNRTgahKMtU"

class LoginResponse {
  const LoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(
      message: json['message'],
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  final String message;
  final User user;
  final String token;
}
