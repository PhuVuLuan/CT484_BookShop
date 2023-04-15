// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ui/cart/show_cart.dart';
import '/ui/shared/DieuHuong.dart';
import 'HienThi_luoi.dart';
import '../cart/QuanLyGH.dart';
import 'badge.dart';

enum FilterOptions { favorite, all }

// ignore: camel_case_types
class tongQuan extends StatefulWidget {
  const tongQuan({super.key});

  @override
  State<tongQuan> createState() => tongquanSP();
}

// ignore: camel_case_types
class tongquanSP extends State<tongQuan> {
  var _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Shop'),
        actions: <Widget>[
          buildFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      drawer: const DieuHuong(),
      body: HienThiLuoi(_showFavorites),
    );
  }

  Widget buildShoppingCartIcon() {
    return Consumer<QuanLyGioHang>(
      builder: (ctx, quanlyGH, child){
         return badge(
          data: QuanLyGioHang().SoLuong_SP,
          color: Colors.red,
          child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(show_cart.routeName);
            },
          ),
        );
      }
    );
  }

  Widget buildFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selected) {
        setState(() {
          if (selected == FilterOptions.favorite) {
            _showFavorites = true;
          } else {
            _showFavorites = false;
          }
        });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorite,
          child: Text('Các sản phẩm yêu thích'),
        ),
        const PopupMenuItem(
            value: FilterOptions.all, child: Text('Hiển thị tất cả')),
      ],
    );
  }
}
