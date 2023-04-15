import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ChinhSuaSP.dart';
import '../../models/SanPham.dart';
import 'QuanLySP.dart';

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
        context.read<QuanLySP>().deleteSanPham(sanpham.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                'Xóa Sản Phẩm',
                textAlign: TextAlign.center,
              ),
            ),
          );
      },
      color: Theme.of(context).colorScheme.error,
    );
  }

  Widget EditButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditSanPham.routeName,
          arguments: sanpham.id,
        );
      },
      color: Theme.of(context).primaryColor,
    );
  }
}
