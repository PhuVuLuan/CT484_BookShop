import 'package:flutter/material.dart';
import 'ThongTinSP.dart';
import 'QuanLySanPham.dart';

class HienThiLuoi extends StatelessWidget {
  final bool showFavorites;

  const HienThiLuoi(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    final quanlysp = QuanLySP();
    final sanpham = showFavorites ? quanlysp.favorites : quanlysp.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: sanpham.length,
      itemBuilder: (ctx, i) => ThongTinSP(sanpham[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}