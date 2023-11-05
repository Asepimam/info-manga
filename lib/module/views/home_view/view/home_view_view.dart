import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:info_manga/core.dart';
import 'package:info_manga/models/manga/manga.dart';

import '../widget/manga_item_widget.dart';

class HomeViewView extends StatefulWidget {
  const HomeViewView({Key? key}) : super(key: key);

  Widget build(context, HomeViewController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Info Manga",
          style: TextStyle(fontFamily: "KoreKore"),
        ),
      ),
      body: PagedGridView<int, Manga>(
        pagingController: controller.pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 4,
        ),
        builderDelegate: PagedChildBuilderDelegate<Manga>(
          itemBuilder: (context, item, index) => MangaItemWiget(
            item: item,
          ),
          animateTransitions: true,
          transitionDuration: const Duration(
            milliseconds: 500,
          ),
        ),
      ),
    );
  }

  @override
  State<HomeViewView> createState() => HomeViewController();
}
