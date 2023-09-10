class Rent {
  int? id;
  int? customer;
  String? startDate;
  String? endDate;
  dynamic checkOutDate;
  int? totalDays;
  String? status;
  int? totalCost;
  int? lateFee;
  int? totalPayment;
  Car? car;

  Rent(
      {this.id,
      this.customer,
      this.startDate,
      this.endDate,
      this.checkOutDate,
      this.totalDays,
      this.status,
      this.totalCost,
      this.lateFee,
      this.totalPayment,
      this.car});

  Rent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    checkOutDate = json['check_out_date'];
    totalDays = json['total_days'];
    status = json['status'];
    totalCost = json['total_cost'];
    lateFee = json['late_fee'];
    totalPayment = json['total_payment'];
    car = json['car'] != null ? Car?.fromJson(json['car']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['customer'] = customer;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['check_out_date'] = checkOutDate;
    data['total_days'] = totalDays;
    data['status'] = status;
    data['total_cost'] = totalCost;
    data['late_fee'] = lateFee;
    data['total_payment'] = totalPayment;
    if (car != null) {
      data['car'] = car?.toJson();
    }
    return data;
  }
}

class Car {
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

  Car(
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

  Car.fromJson(Map<String, dynamic> json) {
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
