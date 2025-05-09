import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/domain/models/service.dart';

class Dogsitter {
  Dogsitter({
    required this.id,
    required this.rating,
    required this.status,
    required this.person,
    this.serviceIds,
  });
  final String id;
  final double rating;
  final StatusDogSitter status;
  final Person person;
  final List<Service>? serviceIds;
}

enum StatusDogSitter {
  busy('Занят'),
  free('Свободен');

  const StatusDogSitter(this.value);
  final String value;
}
