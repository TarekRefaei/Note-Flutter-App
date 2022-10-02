class Person {
  String? username;
  String? password;
  String? email;
  String? intrestId;
  String? id;

  Person({
    this.username,
    this.password,
    this.email,
    this.intrestId,
    this.id,
  });

  Person.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    intrestId = json['intrestId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['intrestId'] = intrestId;
    data['id'] = id;
    return data;
  }
}
