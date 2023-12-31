import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/branch/branch_model.dart';
import 'package:shop_firbase_app/screens/tab_box/card/card_page.dart';
import 'package:shop_firbase_app/screens/tab_box/home_page/home_page.dart';
import 'package:shop_firbase_app/screens/tab_box/profile/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shop_firbase_app/utils/color.dart';
import '../../view_model/tab_view_model.dart';
import 'map/map_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const HomePage());
    screens.add(const CardPage());
    screens.add(const GoogleMapScreen());

    screens.add(const ProfilePage());

    Map<String, dynamic> data = {
      "_id": "1",
      "location": null,
      "address": "Tashkent",
      "name": "Hello World",
      "is_active": true,
      "phone": "+998971233323"
    };
    BranchModel.fromJson(data);
    BranchModel branchModel = BranchModel();
    branchModel.address = "Tashkent";
    branchModel.name = "Hello World";
    branchModel.phone = "+998971233323";
    branchModel.isActive = true;
    branchModel.sId = "1";
    branchModel.location = Location(latitude: 41.334122, longitude: 69.144771);
    super.initState();
  }

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var index = context.watch<TabViewModel>().activePageIndex;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          
          Icon(CupertinoIcons.home, size: 28,color: MyColors.appColor1,),
          Icon(Icons.favorite_border_outlined, size: 28,color: MyColors.appColor1,),
          Icon(
            CupertinoIcons.map_pin_ellipse,
            size: 28,
            color: Color.fromARGB(255, 202, 5, 5),
          ),
          Icon(CupertinoIcons.person, size: 28,color: MyColors.appColor1,),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: MyColors.appColor1,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (value) => Provider.of<TabViewModel>(context, listen: false)
            .changePageIndex(value),
        letIndexChange: (index) => true,
      ),
    );
  }
}
