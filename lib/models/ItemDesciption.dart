class ItemDescription {
  final String id;
  final String name;
  final String imgUrl;
  final int quantity;
  final double price;

  ItemDescription({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
    required this.quantity,
  });

  ItemDescription copyWith({
    String? id,
    String? name,
    String? imgUrl,
    double? price,
    int? quantity,
  }) {
    return ItemDescription(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity
    );
  }
}