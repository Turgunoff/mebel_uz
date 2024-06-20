class DiscountsModel {
  final String id;
  final String image;

  DiscountsModel({
    required this.id,
    required this.image,
  });

  factory DiscountsModel.fromJson(Map<String, dynamic> json) {
    return DiscountsModel(
      id: json['id'] as String,
      image: json['image'] as String,
    );
  }
}
