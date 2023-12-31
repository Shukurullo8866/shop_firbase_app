// ignore_for_file: unused_import

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/product_model.dart';
import 'package:shop_firbase_app/screens/auth/widgets/repositories/product_repocitory.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository productRepository;
  ProductViewModel({
    required this.productRepository,
  }) {
    listenProducts('');
  }

  late StreamSubscription subscription;

  List<ProductModel> products = [];
  List<ProductModel> productsAdmin = [];
  listenProducts(String categoryId) async {
    subscription = productRepository
        .getProducts(category_Id: categoryId)
        .listen((allProducts) {
      if (categoryId.isEmpty) productsAdmin = allProducts;
      products = allProducts;
      notifyListeners();
    });
  }

  addProduct(ProductModel productModel) =>
      productRepository.addProduct(productModel: productModel);
  updateProduct(
    ProductModel productModel,
  ) =>
      productRepository.updateProduct(productModel: productModel);
  deleteProduct(String docId) => productRepository.deleteProduct(docId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
