import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'rating.g.dart';

@HiveType(typeId: 2)
class Rating extends Equatable {
  @HiveField(0)
  final double? average;

  const Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(average: (json['average'] as num?)?.toDouble());

  Map<String, dynamic> toJson() => {'average': average};

  @override
  List<Object?> get props => [average];
}
