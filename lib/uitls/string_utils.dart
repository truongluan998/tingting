class StringUtils {
  static bool isNullOrEmpty(String? s) => (s == null || s.isEmpty) ? true : false;

  static bool isNotNullOrEmpty(String? s) => !isNullOrEmpty(s);

  static String? onlyString(List<dynamic>? listText) =>
      listText?.reduce((value, element) => value + "," + element) ?? '';
}
