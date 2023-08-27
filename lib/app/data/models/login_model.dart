class Login {
  String? password;
  String? username;

  Login({this.password, this.username});

  Login.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['password'] = password;
    data['username'] = username;
    return data;
  }
}
