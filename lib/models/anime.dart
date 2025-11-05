class Anime {
  final String id;
  final String name;
  final String synopsis;
  final String episodes;
  final String imageURL;

  Anime({
    required this.id,
    required this.name,
    required this.synopsis,
    required this.episodes,
    required this.imageURL
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['anime_id'],
      name: json['name'],
      synopsis: json['synopsis'],
      episodes: json['episodes'],
      imageURL: json['image_url']
    );
  }
}