import 'package:equatable/equatable.dart';

import 'author.dart';
import 'rating.dart';

class BookModel extends Equatable {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? image;
  final List<Author>? authors;
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
