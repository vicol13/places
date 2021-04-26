import 'package:places/domain/sight_type.dart';

class Sight {
  final String id;
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final SightType type;

  Sight({this.id, this.details, this.lat, this.lon, this.name, this.type, this.url});
}
