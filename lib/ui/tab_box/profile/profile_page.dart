import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/view_model/profile_view_model.dart';

import '../../../data/servise/file_uploder.dart';
import '../../../utils/app_image.dart';
import '../../admin/admin_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    final ImagePicker _picker = ImagePicker();

  XFile? _image;

  String imageUrl = "";

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Image.asset(AppImage.d_r, height: 100, width: 190),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AdminScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_box_outlined,
                color: Colors.orange,
              ),
            ),
          )
        ],
        leading: const Icon(
          Icons.menu,
          color: Colors.orange,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, child) {
          return profileViewModel.user != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      FirebaseAuth.instance.signOut();
                    }, child: Text("Log Out")),
                    Text(profileViewModel.user!.email.toString()),
                    Text(profileViewModel.user!.uid.toString()),
                    Text(profileViewModel.user!.displayName.toString()),
                    
                    isLoading ? const CircularProgressIndicator() : SizedBox(),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      width: 100,
                      height: 100,
                      child: profileViewModel.user!.photoURL == null
                          ? Image.asset(
                              AppImage.d_r,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              profileViewModel.user!.photoURL!,
                              fit: BoxFit.cover,
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showPicker(context);
                      },
                      child: Text("Select Image"),
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator());
        },
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
      setState(() {
        isLoading = true;
      });
      if (!mounted) return;
      imageUrl = await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      Provider.of<ProfileViewModel>(context, listen: false)
          .updatePhoto(imageUrl);
      setState(() {
        isLoading = false;
        _image = pickedFile;
      });
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
      if (!mounted) return;
      Provider.of<ProfileViewModel>(context, listen: false).updatePhoto(imageUrl);
      setState(() {
        _image = pickedFile;
      });
    }
  }
}



/*
import 'package:flutter/material.dart';
import 'package:shop_firbase_app/ui/admin/admin_screen.dart';
import '../../../utils/app_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Image.asset(AppImage.d_r, height: 100, width: 190),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AdminScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_box_outlined,
                color: Colors.orange,
              ),
            ),
          )
        ],
        leading: const Icon(
          Icons.menu,
          color: Colors.orange,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text(
              "Profiled",
              style: TextStyle(color: Colors.black, fontSize: 23),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(5), // Border width
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueGrey, Colors.amber],
                      begin:  FractionalOffset(1.0, 1.3),
                      end:  FractionalOffset(0.5, 0.0),
                      stops: [0.0, 0.0],
                      tileMode: TileMode.clamp),
                  shape: BoxShape.circle),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48), // Image radius
                  child: Image.network('https://i.pravatar.cc/300',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Shoptoli",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            texts("Setings"),
            const SizedBox(height: 4),
            buildAccaountOption("App_Settings"),
            texts("Accaunt"),
            buildAccaountOption("Change_account_name"),
            buildAccaountOption("Change account password"),
            buildAccaountOption("Change account Image"),
            texts("Uptodo"),
            buildAccaountOption("Abaut US"),
            buildAccaountOption("FAQ"),
            buildAccaountOption("Help Feedback"),
            buildAccaountOption("Fidbag"),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildAccaountOption(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          builder: (context) {
            return Container();
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 16, color: Colors.black)),
            const Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget texts(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}


*/