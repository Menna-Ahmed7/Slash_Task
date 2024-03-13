import 'package:slash_app/models/product_variant_image.dart';

class ProductVariation {
  int id;

  int productId;

  double price;


  List<ProductVariantImage> productVariantImages;
  ProductVariation({
    required this.id,
    required this.productId,
    required this.price,
    required this.productVariantImages,
  });
}
