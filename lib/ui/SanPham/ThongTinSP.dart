import 'package:flutter/material.dart';
import '../../models/SanPham.dart';
import 'ChiTietSP.dart';

class ThongTinSP extends StatelessWidget {

  final SanPham sanpham;

  const ThongTinSP(
    this.sanpham, {
      super.key,
    }
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buildGrid(context),
        child: GestureDetector(
          onTap: () {
           Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => ChiTietSP(sanpham),),
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
      backgroundColor: Color.fromARGB(255, 89, 88, 88),
      leading: IconButton(
        icon: Icon(
          sanpham.FavoriteBook ? Icons.favorite : Icons.favorite_border,
        ),
        color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          print(' Toggle a fa vorite');
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
          print('Add item to cart');
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}