import 'package:dio/dio.dart';

class MovieService {
  final Dio _dio=Dio();
  final String apiKey = 'a4114012643b5a0a9f2084e9c7cdecbd';
  Future<List<dynamic>> fetchMoviesByGener(int genreId) async{
    try{
      final response = await _dio.get(
        'https://api.themoviedb.org/3/discover/movie',
        queryParameters: {
          'api_key': apiKey,
          'with_genres': genreId,
        },
      );
      return response.data['results'] ?? [];
    } catch (e) {
      print('Error fetching movies: $e');
      return [];
    }
  }
}
