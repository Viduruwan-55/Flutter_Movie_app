class CompanyModel {
  String name;
  String? logo;

  CompanyModel({
    required this.name,
    this.logo,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'],
      logo: json['logo_path'] == null
          ? null
          : 'https://image.tmdb.org/t/p/w500${json['logo_path']}',
    );
  }
}
