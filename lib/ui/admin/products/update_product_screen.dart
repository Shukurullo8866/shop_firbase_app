import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';
import 'package:shop_firbase_app/data/model/product_model.dart';
import 'package:shop_firbase_app/ui/admin/products/all_prodacts_screen.dart';
import '../../../data/servise/file_uploder.dart';
import '../../../utils/my_utils.dart';
import '../../../view_model/categoryries_view_model.dart';
import '../../../view_model/product_view_model.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({Key? key, required this.productModel})
      : super(key: key);

  final ProductModel productModel;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController countController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String categoryId = "";
  CategoryModel? categoryModel;
  List<String> currencies = ["USD", "SO'M", "RUBL", "TENGE"];
  String selectedCurrency = "USD";
  String imageUrl = "";
  List<String> images = [];

  @override
  void initState() {
    countController.text = widget.productModel.count.toString();
    priceController.text = widget.productModel.price.toString();
    nameController.text = widget.productModel.productName;
    descriptionController.text = widget.productModel.description;
    categoryId = widget.productModel.categoryId;
    selectedCurrency = widget.productModel.currency;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Product screen"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                TextField(
                  controller: countController,
                  keyboardType: TextInputType.number,
                  decoration: getInputDecoration(label: "Count"),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: getInputDecoration(label: "Price"),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: getInputDecoration(label: "Product Name"),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: TextField(
                    controller: descriptionController,
                    keyboardType: TextInputType.text,
                    maxLines: 20,
                    decoration: getInputDecoration(label: "Description"),
                  ),
                ),
                SizedBox(height: 6.h),
                imageUrl.isEmpty
                    ? Container(
                        width: widget.productModel.productImages[0].isEmpty
                            ? 0
                            : 200,
                        height: widget.productModel.productImages[0].isEmpty
                            ? 0
                            : 200,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.productModel.productImages[0]),
                                fit: BoxFit.cover)),
                      )
                    : Container(
                        width: imageUrl.isEmpty ? 0 : 200,
                        height: imageUrl.isEmpty ? 0 : 200,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover)),
                      ),
                SizedBox(height: 6.h),
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
                ElevatedButton(
                  onPressed: () {
                    _showPicker(context);
                  },
                  child: const Text(
                    "Upload Student Image",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    selectCategory((selectedCategory) {
                      categoryModel = selectedCategory;
                      categoryId = categoryModel!.categoryId;
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
                    ProductModel productModel = ProductModel(
                      count: int.parse(countController.text),
                      price: int.parse(priceController.text),
                      productImages: images,
                      categoryId: categoryId,
                      productId: widget.productModel.productId,
                      productName: nameController.text,
                      description: descriptionController.text,
                      createdAt: widget.productModel.createdAt,
                      currency: selectedCurrency,
                      light: false,
                    );
                    
                         Provider.of<ProductViewModel>(context, listen: false)
                            .updateProduct(productModel);
                        // : MyUtils.getMyToast(message: "Image not found");
                    
                         Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              Navigator.pop(context);
                            },
                          );
                        
                  },
                  child: const Text("Update Product to Fire Store"),
                )
              ],
            ),
          ),
        ));
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

  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1000,
      maxHeight: 1000,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      imageUrl = (await FileUploader.imageUploader(pickedFile));
      images.add(imageUrl);
      setState(() {});
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      imageUrl = (await FileUploader.imageUploader(pickedFile));
      images.add(imageUrl);
      setState(() {});
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Gallery"),
                    onTap: () {
                      _getFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _getFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
