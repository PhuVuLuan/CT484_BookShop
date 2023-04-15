import 'package:flutter/material.dart';

import '../../models/info_cart_item.dart';
import '../../models/info_orders_item.dart';

class QuanLyDH with ChangeNotifier {
  final List<info_orders_item> dathang = [];
  int get soLuongDatHang {
    return dathang.length;
  }

  List<info_orders_item> get orders {
    return [...dathang];
  }

  void themDatHang(List<info_cart_item> sanphamDH, double total) async {
    dathang.insert(
      0,
      info_orders_item(
        id: 'o${DateTime.now().toIso8601String()}',
        soTien: total,
        sanpham: sanphamDH,
        dateTime: DateTime.now(),
        )
      );
      notifyListeners();
  }
}