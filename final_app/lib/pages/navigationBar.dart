import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
// import 'package:disabilities_traning_app/themes/theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      buttonBackgroundColor: Theme.of(context).colorScheme.secondary,
      color: Theme.of(context).colorScheme.primary,
      items: const <Widget>[
        Icon(
          Icons.home_outlined,
          size: 35,
        ),
        Icon(CommunityMaterialIcons.gamepad_variant, size: 35),
        Icon(CommunityMaterialIcons.meditation, size: 35),
        Icon(Icons.history, size: 35),
      ],
      onTap: (index) {
        switch (index) {
          case 1:
            Navigator.pushNamed(context, '/detailsPage');
            break;
          case 2:
            Navigator.pushNamed(context, '/meditationPage');
            break;
          case 3:
            Navigator.pushNamed(context, '/meditationPage');
            break;
          case 4:
            Navigator.pushNamed(context, '/detailsPage');
            break;
          default:
        }
      },
    );
  }
}
