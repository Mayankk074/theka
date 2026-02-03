class UserProfile{

  String name;
  int phone;
  String address;
  String? profilePicUrl;
  String bio;
  //can be null for client
  String? skills; // comma-separated or @ElementCollection
  int? experienceYears;
  String? serviceType;

  UserProfile({required this.name, required this.phone, required this.address,
    required this.bio, this.experienceYears, this.skills, this.profilePicUrl, this.serviceType});
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