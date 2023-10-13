import 'package:lichi_test/feature/views/product/models/product_colors.dart';
import 'package:lichi_test/feature/views/product/models/product_photo.dart';

class Product {
  late int id;
  late String brandName;
  late String categoryId;
  late String categoryName;
  late String type;
  late String article;
  late num popular;
  late String price;
  final List<ProductPhoto> photos = [];
  late String name;
  late String descriptions;
  late String modelSize;
  late final ProductColors colors;

  Product({
    required this.id,
    required this.brandName,
    required this.categoryId,
    required this.categoryName,
    required this.type,
    required this.article,
    required this.popular,
    required this.price,
    required this.name,
    required this.descriptions,
    required this.modelSize,
  });

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'] ?? 0;
    brandName = json['brand_name'] ?? "";
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    type = json['type'];
    article = json['article'];
    popular = json['popular'];
    price = json['price'].toString();
    json['photos'].forEach((photoJson) {
      photos.add(ProductPhoto.fromJson(photoJson));
    });
    descriptions = json['descriptions']['mark_down'];
    try {
      modelSize = json['model']["size"];
    } catch (e) {
      modelSize = "";
    }
    colors = ProductColors.fromJson(json['colors']);
  }

  @override
  String toString() {
    return 'Product{id: $id, brandName: $brandName, categoryId: $categoryId, categoryName: $categoryName, type: $type, article: $article, popular: $popular, price: $price, photos: $photos, name: $name, descriptions: $descriptions, modelSize: $modelSize, colors: $colors}';
  }
}
