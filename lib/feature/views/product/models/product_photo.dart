class ProductPhoto {
  late String bigImage;
  late String mediumImage;
  late String smallImage;


  ProductPhoto.fromJson(Map<String, dynamic> json) {
    bigImage = json['big'];
    mediumImage = json['thumbs']['768_1024'];
    smallImage = json['thumbs']['384_512'];
  }
}