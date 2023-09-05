class CarsDetail {
  int? id;
  String? name;
  String? carType;
  int? price;
  String? color;
  String? transmission;
  String? licensePlate;
  int? passengerCapacity;
  String? fuelCapacity;
  String? description;
  String? picture;
  bool? isBooked;

  CarsDetail(
      {this.id,
      this.name,
      this.carType,
      this.price,
      this.color,
      this.transmission,
      this.licensePlate,
      this.passengerCapacity,
      this.fuelCapacity,
      this.description,
      this.picture,
      this.isBooked});

  CarsDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    carType = json['car_type'];
    price = json['price'];
    color = json['color'];
    transmission = json['transmission'];
    licensePlate = json['license_plate'];
    passengerCapacity = json['passenger_capacity'];
    fuelCapacity = json['fuel_capacity'];
    description = json['description'];
    picture = json['picture'];
    isBooked = json['is_booked'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['car_type'] = carType;
    data['price'] = price;
    data['color'] = color;
    data['transmission'] = transmission;
    data['license_plate'] = licensePlate;
    data['passenger_capacity'] = passengerCapacity;
    data['fuel_capacity'] = fuelCapacity;
    data['description'] = description;
    data['picture'] = picture;
    data['is_booked'] = isBooked;
    return data;
  }
}
