import 'package:flutter/material.dart';

class ButtonFavorite extends StatefulWidget {
  @override
  _ButtonFavoriteState createState() => _ButtonFavoriteState();
}

class _ButtonFavoriteState extends State<ButtonFavorite> {
  // Track the favorite state
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Center(

//
//
//
//
//
//
//
//
//
//
//
//
//

// this is the old icon button : without adding to the favorites page (without provider)
        // child: IconButton(
        //   icon: Icon(
        //     _isFavorite ? Icons.favorite : Icons.favorite_border, // Toggle icon
        //     color: _isFavorite ? Colors.red : Colors.grey, // Change color
        //   ),
        //   onPressed: () {
        //     setState(() {
        //       _isFavorite = !_isFavorite; // Toggle the favorite state
        //     });
        //   },
        // ),

        );
  }
}
