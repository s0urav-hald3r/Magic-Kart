class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.isFavouite,
    required this.rating,
  });

  final int? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
  final bool? isFavouite;
  final Rating? rating;

  ProductModel copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
    bool? isFavouite,
    Rating? rating,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      isFavouite: isFavouite ?? this.isFavouite,
      rating: rating ?? this.rating,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
      isFavouite: json["isFavouite"] ?? false,
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "isFavouite": isFavouite,
        "rating": rating?.toJson(),
      };
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final num? rate;
  final int? count;

  Rating copyWith({
    num? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json["rate"],
      count: json["count"],
    );
  }

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
