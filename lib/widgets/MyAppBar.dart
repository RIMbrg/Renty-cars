import 'package:flutter/material.dart';

import 'package:renty_cars/widgets/constants.dart';
import 'package:vector_math/vector_math.dart' as math;
//  import 'package:flutter_a/Screens/utils.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.pageTitle, this.iconeName});

  final String pageTitle;
  final IconData? iconeName;

  @override
  Size get preferredSize {
    return const Size.fromHeight(50.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackScreen(),
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(pageTitle,
          style: const TextStyle(
            color: tPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconeName),
          iconSize: 20,
          color: tSecondaryColor,
        )
      ],
    );
  }
}

class BackScreen extends StatelessWidget {
  const BackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.keyboard_arrow_left_rounded),
      iconSize: 30,
      color: tSecondaryColor,
    );
  }
}
