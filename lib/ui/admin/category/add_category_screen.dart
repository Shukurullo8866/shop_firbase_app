// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';
import 'package:shop_firbase_app/utils/my_utils.dart';
import '../../../data/servise/file_uploder.dart';
import '../../../view_model/categoryries_view_model.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController categoryName = TextEditingController();
  final TextEditingController description = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  String imageUrl = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Category"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: categoryName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: description,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'description',
                ),
              ),
            ),
           Container(
              width: imageUrl.isEmpty ? 0 : 50,
              height: imageUrl.isEmpty ? 0 : 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
            ElevatedButton(
              onPressed: () {
                print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasssssssssss");
                print(imageUrl);
                _showPicker(context);
              },
              child: const Text(
                "Upload Student Image",
                style: TextStyle(fontSize: 25),
              ),
            ),
            IconButton(
              onPressed: () {
                CategoryModel categoryModel = CategoryModel(
                  categoryId: "",
                  categoryName: categoryName.text,
                  description: description.text,
                  imageUrl: imageUrl.toString(),
                  createdAt: DateTime.now().toString(),
                );
                print(
                    "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111");
                print(imageUrl);
                Provider.of<CategoriesViewModel>(context, listen: false)
                    .addCategory(categoryModel);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
         floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.navigation),
      ),
      ),
    );
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
  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1000,
      maxHeight: 1000,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      imageUrl = await FileUploader.imageUploader(pickedFile);
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
      imageUrl = await FileUploader.imageUploader(pickedFile);
      setState(() {});
    }
  }


}
