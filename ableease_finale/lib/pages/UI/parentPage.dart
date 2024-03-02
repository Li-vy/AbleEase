import 'package:ableeasefinale/pages/UI/homePage.dart';
import 'package:ableeasefinale/pages/UI/meditationPage.dart';
import 'package:ableeasefinale/pages/UI/navigationBar.dart';
import 'package:ableeasefinale/pages/disability_page.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({super.key});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  int _selectedIndex = 0;
  Widget getChild({required int index}) {
    Widget ch;
    switch (index) {
      case 0:
        ch = const HomePage();
        break;
      case 1:
        ch = const DisabilityPage();
        break;
      case 2:
        ch = const MedPage();
        break;
      default:
        ch = const DisabilityPage();
    }
    return ch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        buttonBackgroundColor: Theme.of(context).colorScheme.secondary,
        color: Theme.of(context).colorScheme.primary,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home_outlined,
              size: 35,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(CommunityMaterialIcons.gamepad_variant, size: 35),
          ),
          CurvedNavigationBarItem(
            child: Icon(CommunityMaterialIcons.meditation, size: 35),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Container(child: getChild(index: _selectedIndex)),
    );
  }
}
