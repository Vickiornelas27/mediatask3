// To parse this JSON data, do
//
//     final noticias = noticiasFromMap(jsonString);

import 'dart:convert';

class Noticias {
  Noticias({
    this.pagination,
    this.data,
  });

  Pagination? pagination;
  List<Datum>? data;

  factory Noticias.fromJson(String str) => Noticias.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Noticias.fromMap(Map<String, dynamic> json) => Noticias(
        pagination: Pagination.fromMap(json["pagination"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pagination": pagination!.toMap(),
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.source,
    required this.image,
    required this.category,
    required this.language,
    required this.country,
    required this.publishedAt,
  });

  String? author;
  String? title;
  String description;
  String url;
  String source;
  String? image;
  String category;
  String language;
  String country;
  DateTime publishedAt;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        source: json["source"],
        image: json["image"] == null ? null : json["image"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
        publishedAt: DateTime.parse(json["published_at"]),
      );

  Map<String, dynamic> toMap() => {
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "source": source,
        "image": image == null ? null : image,
        "category": category,
        "language": language,
        "country": country,
        "published_at": publishedAt.toIso8601String(),
      };
}

class Pagination {
  Pagination({
    required this.limit,
    required this.offset,
    required this.count,
    required this.total,
  });

  int limit;
  int offset;
  int count;
  int total;

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        limit: json["limit"],
        offset: json["offset"],
        count: json["count"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "limit": limit,
        "offset": offset,
        "count": count,
        "total": total,
      };
}
