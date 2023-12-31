// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';
import 'package:shop_firbase_app/screens/tab_box/home_page/product_by_category/products_item.dart';
import '../../../../utils/app_image.dart';
import '../../../../view_model/product_view_model.dart';

// ignore: must_be_immutable
class ProductByCategory extends StatefulWidget {
  ProductByCategory({super.key, required this.data});
  CategoryModel data;

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Image.asset(AppImage.d_r, height: 100.h, width: 190.w),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: const Color.fromARGB(255, 221, 133, 2),
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, productViewModel, child) {
          // ignore: unnecessary_null_comparison
          if (productViewModel.products == null) {
            return const Center(
              child: Text("Data is empty "),
            );
          }
          if (productViewModel.products.isEmpty) {
            return const Center(
              child: Text("Data is empty "),
            );
          }
          if (productViewModel.products.isNotEmpty) {
            List productList = [];
            var productc;
            productViewModel.products
                .where(
                    (product) => widget.data.categoryId == product.categoryId)
                .forEach(
              (product) {
                productc = product;
                productList.add(product);
              },
            );
            return ProductItem(
              data: productc,
              productList: productList,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
