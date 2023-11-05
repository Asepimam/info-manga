class Published {
  String? string;

  Published({this.string});

  factory Published.fromJson(Map<String, dynamic> json) => Published(
        string: json['string'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'string': string,
      };
}
