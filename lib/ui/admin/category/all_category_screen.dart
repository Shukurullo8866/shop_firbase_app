import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';
import 'package:shop_firbase_app/ui/admin/category/update_category_screen.dart';
import 'package:shop_firbase_app/view_model/categoryries_view_model.dart';
import 'add_category_screen.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AllCategory admin"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddCategoryScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: Provider.of<CategoriesViewModel>(context, listen: false)
            .listenCategories(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List<CategoryModel> categories = snapshot.data!;

            return ListView(
              children: List.generate(
                categories.length,
                (index) {
                  CategoryModel category = categories[index];
                  return ListTile(
                    title: Text(category.categoryName),
                    trailing: SizedBox(
                      width: 100.0,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => UpdateCategoriesScreen(
                                        categoryModel: category),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                            onPressed: () {
                              Provider.of<CategoriesViewModel>(context,
                                      listen: false)
                                  .deleteCategory(category.categoryId);
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        }),
      ),
    );
  }
}
