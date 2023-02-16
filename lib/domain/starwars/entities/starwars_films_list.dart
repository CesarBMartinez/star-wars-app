class StarWarsFilmsList {
  StarWarsFilmsList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<StarWarsFilm> results;
}

class StarWarsFilm {
  StarWarsFilm({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.url,
  });

  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final List<dynamic> characters;
  final List<dynamic> planets;
  final List<dynamic> starships;
  final List<dynamic> vehicles;
  final List<dynamic> species;
  final String url;
}
