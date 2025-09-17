class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  // final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromMap(Map data) {
    return ProductModel(
      id: data['id'],
      title: data['title'] ?? '',
      price: double.tryParse(data['price'].toString()) ?? 0.0,
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      image: data['image'] ?? '',
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      'title' : title,
      'price' : price,
      'description' : description,
      'category' : category,
      'image' : image,
    };
  }
}
