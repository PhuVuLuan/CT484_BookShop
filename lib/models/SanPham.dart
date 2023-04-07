class SanPham {
  final String? id;
  final String name;
  final String kindOfBook;
  final double price;
  final String imgUrl;
  final String author;
  final String desciption;
  final String NXB;
  final bool FavoriteBook;

  SanPham({
    this.id,
    required this.imgUrl,
    required this.kindOfBook,
    required this.name,
    required this.price,
    required this.author,
    required this.desciption,
    required this.NXB,
    this.FavoriteBook = false,
  });

  SanPham copyWith({
    String? id,
    String? name,
    String? kindOfBook,
    String? imgUrl,
    double? price,
    String? author,
    String? desciption,
    String? NXB,
    bool? FavoriteBook,
  }) {
    return SanPham(
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      kindOfBook: kindOfBook ?? this.kindOfBook,
      name: name ?? this.name,
      price: price ?? this.price,
      author: author ?? this.author,
      desciption: desciption ?? this.desciption,
      NXB: NXB ?? this.NXB,
      FavoriteBook: FavoriteBook ?? this.FavoriteBook,
    );
  }
}