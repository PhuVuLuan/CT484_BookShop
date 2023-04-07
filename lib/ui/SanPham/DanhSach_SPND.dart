import 'package:flutter/material.dart';
import '../../models/SanPham.dart';

class DanhSachSP extends StatelessWidget {
  final SanPham sanpham;
  const DanhSachSP(
    this.sanpham, {
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sanpham.name),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(sanpham.imgUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            EditButton(context),
            DeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget DeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        print('Xóa một sản phẩm');
        // context.read<QuanLySP>().deleteProduct(sanpham.id!);
        // ScaffoldMessenger.of(context)
        //   ..hideCurrentSnackBar()
        //   ..showSnackBar(
        //     const SnackBar(
        //       content: Text(
        //         'Xóa Sản Phẩm',
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //   );
      },
      color: Theme.of(context).colorScheme.error,
    );
  }

  Widget EditButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        print('Đến giao diện chỉnh sửa sản phẩm');
        // Navigator.of(context).pushNamed(
        //   EditProductScreen.routeName,
        //   arguments: product.id,
        // );
      },
      color: Theme.of(context).primaryColor,
    );
  }
}
