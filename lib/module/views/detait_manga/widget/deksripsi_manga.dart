import 'package:flutter/material.dart';
import 'package:info_manga/models/manga/manga.dart';
import 'package:info_manga/module/views/detait_manga/widget/favorite_widget.dart';

class DeskripsiManga extends StatelessWidget {
  const DeskripsiManga({
    super.key,
    required this.manga,
  });

  final Manga? manga;

  @override
  Widget build(BuildContext context) {
    var genre = manga?.genres?.map((e) => e.name).toList().join(", ");
    var author = manga?.authors?.map((e) => e.name).toList().join(", ");

    return SizedBox(
      height: manga!.synopsis!.length <= 50 ? 400 : 700,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    "${manga?.title}",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "KeroKero",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const FavoriteWidget(),
              ],
            ),
            subtitle: Text(
              "${manga?.synopsis}",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            top: manga!.synopsis!.length <= 50 ? 180 : 220,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(7, 4),
                    blurRadius: 20,
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: const Text(
                            "Author",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "$author",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 95.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: const Text(
                            "Rank",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            " ${manga?.rank}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: const Text(
                            "Published",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "${manga?.published?.string}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 95.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: const Text(
                            "Genres",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "$genre",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: const Text(
                      "Status",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${manga?.status}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text(
                              "English",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // jika null maka akan string kosong
                            subtitle: Text(manga?.titleEnglish ?? ""),
                          ),
                        ),
                        const SizedBox(
                          width: 95.0,
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text(
                              "Jeapanese",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("${manga?.titleJapanese}"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
