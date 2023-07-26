import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/view_model/profile_view_model.dart';
import '../../../data/servise/file_uploder.dart';
import '../../../utils/app_image.dart';
import '../../admin/admin_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();
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
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.orange),
          onPressed: () {
            context.read<ProfileViewModel>().fetchUser();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ProfileViewModel>(
          builder: (context, profileViewModel, child) {
            return profileViewModel.user != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          width: 100,
                          height: 100,
                          child: Image.network(
                              profileViewModel.user!.photoURL.toString(),
                              fit: BoxFit.fill)),
                      TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: const Text("Log Out"),
                      ),
                        Container(
                        padding: const EdgeInsets.all(5),
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("User Name : "),
                            Text(profileViewModel.user!.displayName.toString()),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Email : "),
                            Text(profileViewModel.user!.email.toString()),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // color: Color.fromARGB(255, 204, 210, 247),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Phone Number : "),
                            Text(profileViewModel.user!.phoneNumber.toString()),
                          ],
                        ),
                      ),
                      Text(profileViewModel.user!.phoneNumber.toString()),
                      Text(profileViewModel.user!.phoneNumber.toString()),
                      Text(profileViewModel.user!.metadata.toString()),
                   
                      isLoading
                          ? Container(
                              color: Colors.red, height: 100, width: 100)
                          : const SizedBox(),
                      ElevatedButton(
                        onPressed: () {
                          _showPicker(context);
                        },
                        child: const Text("Select Image"),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
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
      setState(() {
        isLoading = true;
      });
      if (!mounted) return;
      imageUrl = await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      Provider.of<ProfileViewModel>(context, listen: false)
          .updatePhoto(imageUrl);
      setState(
        () {
          isLoading = false;
        },
      );
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
      Provider.of<ProfileViewModel>(context, listen: false)
          .updatePhoto(imageUrl);
      setState(() {});
    }
  }
}
