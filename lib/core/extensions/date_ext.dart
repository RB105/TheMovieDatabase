extension DateExtension on String {
  String toDate() {
    String result = "";
    for (int i = 0; i < 10; i++) {
      if (this[i] == "-") {
        result += ".";
      } else {
        result += this[i];        
      }
    }
    return result;
  }
}
