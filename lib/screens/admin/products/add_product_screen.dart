import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';
import 'package:shop_firbase_app/data/model/product_model.dart';
import 'package:shop_firbase_app/utils/style.dart';
import '../../../data/servise/file_uploder.dart';
import '../../../utils/my_utils.dart';
import '../../../view_model/categoryries_view_model.dart';
import '../../../view_model/product_view_model.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController countController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> productImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0bFKK6BZidymcaU_7nfMru-NIy3FmWOBNCw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0bFKK6BZidymcaU_7nfMru-NIy3FmWOBNCw&usqp=CAU",
  ];
  String categoryId = "";
  CategoryModel? categoryModel;
  String createdAt = DateTime.now().toString();
  List<String> currencies = ["USD", "SO'M", "RUBL", "TENGE"];
  String selectedCurrency = "USD";
  final ImagePicker _picker = ImagePicker();
  String imageUrl = "";
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add Product screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                cursorColor: Colors.black,
                controller: countController,
                keyboardType: TextInputType.number,
                decoration: getInputDecoration(
                  label: "Count",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: getInputDecoration(label: "Price"),
              ),
              const SizedBox(height: 20),
              TextField(
                cursorColor: Colors.black,
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
              SizedBox(height: 10.h),
              imageUrl.isEmpty
                  ? const Text("no image")
                  : Container(
                      width: imageUrl.isEmpty ? 0 : 200,
                      height: imageUrl.isEmpty ? 0 : 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover)),
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
                        setState(
                          () {
                            selectedCurrency = currencies[index];
                          },
                        );
                      },
                    ),
                  ),
                ],
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
                  ProductModel productModel = ProductModel(
                    count: int.parse(countController.text),
                    price: int.parse(priceController.text),
                    productImages: images,
                    categoryId: categoryId,
                    productId: "",
                    productName: nameController.text,
                    description: descriptionController.text,
                    createdAt: createdAt,
                    currency: selectedCurrency,
                    light: false,
                  );
                  if (imageUrl.isNotEmpty) {
                    if (categoryId.isNotEmpty) {
                      Provider.of<ProductViewModel>(context, listen: false)
                          .addProduct(productModel);
                      Future.delayed(const Duration(seconds: 4));
                      Navigator.pop(context);
                    } else {
                      MyUtils.getMyToast(message: "Category not selected");
                    }
                  } else {
                    MyUtils.getMyToast(
                        message: "image not added yet please wait");
                  }
                },
                child: Text(
                  "Add Product to Fire Store",
                  style: AppTextStyle.medium(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  selectCategory(ValueChanged<CategoryModel> onCategorySelect) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
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
      },
    );
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
      },
    );
  }
}
