import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:slash_app/components/product.dart';
import 'package:slash_app/components/product_list_view.dart';
import 'package:slash_app/models/product.dart';
import 'package:slash_app/services/products_services.dart';

class ProductsListViewBuilder extends StatefulWidget {
  const ProductsListViewBuilder({super.key});

  @override
  State<ProductsListViewBuilder> createState() =>
      _ProductsListViewBuilderState();
}

class _ProductsListViewBuilderState extends State<ProductsListViewBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = AllProductsService(Dio()).getAllProducts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Slash.",
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ProductsListView(list: snapshot.data as List<Product>)
                    : snapshot.hasError
                        ? SliverToBoxAdapter(
                            child: Text('oops there\'s an error'))
                        : SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()));
              })
        ],
      ),
    );
  }
}
