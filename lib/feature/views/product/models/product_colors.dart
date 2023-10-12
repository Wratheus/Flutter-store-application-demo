class ProductColors {
  late String colorName;
  late String colorValue;
  List<String> otherColors = [];

  ProductColors.fromJson(Map<String, dynamic> json) {
    colorValue = json['current']['value'];
    colorName = json['current']['name'];
    if ((json['other'] as List).isNotEmpty) {
      json['other'].forEach((elem) {
        otherColors.add(elem['value']);
      });
    }
  }

  ProductColors(this.colorName, this.colorValue, this.otherColors);
}
