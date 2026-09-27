import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final double? average;

  const Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(average: (json['average'] as num?)?.toDouble());

  Map<String, dynamic> toJson() => {'average': average};

  @override
  List<Object?> get props => [average];
}
