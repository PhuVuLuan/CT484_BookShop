// ignore: camel_case_types
class info_cart_item{
  final String id;
  final String name;
  final String imgUrl;
  final int quantity;
  final double price;

  info_cart_item({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
    required this.quantity,
  });

 info_cart_item copyWith({
    String? id,
    String? name,
    String? imgUrl,
    double? price,
    int? quantity,
  }) {
    return info_cart_item(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity
    );
  }
}