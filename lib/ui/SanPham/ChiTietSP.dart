import 'package:flutter/material.dart';
import '../../models/SanPham.dart';

class ChiTietSP extends StatelessWidget {
  static const routeName = '/chitiet-sp';
  const ChiTietSP(
    this.sanpham, {
    super.key,
  });

  final SanPham sanpham;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHI TIẾT SẢN PHẨM'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                sanpham.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              sanpham.name,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              'Giá: ${sanpham.price} vnd',
              style: const TextStyle(
                color: Color.fromARGB(255, 169, 3, 3),
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text(
                'Tác giả: ${sanpham.author}',
                textAlign: TextAlign.left,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text(
                'Nhà xuất bản: ${sanpham.nxb}',
                textAlign: TextAlign.left,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text(
                'Thể loại: ${sanpham.category}',
                textAlign: TextAlign.left,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text(
                sanpham.description,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
