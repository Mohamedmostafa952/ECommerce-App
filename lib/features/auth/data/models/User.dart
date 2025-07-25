/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttii40123mmmmmmm@gmail.com"
/// role : "user"

class User {
  const User({required this.name, required this.email, required this.role});

  factory User.fromJson(dynamic json) {
    return User(name: json['name'], email: json['email'], role: json['role']);
  }

  final String name;
  final String email;
  final String role;
}
