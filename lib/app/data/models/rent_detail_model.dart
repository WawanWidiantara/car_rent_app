class RentDetail {
  int? id;
  int? customer;
  int? car;
  String? status;
  String? startDate;
  String? endDate;
  int? totalCost;
  int? totalDays;
  int? lateFee;

  RentDetail(
      {this.id,
      this.customer,
      this.car,
      this.status,
      this.startDate,
      this.endDate,
      this.totalCost,
      this.totalDays,
      this.lateFee});

  RentDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'];
    car = json['car'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    totalCost = json['total_cost'];
    totalDays = json['total_days'];
    lateFee = json['late_fee'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['customer'] = customer;
    data['car'] = car;
    data['status'] = status;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['total_cost'] = totalCost;
    data['total_days'] = totalDays;
    data['late_fee'] = lateFee;
    return data;
  }
}
