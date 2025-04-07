import 'package:yandex_mapkit/yandex_mapkit.dart';

final class SearchResponseItem {
  final String name;
  final SearchItemToponymMetadata? metadata;

  const SearchResponseItem({
    required this.name,
    required this.metadata,
  });
}
