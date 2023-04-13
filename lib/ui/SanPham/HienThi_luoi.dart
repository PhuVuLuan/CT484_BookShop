import 'package:flutter/material.dart';
import 'ThongTinSP.dart';
import 'QuanLySP.dart';

class HienThiLuoi extends StatelessWidget {
  final bool showFavorites;

  const HienThiLuoi(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    final quanlysp = QuanLySP();
    final sanpham = showFavorites ? quanlysp.favoriteItems : quanlysp.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: sanpham.length,
      itemBuilder: (ctx, i) => ThongTinSP(sanpham[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 3,
        // crossAxisSpacing: 0,
        mainAxisSpacing: 10,
      ),
    );
  }
}
