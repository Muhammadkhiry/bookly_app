import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'author.g.dart';

@HiveType(typeId: 1)
class Author extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;

  const Author({this.id, this.name});

  factory Author.fromJson(Map<String, dynamic> json) =>
      Author(id: json['id'] as int?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  List<Object?> get props => [id, name];
}
