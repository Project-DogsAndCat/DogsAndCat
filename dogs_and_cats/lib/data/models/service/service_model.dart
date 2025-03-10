import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  final String id;
  final String nameService;
  final String price;
  ServiceModel({
    required this.id,
    required this.nameService,
    required this.price,
  });

  Service toDomain() => Service(
        id: id,
        nameService: nameService,
        price: price,
      );

  factory ServiceModel.fromDomain(Service object) => ServiceModel(
        id: object.id,
        nameService: object.nameService,
        price: object.price,
      );

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
