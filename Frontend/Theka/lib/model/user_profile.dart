import 'package:theka/model/user.dart';

class UserProfile{
  int? id;
  String? name;
  int? phone;
  String? address;
  String? profilePicUrl;
  String? bio;
  //can be null for client
  String? skills; // comma-separated or @ElementCollection
  int? experienceYears;
  String? serviceType;

  UserProfile({this.id,  this.name, this.phone, this.address,
    required this.bio, this.experienceYears, this.skills, this.profilePicUrl, this.serviceType});

  factory UserProfile.fromJson(Map<String, dynamic> json){
    return UserProfile(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      bio: json['bio'],
      skills: json['skills'],
      experienceYears: json['experienceYears'],
      serviceType: json['serviceType']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "name": name,
      "phone": phone,
      "address": address,
      "profilePicUrl": profilePicUrl ?? "No DP",
      "bio": bio,
      "skills": skills ?? "No Skills",
      "experience": experienceYears ?? 0,
      "serviceType": serviceType ?? "NA"
    };
  }
}