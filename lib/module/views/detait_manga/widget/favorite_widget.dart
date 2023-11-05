// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool onPressed = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed = !onPressed;
        setState(() {});
      },
      icon: const Icon(Icons.favorite),
      color: onPressed ? Colors.red : Colors.grey,
    );
  }
}
