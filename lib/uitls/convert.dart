class Convert {
  static int convertBoolToInt(bool? value) {
    return value == true ? 1 : 0;
  }

  static bool convertIntToBool(int? value) {
    return value == 1 ? true : false;
  }
}
