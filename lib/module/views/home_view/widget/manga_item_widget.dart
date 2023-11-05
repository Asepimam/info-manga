import 'package:flutter/material.dart';

import '../../../../core.dart';
import '../../../../models/manga/manga.dart';

class MangaItemWiget extends StatelessWidget {
  const MangaItemWiget({
    super.key,
    required this.item,
  });

  final Manga item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DetaitMangaView(
          manga: item,
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            // box shadong dibagian bawah
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(7, 4),
              blurRadius: 12,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage("${item.images?.jpg?.imageUrl}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
