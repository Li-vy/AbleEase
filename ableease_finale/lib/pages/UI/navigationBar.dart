import 'package:ableeasefinale/pages/UI/homePage.dart';
import 'package:ableeasefinale/pages/UI/meditationPage.dart';
import 'package:ableeasefinale/pages/disability_page.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
// import 'package:disabilities_traning_app/themes/theme.dart';
import 'package:community_material_icon/community_material_icon.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List Pages = [HomePage(), DisabilityPage(), MedPage()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
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
          switch (index) {
            case 0:
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
              break;
            case 1:
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DisabilityPage()));

              break;
            case 2:
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MedPage()));
              break;
            default:
          }
        });
      },
    );
  }
}
