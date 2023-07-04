import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/ui/tab_box/card/card_page.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/home_page.dart';
import 'package:shop_firbase_app/ui/tab_box/profile/profile_page.dart';

import '../../view_model/tab_view_model.dart';

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
    screens.add(const ProfilePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var index = context.watch<TabViewModel>().activePageIndex;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        onTap: (value) => Provider.of<TabViewModel>(context, listen: false)
            .changePageIndex(value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favarite",
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
            activeIcon: Icon(Icons.person_2_rounded),
          ),
        ],
        currentIndex: index,// Set the active color here

        selectedItemColor: const Color.fromARGB(243, 253, 181, 45),
      ),
    );
  }
}
