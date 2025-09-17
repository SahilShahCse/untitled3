class CartItemModel{
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  int count = 0;
  // final RatingModel rating;

  CartItemModel({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.description,
    required this.price,
    required this.count,
  });

  factory CartItemModel.fromMap(Map data) {
    return CartItemModel(
      id: data['id'],
      title: data['title'] ?? '',
      price: double.tryParse(data['price'].toString()) ?? 0.0,
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      image: data['image'] ?? '',
      count: 1
    );
  }


}