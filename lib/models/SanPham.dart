class SanPham {
  final String? id;
  final String name;
  final String kingOfBook;
  final double price;
  final String imgUrl;
  final String author;
  final int quantity;
  final bool FavoriteBook;

  SanPham({
    this.id,
    required this.imgUrl,
    required this.kingOfBook,
    required this.name,
    required this.price,
    required this.author,
    required this.quantity,
    this.FavoriteBook = false,
  });

  SanPham copyWith({
    String? id,
    String? name,
    String? kingOfBook,
    String? imgUrl,
    double? price,
    String? author,
    int? quantity,
    bool? FavoriteBook,
  }) {
    return SanPham(
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      kingOfBook: kingOfBook ?? this.kingOfBook,
      name: name ?? this.name,
      price: price ?? this.price,
      author: author ?? this.author,
      quantity: quantity ?? this.quantity,
      );
  }
}