import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/product_model.dart';
import '../../../../view_model/product_view_model.dart';
import 'all_product.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, productViewModel, child) {
        if (productViewModel.products.isNotEmpty) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                ProductModel product = productViewModel.products[index];
                return ProductsScreen(data: product);
              },
              childCount: productViewModel.products.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.90,
              mainAxisSpacing: 8.5,
              crossAxisSpacing: 5,
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: Center(child: Text("error")));
        }
      },
    );
  }
}
