class OrderModel {
  OrderModel({
    this.id,
    this.titleService,
    this.namePet,
    required this.idService,
    required this.duration,
    required this.price,
    required this.date,
    required this.time,
    required this.status,
  });
  final String? id;
  final String? titleService;
  final String? namePet;
  final String idService;
  final String duration;
  final double price;
  final DateTime date;
  final String time;
  final Status status;
}

enum Status {
  cancel('Отменен'),
  expected('Ожидается'),
  adopted('Принят'),
  completed('Выполнен');

  const Status(this.value);
  final String value;
}
