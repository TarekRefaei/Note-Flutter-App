class Interest {
  String? intrestText;
  String? id;

  Interest({this.intrestText, this.id});

  Interest.fromJson(Map<String, dynamic> json) {
    intrestText = json['intrestText'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['intrestText'] = intrestText;
    data['id'] = id;
    return data;
  }
}
