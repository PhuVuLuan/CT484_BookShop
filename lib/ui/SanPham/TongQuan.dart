// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ui/cart/show_cart.dart';
import '/ui/shared/DieuHuong.dart';
import 'HienThi_luoi.dart';
import '../cart/QuanLyGH.dart';
import 'QuanLySP.dart';
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
  final _showFavorites = ValueNotifier<bool>(false);
  late Future<void> _fetchSanPham;

  @override
  void initState() {
    super.initState();
    _fetchSanPham = context.read<QuanLySP>().fetchSanPham();
  }

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
      body: FutureBuilder(
        future: _fetchSanPham,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ValueListenableBuilder<bool>(
                valueListenable: _showFavorites,
                // ignore: non_constant_identifier_names
                builder: (ctx, Favorite, child) {
                  return HienThiLuoi(Favorite);
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildShoppingCartIcon() {
    return Consumer<QuanLyGioHang>(builder: (ctx, quanlyGH, child) {
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
    });
  }

  Widget buildFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selected){
            if (selected == FilterOptions.favorite) {
              _showFavorites.value = true;
            } else {
              _showFavorites.value = false;
            }
      },
        
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorite,
          child: Text('Sản phẩm yêu thích'),
        ),
        const PopupMenuItem(value: FilterOptions.all, child: Text('Tất cả')),
      ],
    );
  }
}
