import 'dart:convert';
import 'dart:html';
import 'package:ecom_app/data/models/movieModel.dart';
import 'package:http/http.dart';
import '../core/apiConstants.dart';
import '../models/moviesResultModel.dart';


abstract class MovieRemoteDataSource{
  Future<List<MovieModel>?> getTrending();
}
class MovieRemoteDataSourceImpl extends MovieRemoteDataSource{
  final Client _client;
  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieModel>?> getTrending() async{
    final response = await _client.get(
        '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}' as Uri,
        headers: {
          'Content-Type' : 'application/json',
        }
    );
    if(response.statusCode==200){
      final responseBody=json.decode(response.body);
      final movies=MoviesResultModel.fromJson(responseBody).movies;
      print(movies);
      return movies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

}