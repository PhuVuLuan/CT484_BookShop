import 'package:flutter/material.dart';

import '../../models/info_cart_item.dart';
import '../../models/info_orders_item.dart';

class QuanLyDH with ChangeNotifier {
  final List<info_orders_item> dathang = [
    info_orders_item(
      id: 'o1',
      soTien: 40000,
      sanpham: [
        info_cart_item(
          id: 'c1',
          name: 'Doraemon',
          imgUrl: 'https://nhatrangbooks.com/wp-content/uploads/2019/10/fcb60eec06455f029cf12a9b8ff8fda1.jpg',
          price: 20000,
          quantity: 2,
        )
      ],
      dateTime: DateTime.now(),
      )
  ];
  int get soLuongDatHang {
    return dathang.length;
  }

  List<info_orders_item> get orders {
    return [...dathang];
  }
}