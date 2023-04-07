import 'package:flutter/material.dart';
import 'HienThi_luoi.dart';

enum FilterOptions { favorite, all }

class tongQuan extends StatefulWidget {
  const tongQuan({super.key});

  @override
  State<tongQuan> createState() => tongquanSP();
}

class tongquanSP extends State<tongQuan> {
  var _showFavorites = false;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Shop'),
        actions: <Widget>[
          buildFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      body: HienThiLuoi(_showFavorites),
    );
  }

  Widget buildShoppingCartIcon() {
    return IconButton(
      icon: const Icon(
        Icons.shopping_cart,
      ),
      onPressed: () {
        print('Go to cart screeen');
      },
    );
  }

  Widget buildFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selected) {
        setState(() {
          if (selected == FilterOptions.favorite){
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
          value: FilterOptions.all,
          child: Text('Hiển thị tất cả')
        ),
      ],
    );
  }
}