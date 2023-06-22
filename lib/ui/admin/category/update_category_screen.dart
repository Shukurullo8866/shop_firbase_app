import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';
import 'package:shop_firbase_app/utils/my_utils.dart';

import '../../../view_model/categoryries_view_model.dart';

class UpdateCategoriesScreen extends StatefulWidget {
  const UpdateCategoriesScreen({required this.categoryModel, super.key});
  final CategoryModel categoryModel;

  @override
  State<UpdateCategoriesScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateCategoriesScreen> {
  final TextEditingController countController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> productImages = [
    "https://www.pngitem.com/pimgs/m/183-1831803_laptop-collection-png-transparent-png.png",
    "https://www.pngitem.com/pimgs/m/183-1831803_laptop-collection-png-transparent-png.png",
  ];
  String imageUrl = "";
  CategoryModel? categoryModel;
  List<String> currencies = ["USD", "SO'M", "RUBL", "TENGE"];
  String selectedCurrency = "USD";

  @override
  void initState() {

    nameController.text = widget.categoryModel.categoryName;
    descriptionController.text = widget.categoryModel.description;
    imageUrl = widget.categoryModel.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Update Product screen"),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [     
           
               TextFormField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Category Name',
                  labelText: "Category Name"
                ),
              ),
           
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  maxLines: 20,
                  decoration: getInputDecoration(
                    
                    label: "Description"),
                ),
              ),
              const SizedBox(height: 20),
              ExpansionTile(
                title: Text(selectedCurrency.isEmpty
                    ? "Select  Currncy"
                    : selectedCurrency),
                children: [
                  ...List.generate(
                      currencies.length,
                          (index) => ListTile(
                        title: Text(currencies[index]),
                        onTap: () {
                          setState(() {
                            selectedCurrency = currencies[index];
                          });
                        },
                      ))
                ],
              ),
              TextButton(
                onPressed: () {
                  selectCategory((selectedCategory) {
                    categoryModel = selectedCategory;
                    
                    setState(() {});
                  });
                },
                child: Text(
                  categoryModel == null
                      ? "Select Category"
                      : categoryModel!.categoryName,
                ),
              ),

              TextButton(
                onPressed: () {
                  CategoryModel categoryModel = CategoryModel(
                    

                    imageUrl: imageUrl,
                    categoryName: nameController.text,
                    description: descriptionController.text,
                    createdAt: widget.categoryModel.createdAt,
                    categoryId: widget.categoryModel.categoryId
                  );

                  Provider.of<CategoriesViewModel>(context,listen: false).updateCategory(categoryModel);

                },
                child: Text("Update Product to Fire Store"),
              )
            ],
          ),
        ),
      )
    );
  }
  selectCategory(ValueChanged<CategoryModel> onCategorySelect) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: StreamBuilder<List<CategoryModel>>(
                stream: Provider.of<CategoriesViewModel>(context, listen: false)
                    .listenCategories(),
                builder: (context, snapshot) {
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
                            (index) => ListTile(
                          title: Text(categories[index].categoryName),
                          onTap: () {
                            onCategorySelect.call(categories[index]);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                },
              ),
            ),
          );
        });
  }
}