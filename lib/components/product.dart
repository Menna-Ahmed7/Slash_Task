import 'package:flutter/material.dart';
import 'package:slash_app/components/product_details.dart';
import 'package:slash_app/models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    String productFullName = product.brandName! + '-' + product.name;
    String price = 'EGP ' + product.price.toString();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print('ss' + product.name);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetails(product: product,)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.3,
                    color: Colors.white,
                    child: Image.network(product.productImage)),
                borderRadius: BorderRadius.circular(30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  maxLines: 1,
                  productFullName,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(price,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
