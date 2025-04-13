class Order {
  Order({
    this.id,
    this.titleService,
    this.namePet,
    required this.idService,
    required this.duration,
    required this.price,
    required this.date,
    required this.time,
    // required this.idPet,
    required this.status,
  });
  final String? id;
  final String? titleService;
  final String? namePet;
  final String idService;
  final String duration;
  final double price;
  final String date;
  final String time;
  // final String idPet;
  final String status;
}
