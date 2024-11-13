import 'package:flutter/material.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [],
      ),
    ));
  }
}

Widget appBar() {
  return SliverAppBar(
    pinned: true,
    expandedHeight: 200,
    iconTheme: IconThemeData(color: Colors.white),
    // leading: ,
  );
}
