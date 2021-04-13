enum SightType { MUSEUM, SPECIAL_PLACE, HOTEL, RESTAURANT, PARK, COFFE }

extension SightTypeTextConverted on SightType {
  //
  //  todo as Types grow add function which make this conversion
  //
  String toUiString() {
    switch (this) {
      case SightType.MUSEUM:
        return "Musem";

      case SightType.RESTAURANT:
        return "Restaurant";

      case SightType.COFFE:
        return "Coffe";

      case SightType.HOTEL:
        return "Hotel";

      case SightType.PARK:
        return "Park";

      case SightType.SPECIAL_PLACE:
        return "Specia Place";
    }
    return "";
  }
}
