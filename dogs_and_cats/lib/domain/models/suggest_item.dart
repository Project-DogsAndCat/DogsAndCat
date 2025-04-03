import 'package:yandex_mapkit/yandex_mapkit.dart';

final class SuggestResponseItem {
  final String title;
  final String? subtitle;
  final String displayText;
  final Point? point;

  const SuggestResponseItem({
    required this.title,
    required this.subtitle,
    required this.displayText,
    required this.point,
  });
}
