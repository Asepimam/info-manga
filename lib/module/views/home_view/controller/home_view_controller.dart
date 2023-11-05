import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:info_manga/core.dart';

import '../../../../models/manga/manga.dart';
import '../../../../services/manga_service.dart';

class HomeViewController extends State<HomeViewView> {
  static late HomeViewController instance;
  late HomeViewView view;
  final ScrollController scrollController = ScrollController();
  final PagingController<int, Manga> pagingController =
      PagingController(firstPageKey: 1);
  @override
  void initState() {
    instance = this;
    fetchPage(0);
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newItems = await MangaService().getManga(pageKey, 20);
      final isLastPage = newItems.length < 20;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 20;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
