import 'package:places/domain/sight.dart';
import '../mocks.dart';
import 'dart:math' as Math;

///
/// contains related filtering and searching
/// todo move filters in this class or create filtering service
///
class SearchService {
  //signleton definition 
  SearchService._privateConstructor();
  static SearchService get instance => _instance;
  static final SearchService _instance = SearchService._privateConstructor();

  //current position hardcoded
  double _curentLt = 47.026878818161634;
  double _currentLg = 28.840820869198012;

  //range filter
  double _minKm = 100;
  double _maxKm = 10000;

  set minKmRange(double newMinRange) {
    this._minKm = newMinRange;
  }

  set maxKmRange(double newMaxRange) {
    this._maxKm = newMaxRange;
  }

  double get maxKmRangeValue {
    return this._maxKm;
  }

  double get minKmRangeValue {
    return this._minKm;
  }

  ///
  /// return list of sights which contain [input] in sight name
  /// matching range filter
  ///
  Future<List<Sight>> filterByName(String input) async {
    return mocks
        .where((sight) => sight.name._containsIngoreCase(input))
        .where((sight) => isMatchingRangeFilter(sight))
        .toList();
  }

  ///
  /// this function calculate distance from user,
  /// based on current location [_curentLt,_currentLg]
  /// to sight
  ///
  int getDistance(double sightLT, double sightLg) {
    var ky = 40000 / 360;
    var kx = Math.cos(Math.pi * _curentLt / 180.0) * ky;
    var dx = (_currentLg - sightLg).abs() * kx;
    var dy = (_curentLt - _curentLt).abs() * ky;
    return Math.sqrt((dx * dx + dy * dy)).round();
  }

  ///
  /// this function check if sight is in selected range
  ///
  bool isMatchingRangeFilter(Sight sight) {
    return this._minKm < getDistance(sight.lat, sight.lon) &&
        this._maxKm > getDistance(sight.lat, sight.lon);
  }
}


extension _Utils on String {
  bool _containsIngoreCase(String input) {
    return this.toLowerCase().contains(input.toLowerCase());
  }
}
