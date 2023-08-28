class User {
  int? id;
  String? fullName;
  String? email;
  String? gender;
  String? birthDate;
  String? phoneNumber;
  String? nik;
  String? profilePicture;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.gender,
      this.birthDate,
      this.phoneNumber,
      this.nik,
      this.profilePicture});

  User.fromJson(json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    phoneNumber = json['phone_number'];
    nik = json['nik'];
    profilePicture = json['profile_picture'];
  }

  toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['email'] = email;
    data['gender'] = gender;
    data['birth_date'] = birthDate;
    data['phone_number'] = phoneNumber;
    data['nik'] = nik;
    data['profile_picture'] = profilePicture;
    return data;
  }
}
