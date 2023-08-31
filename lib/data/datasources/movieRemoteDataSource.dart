import 'package:http/http.dart';
import '../core/apiClient.dart';
import '../core/apiConstants.dart';
import 'package:ecom_app/data/models/moviesResultModel.dart';
import '../models/movieModel.dart';

abstract class MovieRemoteDataSource{
  Future<List<MovieModel>?> getTrending();
  Future<List<MovieModel>?> getPopular();
  Future<List<MovieModel>?> getAvailableNow();
  Future<List<MovieModel>?> getComingSoon();
}
class MovieRemoteDataSourceImpl extends MovieRemoteDataSource{
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieModel>?> getTrending() async{
    final response = await _client.get('trending/movie/day');
    final movies=MoviesResultModel.fromJson(response).movies;
    return movies;
        }

  @override
  Future<List<MovieModel>?> getAvailableNow() async{
    final response = await _client.get('movie/now_playing');
    final movies=MoviesResultModel.fromJson(response)!.movies;
    return movies;
  }

  @override
  Future<List<MovieModel>?> getComingSoon() async{
    final response = await _client.get('movie/upcoming');
    final movies=MoviesResultModel.fromJson(response)!.movies;
    return movies;
  }

  @override
  Future<List<MovieModel>?> getPopular() async{
    final response = await _client.get('movie/popular');
    final movies=MoviesResultModel.fromJson(response).movies;
    return movies;
  }

}