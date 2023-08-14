import 'package:flutter/material.dart';

import '../../../../data/model/product_model.dart';
import '../widgets/all_product.dart';

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.data, required this.productList});
  ProductModel data;
  List productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: 10.0, // Spacing between grid items vertically
          crossAxisSpacing: 10.0, // Spacing between grid items horizontally
          childAspectRatio: 0.88, // Aspect ratio of each grid item
        ),
        scrollDirection: Axis.vertical,
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductsScreen(data: data);
        },
      ),
    );
  }
}
