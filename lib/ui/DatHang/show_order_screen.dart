import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/DieuHuong.dart';
import 'QuanLyDH.dart';
import 'show_order_item.dart';

class showOrder extends StatelessWidget {
  static const routeName = 'dathang';
  const showOrder({super.key});

  @override
  Widget build(BuildContext context) {
    print('Trang đặt hàng');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản Phẩm Đã Đặt Hàng'),
      ),
      drawer: const DieuHuong(),
      body: Consumer<QuanLyDH>(
         builder: (ctx, quanlyDH, child) {
            return ListView.builder(
            itemCount: quanlyDH.soLuongDatHang,
            itemBuilder: (ctx, i) => showOrderItem(quanlyDH.dathang[i]),
        );
      }
      )
    );
  }
}
