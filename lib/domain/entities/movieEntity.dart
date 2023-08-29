import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable{
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;
  const MovieEntity({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage

  }) : assert(id!=null, 'Movie id must not be null');
  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify=> true;
}