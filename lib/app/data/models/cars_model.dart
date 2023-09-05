class Cars {
  int? id;
  String? name;
  int? price;
  dynamic picture;

  Cars({this.id, this.name, this.price, this.picture});

  Cars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['picture'] = picture;
    return data;
  }
}
