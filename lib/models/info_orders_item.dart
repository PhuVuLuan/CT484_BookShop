import 'info_cart_item.dart';

// ignore: camel_case_types
class info_orders_item {
  final String? id;
  final double soTien;
  final List<info_cart_item> sanpham;
  final DateTime dateTime;

  int get soLuongSP {
    return sanpham.length;
  }

  info_orders_item({
    this.id,
    required this.soTien,
    required this.sanpham,
    DateTime? dateTime,
  }) : dateTime = dateTime ?? DateTime.now();

  info_orders_item copyWith({
    String? id,
    double? soTien,
    List<info_cart_item>? sanpham,
    DateTime? dateTime,
  }) {
    return info_orders_item(
      id: id ?? this.id,
      soTien: soTien ?? this.soTien,
      sanpham: sanpham ?? this.sanpham,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
