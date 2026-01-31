class UserProfile{

  String name;
  UserProfile({required this.name});
  Map<String, dynamic> toJson(UserProfile profile){
    return {
      name: profile.name
    };
  }
}