import 'package:flutter/material.dart';
import 'package:slash_app/components/product.dart';
import 'package:slash_app/models/product.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.list});
  final List<Product> list;
  @override
  Widget build(BuildContext context) {
    // return SliverToBoxAdapter(
    //     child: Container(
    //   height: 500,
    //   child: ListView.builder(
    //       scrollDirection: Axis.vertical,
    //       shrinkWrap: true,
    //       physics: const NeverScrollableScrollPhysics(),
    //       itemCount: list.length,
    //       itemBuilder: (context, index) {
    //         return ProductItem(
    //           product: list[index],
    //         );
    //       }),
    // ));
    return SliverList(
        delegate: SliverChildBuilderDelegate(
          
          childCount: list.length,
            (context, index) {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ProductItem(
            product: list[index],
          ));
    }));
  }
}
