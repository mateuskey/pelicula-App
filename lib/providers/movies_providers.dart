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

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  getOnDisplayMovies() async {
    // 1.Es la base del URL,
    // 2.Es el segmento propio
    // 3. Son los parámetros del query que es  mapa donde se puede especificar lo que uno necesita.
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    // print(nowPlayingResponse.results[1].title);
    onDisplayMovie = nowPlayingResponse.results;

    //notify sirve para avisar a todos los widgets a redibujar los cambios necesarios
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    final popularResponse = PopularResponse.fromJson(response.body);

    // Mantener las peliculas que ya se tiene, para concatenar todos los resultados
    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies[0]);
    //notify sirve para avisar a todos los widgets a redibujar los cambios necesarios
    notifyListeners();
  }
}
