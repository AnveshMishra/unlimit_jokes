import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/joke/joke_response_model.dart';

abstract class JokeRemoteDataSource {
  Future getJokeResponse();
}

class JokeRemoteDataSourceImpl extends JokeRemoteDataSource {
  final http.Client client;

  JokeRemoteDataSourceImpl({required this.client});

  @override
  Future getJokeResponse() async {
    final response = await client.get(
      Uri.parse('https://geek-jokes.sameerkumar.website/api?format=json'),
      headers: {
        "content-type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      JokeResponseModel jokeModel = JokeResponseModel.fromJson(responseBody);
      return jokeModel;
    } else {
      throw Exception();
    }
  }
}
