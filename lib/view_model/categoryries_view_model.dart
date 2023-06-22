import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';
import 'package:shop_firbase_app/ui/auth/widgets/repositories/categories_repository.dart';

class CategoriesViewModel extends ChangeNotifier {
  final CategoryRepository categoryRepository;

  CategoriesViewModel({required this.categoryRepository});

  List<CategoryModel> categories = [];

  Stream<List<CategoryModel>> listenCategories() => categoryRepository.getCategory();

  addCategory(CategoryModel categoryModel) =>
      categoryRepository.addCategory(categoryModel: categoryModel);

  updateCategory(CategoryModel categoryModel) =>
      categoryRepository.updateCategory(categoryModel: categoryModel);

  deleteCategory(String docId) =>
      categoryRepository.deleteCategory(docId: docId);
}
 