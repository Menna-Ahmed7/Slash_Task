import 'package:flutter/material.dart';
import 'package:slash_app/models/product.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    String price = 'EGP ' + widget.product.price.toString();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("Product details",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            Center(
              child: ClipRRect(
                child: Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.3,
                    color: Colors.white,
                    child: Image.network(widget.product.productImage)),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 1,
                        widget.product.name,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(price,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ))
                    ],
                  ),
                  Container(
                    width: screenWidth * 0.3,
                    child: Column(
                      children: [
                        ClipRRect(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Image.network(
                              widget.product.brandLogoUrl!,
                              fit: BoxFit.fill,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            maxLines: 1,
                            widget.product.brandName!,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
