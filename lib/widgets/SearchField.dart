import 'package:flutter/material.dart';
import 'package:renty_cars/pages/Home.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Color(0xfff8fafc),
          hintText: "Search...",
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.filter_alt_outlined)),
           onTap: () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SearchScreen(),
    );
  },
    );
  }
}
