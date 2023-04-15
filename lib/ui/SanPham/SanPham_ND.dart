import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ChinhSuaSP.dart';
import 'DanhSach_SPND.dart';
import 'QuanLySP.dart';
import '../shared/DieuHuong.dart';

class SanPhamND extends StatelessWidget {
  static const routeName = '/sanpham-nd';
  const SanPhamND({super.key});

  @override
  Widget build(BuildContext context) {
    final quanlySP = QuanLySP();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản Phẩm Của Bạn'),
        actions: <Widget>[
          AddButton(context),
        ],
      ),
      drawer: const DieuHuong(),
      body: RefreshIndicator(
        onRefresh: () async => print('Làm Mới Sản Phẩm'),
        child: UserProductListView(quanlySP),
      ),
    );
  }

  Widget UserProductListView(QuanLySP quanlysp) {
    return Consumer<QuanLySP>(
      builder: (ctx, quanlySP, child) {
        return ListView.builder(
          itemCount: quanlySP.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              DanhSachSP(
                quanlySP.items[i],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget AddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(EditSanPham.routeName);
      },
    );
  }
}
