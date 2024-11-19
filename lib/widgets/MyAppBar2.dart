import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:renty_cars/widgets/constants.dart';
import 'package:vector_math/vector_math.dart' as math;
//  import 'package:flutter_a/Screens/utils.dart';

class MyAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar2({super.key, required this.pageTitle, this.iconeName});

  final String pageTitle;
  final IconData? iconeName;

  @override
  Size get preferredSize {
    return const Size.fromHeight(50.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      toolbarHeight: 80.0,
      title: Row(children: [
        const Icon(Icons.location_on, color: tAccentColor),
        const SizedBox(width: 10),
        Text(pageTitle, style: const TextStyle(color: Colors.black)),
        IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("login", (route) => false);
            },
            icon: const Icon(Icons.exit_to_app))
      ]),
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
      color: Colors.black,
    );
  }
}
