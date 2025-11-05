class Anime {
  final int id;
  final String name;
  final String synopsis;
  final int episodes;
  final String imageURL;

  Anime({
    required this.id,
    required this.name,
    required this.synopsis,
    required this.episodes,
    required this.imageURL
  });

  factory Anime.fromMap(Map<String, dynamic> map) {
    return Anime(
      id: map['anime_id'],
      name: map['name'],
      synopsis: map['synopsis'],
      episodes: map['episodes'],
      imageURL: map['image_url']
    );
  }
}