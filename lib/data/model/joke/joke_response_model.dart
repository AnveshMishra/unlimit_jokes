import 'package:unlimit_jokes_app/domain/entity/jokes/jokes_response_entity.dart';

class JokeResponseModel extends JokesResponseEntity {
  const JokeResponseModel({
    final String? joke,
  }) : super(joke: joke);

  factory JokeResponseModel.fromJson(Map<String, dynamic> json) =>
      JokeResponseModel(
        joke: json["joke"],
      );
}
