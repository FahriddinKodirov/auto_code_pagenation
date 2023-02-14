class TechrunchModel {
  final int id;
  final String date;
  final String jetpackFeaturedMediaUrl;

  TechrunchModel({
    required this.id,
    required this.date,
    required this.jetpackFeaturedMediaUrl
  });

  factory TechrunchModel.fromJson(Map<String, dynamic> json) {
    return TechrunchModel(
      id: json['id'],
      date: json['date'],
      jetpackFeaturedMediaUrl: json['jetpack_featured_media_url'],
    );
  }
}
