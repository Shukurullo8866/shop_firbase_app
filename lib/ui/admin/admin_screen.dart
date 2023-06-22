import 'package:flutter/material.dart';
import 'package:shop_firbase_app/ui/admin/category/all_category_screen.dart';
import 'package:shop_firbase_app/ui/admin/products/all_prodacts_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Page"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Product"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AllProductsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Category"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AllCategoryScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
