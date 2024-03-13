import 'package:slash_app/models/brand.dart';
import 'package:slash_app/models/product_variation.dart';

class Product {
  final int id;
  final String name;
  final String productImage;
  final String description;
  final int price;

  final int brandId;

  final Brand brand;

  final String? brandName;

  final String? brandLogoUrl;

   List<ProductVariation>? variations;

  Product(
      {required this.productImage,
      required this.id,
      required this.name,
      required this.description,
      required this.brand,
      required this.brandId,
      required this.brandLogoUrl,
      required this.brandName,
      required this.price});

  factory Product.fromJson(json) {
    return Product(
      name: json['name'],
      description: json['description'],
      brand: Brand(
          brandLogoImagePath: json['Brands']['brand_logo_image_path'],
          id: json['Brands']['id'],
          brandName: json['Brands']['brand_name']),
      brandId: json['brand_id'],
      brandLogoUrl: json['Brands']['brand_logo_image_path'] ?? '',
      brandName: json['Brands']['brand_name'] ?? '',
      id: json['id'],
      productImage: json['ProductVariations'][0]['ProductVarientImages'][0]
          ['image_path'],
      price: json['ProductVariations'][0]['price'],
    );
  } //(multiple colors or non, multiple sizes or non, materi
}
