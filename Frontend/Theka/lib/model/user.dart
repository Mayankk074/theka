class User{
  int? userId;
  int? profileId;
  String? email;

  User({this.userId, this.profileId, this.email});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      profileId: json['profileId'],
      email: json['email']
    );
  }
}