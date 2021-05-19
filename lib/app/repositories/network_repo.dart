part of '_repositories.dart';

class MovieRepository {
  // Params
  HttpNetworkUtil _networkUtil;
  // Setup a singleton
  static final MovieRepository _movieRepository = MovieRepository._internal();
  factory MovieRepository({HttpNetworkUtil networkUtil}) {
    _movieRepository._networkUtil = networkUtil;
    return _movieRepository;
  }
  MovieRepository._internal();
  // Global Variables
  Logger _logger = Logger();

  /// httpGetPopularMovies, endpoint is 
  /// `https://api.themoviedb.org/3/movie/popular?api_key=YOUR_KEY&language=en-US&page=1`
  /// params -> the page number since the API is paginated
  /// return Future Movie model
  /// if an error occurres return null
  Future<String> httpGetPopularMovies({
    @required int page,
  }) async {
    _logger.i("Page number: $page");
    Response response = await _networkUtil.getRequest(
      "/popular?api_key=$API_KEY&language=en-US&page=$page",
    );
    if (response != null) {
      if (response.statusCode == 404) {
        throw InternetException();
      } else if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        return response.data.toString();
      }
    } else {
      return null;
    }
  }
}
