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
  final Status status;

  OrderModel copyWith({
    String? serviceId,
    String? duration,
    double? price,
    DateTime? date,
    Status? status,
  }) {
    return OrderModel(
      id: id,
      serviceId: serviceId ?? this.serviceId,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }
}

enum Status {
  waiting('В ожидании'),
  adopted('Принят'),
  refusal('Отменен'),
  done('Выполнено');

  const Status(this.value);
  final String value;
}
