// ignore_for_file: constant_identifier_names

enum UnitType { Number, Litre, Kg, Kwh, Your, M, Mm }

extension UnitTypeToNumber on UnitType {
  int get toInt {
    switch (this) {
      case UnitType.Number:
        return 0;
      case UnitType.Litre:
        return 1;
      case UnitType.Kg:
        return 2;
      case UnitType.Kwh:
        return 3;
      case UnitType.Your:
        return 4;
      case UnitType.M:
        return 5;
      case UnitType.Mm:
        return 6;
    }
  }
}
