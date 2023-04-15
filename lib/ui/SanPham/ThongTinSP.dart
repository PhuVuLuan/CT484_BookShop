// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../HienThi.dart';
import '../../models/SanPham.dart';
// import 'ChiTietSP.dart';

class ThongTinSP extends StatelessWidget {
  static const routeName = '/thongtin-sp';
  final SanPham sanpham;

  const ThongTinSP(
    this.sanpham, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buildGrid(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ChiTietSP.routeName,
              arguments: sanpham.id,
            );
          },
          child: Image.network(
            sanpham.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildGrid(BuildContext context) {
    return GridTileBar(
      backgroundColor: Color.fromARGB(255, 103, 102, 102),
      leading: ValueListenableBuilder<bool>(
        valueListenable: sanpham.FavoriteBookListennable,
        // ignore: non_constant_identifier_names
        builder: (ctx, FavoriteBook, child) {
          return IconButton(
            icon: Icon(
              FavoriteBook ? Icons.favorite : Icons.favorite_border,
            ),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              sanpham.FavoriteBook = !FavoriteBook;
            },
          );
        },
      ),
      title: Text(
        sanpham.name,
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          final giohang = context.read<QuanLyGioHang>();
          giohang.add(sanpham);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: const Text('Thêm sản phẩm vào giỏ hàng'),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'Hoàn Tác',
                  onPressed: () {giohang.removeSingle(sanpham.id!);}
                  ),
                ),
            );
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
