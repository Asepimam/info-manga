import 'author.dart';
import 'genre.dart';
import 'images.dart';
import 'published.dart';

class Manga {
  int? malId;
  Images? images;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  List<dynamic>? titleSynonyms;
  int? chapters;
  int? volumes;
  String? status;
  Published? published;
  double? score;
  int? rank;
  int? favorites;
  String? synopsis;
  List<Author>? authors;
  List<Genre>? genres;

  Manga({
    this.malId,
    this.images,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.chapters,
    this.volumes,
    this.status,
    this.published,
    this.score,
    this.rank,
    this.favorites,
    this.synopsis,
    this.authors,
    this.genres,
  });

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
        malId: json['mal_id'] as int?,
        images: json['images'] == null
            ? null
            : Images.fromJson(json['images'] as Map<String, dynamic>),
        title: json['title'] as String?,
        titleEnglish: json['title_english'] as String?,
        titleJapanese: json['title_japanese'] as String?,
        titleSynonyms: json['title_synonyms'] as List<dynamic>?,
        chapters: json['chapters'] as int?,
        volumes: json['volumes'] as int?,
        status: json['status'] as String?,
        published: json['published'] == null
            ? null
            : Published.fromJson(json['published'] as Map<String, dynamic>),
        score: (json['score'] as num?)?.toDouble(),
        rank: json['rank'] as int?,
        favorites: json['favorites'] as int?,
        synopsis: json['synopsis'] as String?,
        authors: (json['authors'] as List<dynamic>?)
            ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
            .toList(),
        genres: (json['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'images': images?.toJson(),
        'title': title,
        'title_english': titleEnglish,
        'title_japanese': titleJapanese,
        'title_synonyms': titleSynonyms,
        'chapters': chapters,
        'volumes': volumes,
        'status': status,
        'published': published?.toJson(),
        'score': score,
        'rank': rank,
        'favorites': favorites,
        'synopsis': synopsis,
        'authors': authors?.map((e) => e.toJson()).toList(),
        'genres': genres?.map((e) => e.toJson()).toList(),
      };
}
