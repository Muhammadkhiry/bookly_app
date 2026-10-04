import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'author.dart';
import 'rating.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? subtitle;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final List<Author>? authors;
  @HiveField(5)
  final Rating? rating;

  const BookModel({
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.authors,
    this.rating,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    subtitle: json['subtitle'] as String?,
    image: json['image'] as String?,
    authors: (json['authors'] as List<dynamic>?)
        ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
        .toList(),
    rating: json['rating'] == null
        ? null
        : Rating.fromJson(json['rating'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'subtitle': subtitle,
    'image': image,
    'authors': authors?.map((e) => e.toJson()).toList(),
    'rating': rating?.toJson(),
  };

  @override
  List<Object?> get props {
    return [id, title, subtitle, image, authors, rating];
  }
}
