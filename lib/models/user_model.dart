class UserModel {
  late String userName;
  late int userId;
  late String userEmail;
  late String gender;

  UserModel(this.userName, this.userId, this.gender, this.userEmail);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(json['name'], json["id"], json["gender"], json["email"]);
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(json['name'], json["id"], json["gender"], json["email"]);
  }
}
