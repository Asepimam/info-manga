import 'package:dio/dio.dart';
import 'package:info_manga/models/manga/manga.dart';

class MangaService {
  final Dio dio = Dio();
  Future<List<Manga>> getManga(int page, int limit) async {
    final getManga = dio.get(
      'https://api.jikan.moe/v4/top/manga',
      queryParameters: {
        'page': page,
        'limit': limit,
      },
    );
    try {
      final responnse = await getManga;
      if (responnse.statusCode == 200) {
        final result = responnse.data['data'] as List;
        final manga = result.map((e) => Manga.fromJson(e)).toList();
        return manga;
      } else {
        throw Exception('Error getting manga list');
      }
    } catch (e) {
      rethrow;
    }
  }
}
