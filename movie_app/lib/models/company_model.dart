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
          ? 'https://cdn-icons-png.flaticon.com/512/6547/6547073.png'
          : 'https://image.tmdb.org/t/p/w500${json['logo_path']}',
    );
  }
}
