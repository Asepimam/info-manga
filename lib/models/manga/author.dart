class Author {
  int? malId;
  String? type;
  String? name;
  String? url;

  Author({this.malId, this.type, this.name, this.url});

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        malId: json['mal_id'] as int?,
        type: json['type'] as String?,
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'type': type,
        'name': name,
        'url': url,
      };
}
