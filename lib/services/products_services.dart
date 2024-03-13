import 'package:dio/dio.dart';
import 'package:slash_app/models/brand.dart';
import 'package:slash_app/models/product.dart';
import 'package:slash_app/models/product_variation.dart';

class AllProductsService {
  final Dio dio;
  AllProductsService(this.dio);
  Future<List<Product>> getAllProducts() async {
    try {
      Response response = await dio
          .get("https://slash-backend.onrender.com/product/?limit=20&page=1");
      // print('hh' + response.data['data'][0]['name'].toString());
      // print('hh' + response.data['data'][0]['description'].toString());

      // List<Product> list = response.data['data'].map((item) {
      //   print('oo' + item.toString());
      //   Product p = new Product(
      //     name: item['name'],
      //     description: item['description'],
      //     brand: Brand(
      //         brandLogoImagePath: item['Brands']['brand_logo_image_path'],
      //         id: item['Brands']['id'],
      //         brandName: item['Brands']['brand_name']),
      //     brandId: item['brand_id'],
      //     brandLogoUrl: item['Brands']['brand_logo_image_path'] ?? '',
      //     brandName: item['Brands']['brand_name'] ?? '',
      //     id: item['id'],
      //   );
      //   print('h' + p.toString());
      //   return p;
      // }).toList();
      // print(list.toString());
      List<dynamic> products = response.data['data'];
      List<Product> productsList = [];
      for (var p in products) {
        List<String> variationImages = [];
        for (var v in p["ProductVariations"]) {
          variationImages.add(v['ProductVarientImages'][0]['image_path']);
        }

        Product p1 = Product.fromJson(p);
        productsList.add(p1);
      } // List<dynamic> l = response.data['data']
      //     .map((item) => {(item['id'].toString())})
      //     .toList();
      // print(productsList);
      return productsList;
    } catch (e) {
      return [];
    }
  }
}
