import 'package:places/domain/sight_type.dart';

class Sight {
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final SightType type;

  Sight({this.details,this.lat,this.lon,this.name,this.type,this.url});
}
