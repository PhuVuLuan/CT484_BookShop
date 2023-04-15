import 'package:flutter/material.dart';
import '../DatHang/show_order_screen.dart';
import '../SanPham/SanPham_ND.dart';
import 'package:provider/provider.dart';
import '../auth/auth_manager.dart';

class DieuHuong extends StatelessWidget {
  const DieuHuong({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Xin chào'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Trang chủ'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Đặt hàng'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(showOrder.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Quản lý sản phẩm'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SanPhamND.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Đăng Xuất'),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..pushReplacementNamed('/');
              context.read<AuthManager>().logout();
            },
          ),
        ],
      ),
    );
  }
}
