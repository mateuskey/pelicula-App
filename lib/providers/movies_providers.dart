import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'e59993ce4206856ed08d6fe525ee1ee0';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovie = [];
  List<Movie> popularMovies = [];

  int __popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovie = nowPlayingResponse.results;

    //notify sirve para avisar a todos los widgets a redibujar los cambios necesarios
    notifyListeners();
  }

  getPopularMovies() async {

    __popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', __popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    // Mantener las peliculas que ya se tiene, para concatenar todos los resultados
    popularMovies = [...popularMovies, ...popularResponse.results];
    //notify sirve para avisar a todos los widgets a redibujar los cambios necesarios
    notifyListeners();
  }
}
