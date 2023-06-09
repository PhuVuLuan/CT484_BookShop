import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'QuanLyGH.dart';
import 'cart_item_card.dart';
import '../DatHang/QuanLyDH.dart';

// ignore: camel_case_types
class show_cart extends StatelessWidget {
  static const routeName = '/cart';
  const show_cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<QuanLyGioHang>();
    return Scaffold(
      appBar: AppBar(title: const Text('Giỏ Hàng')),
      body: Column(
        children: <Widget>[
          cartSummary(cart, context),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: cartDetails(cart),
          )
        ],
      ),
    );
  }

  Widget cartSummary(QuanLyGioHang cart, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Tổng tiền',
              style: TextStyle(fontSize: 20),
            ),
            const Spacer(),
            Chip(
              label: Text(
                '${cart.Total.toStringAsFixed(2)} vnd',
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.titleLarge?.color,
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            TextButton(
              onPressed:  
                cart.Total <= 0 ? null : () {
                  context.read<QuanLyDH>().themDatHang(
                    cart.sanpham,
                    cart.Total,
                  );
                  cart.clear();
              },
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
              child: const Text('Đặt hàng'),
            )
          ],
        ),
      ),
    );
  }

  Widget cartDetails(QuanLyGioHang cart) {
    return ListView(
      children: cart.Entries.map(
        (e) => thongTinMatHang(
          id_sp: e.key,
          itemD: e.value,
        ),
      ).toList(),
    );
  }
}
