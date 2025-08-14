class User{
  int? id;
  String? email;
  String? password;

  User({this.id, this.password, this.email});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      password: json['password'],
      email: json['email']
    );
  }
}