import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class SightService {
  SightService._privateConstructor();
  static SightService get instance => _instance;
  static final SightService _instance = SightService._privateConstructor();

  List<Sight> wantToVisit = mocks.sublist(0, (mocks.length / 2).round());
  List<Sight> visited = mocks.sublist((mocks.length / 2).round(), mocks.length);
}
