class SanPham {
  final String? id;
  final String imgUrl;
  final String name;
  final String author;
  final String category;
  final String nxb;
  final double price;
  final String description;
  final bool FavoriteBook;

  SanPham({
    this.id,
    required this.imgUrl,
    required this.name,
    required this.author,
    required this.category,
    required this.nxb,
    required this.price,
    required this.description,
    this.FavoriteBook = false,
  });

  SanPham copyWith({
    String? id,
    String? imgUrl,
    String? name,
    String? author,
    String? category,
    String? nxb,
    double? price,
    String? description,
    bool? FavoriteBook,
  }) {
    return SanPham(
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      name: name ?? this.name,
      author: author ?? this.author,
      category: category ?? this.category,
      nxb: nxb ?? this.nxb,
      price: price ?? this.price,
      description: description ?? this.description,
      FavoriteBook: FavoriteBook ?? this.FavoriteBook,
    );
  }
}
