class Rent {
  int? id;
  int? car;

  Rent({this.id, this.car});

  Rent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    car = json['car'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['car'] = car;
    return data;
  }
}
