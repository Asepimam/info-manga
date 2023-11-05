import 'package:flutter/material.dart';
import 'package:info_manga/core.dart';
import '../view/detait_manga_view.dart';

class DetaitMangaController extends State<DetaitMangaView> {
  static late DetaitMangaController instance;
  late DetaitMangaView view;
  bool onPressed = false;
  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void onPressedButton() {
    onPressed = !onPressed;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
