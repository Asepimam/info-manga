import 'package:flutter/material.dart';
import 'package:info_manga/models/manga/manga.dart';
import 'package:info_manga/module/views/detait_manga/widget/deksripsi_manga.dart';
import '../../../../core.dart';

class DetaitMangaView extends StatefulWidget {
  final Manga? manga;
  const DetaitMangaView({Key? key, this.manga}) : super(key: key);

  Widget build(context, DetaitMangaController controller) {
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "${manga?.images?.jpg?.largeImageUrl}",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                DeskripsiManga(manga: manga),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<DetaitMangaView> createState() => DetaitMangaController();
}
