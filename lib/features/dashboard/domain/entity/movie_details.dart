import 'package:netflixy/core/error/data_response.dart';

class MoviesResponse implements DataResponse {
  MoviesResponse({
    this.movies,
    this.errorMessage,
  });

  MoviesResponse.fromJson(dynamic json) {
    if (json['items'] != null) {
      movies = [];
      json['items'].forEach((v) {
        movies?.add(MovieDetails.fromJson(v));
      });
    }
    errorMessage = json['errorMessage'];
  }

  List<MovieDetails>? movies;
  String? errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movies != null) {
      map['items'] = movies?.map((v) => v.toJson()).toList();
    }
    map['errorMessage'] = errorMessage;
    return map;
  }
}

class MovieDetails {
  MovieDetails({
    this.id,
    this.title,
    this.fullTitle,
    this.year,
    this.releaseState,
    this.image,
    this.runtimeMins,
    this.runtimeStr,
    this.plot,
    this.contentRating,
    this.imDbRating,
    this.imDbRatingCount,
    this.metacriticRating,
    this.crew,
    this.rank,
    this.genres,
    this.genreList,
    this.directors,
    this.directorList,
    this.stars,
    this.starList,
  });

  MovieDetails.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    fullTitle = json['fullTitle'];
    year = json['year'];
    releaseState = json['releaseState'];
    image = json['image'];
    runtimeMins = json['runtimeMins'];
    runtimeStr = json['runtimeStr'];
    plot = json['plot'];
    contentRating = json['contentRating'];
    imDbRating = json['imDbRating'];
    imDbRatingCount = json['imDbRatingCount'];
    metacriticRating = json['metacriticRating'];
    crew = json['crew'];
    rank = json['rank'];
    genres = json['genres'];
    if (json['genreList'] != null) {
      genreList = [];
      json['genreList'].forEach((v) {
        genreList?.add(GenreList.fromJson(v));
      });
    }
    directors = json['directors'];
    if (json['directorList'] != null) {
      directorList = [];
      json['directorList'].forEach((v) {
        directorList?.add(DirectorList.fromJson(v));
      });
    }
    stars = json['stars'];
    if (json['starList'] != null) {
      starList = [];
      json['starList'].forEach((v) {
        starList?.add(StarList.fromJson(v));
      });
    }
  }

  String? id;
  String? title;
  String? fullTitle;
  String? year;
  String? releaseState;
  String? image;
  String? runtimeMins;
  String? runtimeStr;
  String? plot;
  String? contentRating;
  String? imDbRating;
  String? imDbRatingCount;
  String? metacriticRating;
  String? crew;
  String? rank;
  String? genres;
  List<GenreList>? genreList;
  String? directors;
  List<DirectorList>? directorList;
  String? stars;
  List<StarList>? starList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['fullTitle'] = fullTitle;
    map['year'] = year;
    map['releaseState'] = releaseState;
    map['image'] = image;
    map['runtimeMins'] = runtimeMins;
    map['runtimeStr'] = runtimeStr;
    map['plot'] = plot;
    map['contentRating'] = contentRating;
    map['imDbRating'] = imDbRating;
    map['imDbRatingCount'] = imDbRatingCount;
    map['metacriticRating'] = metacriticRating;
    map['rank'] = rank;
    map['crew'] = crew;
    map['genres'] = genres;
    if (genreList != null) {
      map['genreList'] = genreList?.map((v) => v.toJson()).toList();
    }
    map['directors'] = directors;
    if (directorList != null) {
      map['directorList'] = directorList?.map((v) => v.toJson()).toList();
    }
    map['stars'] = stars;
    if (starList != null) {
      map['starList'] = starList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class StarList {
  StarList({
    this.id,
    this.name,
  });

  StarList.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

class DirectorList {
  DirectorList({
    this.id,
    this.name,
  });

  DirectorList.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

class GenreList {
  GenreList({
    this.key,
    this.value,
  });

  GenreList.fromJson(dynamic json) {
    key = json['key'];
    value = json['value'];
  }

  String? key;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['value'] = value;
    return map;
  }
}
