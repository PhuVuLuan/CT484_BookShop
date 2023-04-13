import 'package:flutter/material.dart';
import '../DatHang/show_order_screen.dart';
import '../SanPham/SanPham_ND.dart';

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
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(showOrder.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manager Products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SanPhamND.routeName);
            },
          ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.exit_to_app),
          //   title: const Text('Logout'),
          //   onTap: () {
          //     Navigator.of(context)
          //       ..pop()
          //       ..pushReplacementNamed('/');
          //     context.read<AuthManager>().logout();
          //   },
          // ),
        ],
      ),
    );
  }
}
