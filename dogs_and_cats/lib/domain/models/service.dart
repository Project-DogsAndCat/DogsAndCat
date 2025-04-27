class Service {
  final String id;
  final String title;
  final String description;
  final String? image;
  Service({
    required this.id,
    required this.title,
    required this.description,
    this.image,
  });
}
