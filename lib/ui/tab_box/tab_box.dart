import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/ui/tab_box/card/card_page.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/home_page.dart';
import 'package:shop_firbase_app/ui/tab_box/profile/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shop_firbase_app/utils/color.dart';
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
    screens.add(Container(
      color: Colors.white,
      child: const Center(child: Text("Map Screen")),
    ));
    screens.add(const ProfilePage());
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
          Icon(
            CupertinoIcons.home,
            size: 28,
          ),
          Icon(
            Icons.favorite_border_outlined,
            size: 28,
          ),
          Icon(CupertinoIcons.map_pin_ellipse,
              size: 28, color: Color.fromARGB(255, 202, 5, 5)),
          Icon(CupertinoIcons.person, size: 28),
        ],
        color: const Color.fromARGB(255, 248, 192, 119),
        buttonBackgroundColor: const Color.fromARGB(255, 239, 173, 73),
        backgroundColor: MyColors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (value) => Provider.of<TabViewModel>(context, listen: false)
            .changePageIndex(value),
        letIndexChange: (index) => true,
      ),
    );
  }
}
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white70,
      //   onTap: (value) => Provider.of<TabViewModel>(context, listen: false)
      //       .changePageIndex(value),
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_filled),
      //       label: "Home",
      //       activeIcon: Icon(Icons.home),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite_border),
      //       label: "Favarite",
      //       activeIcon: Icon(Icons.favorite),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_2_outlined),
      //       label: "Profile",
      //       activeIcon: Icon(Icons.person_2_rounded),
      //     ),
      //   ],
      //   currentIndex: index,// Set the active color here

      //   selectedItemColor: const Color.fromARGB(243, 253, 181, 45),
      // ),