class CastModel {
  String name;
  String? profilePath;
  String? character;

  CastModel({
    required this.name,
    this.profilePath,
    this.character,
  });
  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      character: json['character'],
      name: json['name'],
      profilePath: json['profile_path'] == null
          ? 'https://cdn-icons-png.flaticon.com/512/5951/5951752.png'
          : 'https://image.tmdb.org/t/p/w500${json['profile_path']}',
    );
  }

  get image => 'https://cdn-icons-png.flaticon.com/512/5951/5951752.png';
}
