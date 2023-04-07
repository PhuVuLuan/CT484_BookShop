import 'package:flutter/material.dart';
import 'DanhSach_SPND.dart';
import 'QuanLySanPham.dart';

class SanPhamND extends StatelessWidget {
  const SanPhamND({super.key});

  @override
  Widget build(BuildContext context) {
    final quanlysp = QuanLySP();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản Phẩm Của Bạn'),
        actions: <Widget>[
          AddButton(context),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('Làm Mới Sản Phẩm'),
        child: UserProductListView(quanlysp),
      ),
    );
  }

  Widget UserProductListView(QuanLySP quanlysp) {
    return ListView.builder(
      itemCount: quanlysp.iCount,
      itemBuilder: (ctx, i) => Column(
        children: [
          DanhSachSP(
            quanlysp.items[i],
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget AddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        print('Đến trang chỉnh sửa sản phẩm');
      },
    );
  }
}
