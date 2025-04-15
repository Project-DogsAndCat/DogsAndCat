class OrderModel {
  OrderModel({
    this.id,
    required this.serviceId,
    required this.duration,
    required this.price,
    required this.date,
    this.status = Status.waiting,
  });
  final String? id;
  final String serviceId;
  final String duration;
  final double price;
  final DateTime date;
  final Status? status;
}

enum Status {
  waiting('В ожидании'),
  adopted('Принят'),
  refusal('Отказ'),
  done('Выполнено');

  const Status(this.value);
  final String value;
}
