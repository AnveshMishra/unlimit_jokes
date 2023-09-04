// To parse this JSON data, do
//
//     final jokesResponseEntity = jokesResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

JokesResponseEntity jokesResponseEntityFromJson(String str) =>
    JokesResponseEntity.fromJson(json.decode(str));

String jokesResponseEntityToJson(JokesResponseEntity data) =>
    json.encode(data.toJson());

class JokesResponseEntity extends Equatable {
  final String? joke;

  const JokesResponseEntity({
    this.joke,
  });

  JokesResponseEntity copyWith({
    String? joke,
  }) =>
      JokesResponseEntity(
        joke: joke ?? this.joke,
      );

  factory JokesResponseEntity.fromJson(Map<String, dynamic> json) =>
      JokesResponseEntity(
        joke: json["joke"],
      );

  Map<String, dynamic> toJson() => {
        "joke": joke,
      };

  @override
  List<Object?> get props => [joke];
}
