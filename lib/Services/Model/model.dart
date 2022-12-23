// import 'dart:convert';

// ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

class ProductModel {
  final String productName;
  final List<String> imgUrlList;
  final String brand;
  final String price;
  final String category;
  final String description;
  final bool newArrival;

  ProductModel(
      {required this.productName,
      required this.imgUrlList,
      required this.brand,
      required this.price,
      required this.category,
      required this.description,
      required this.newArrival});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        productName: json['product_name'],
        imgUrlList: json['image'],
        brand: json['brand'],
        price: json['actualPrice'],
        category: json['category'],
        description: json['description'],
        newArrival: json['new']);
  }
}
