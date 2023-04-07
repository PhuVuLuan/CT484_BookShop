import 'package:flutter/material.dart';
import '../../models/SanPham.dart';

class ChiTietSP extends StatelessWidget {
  const ChiTietSP(
    this.sanpham, {
      super.key,
    }
  );

  final SanPham sanpham;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
      ),
      body: SingleChildScrollView(child: Column(children: <Widget>[
        const SizedBox(height: 5,),
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image.network(
            sanpham.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          sanpham.name,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        Text(
          'Giá: ${sanpham.price} vnd',
          style: const TextStyle(
            color: Color.fromARGB(255, 125, 3, 3),
            fontSize: 30,
          ),
        ),

        const SizedBox(height: 20,),
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
            'Nhà xuất bản: ${sanpham.NXB}',
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
            'Thể loại: ${sanpham.kindOfBook}',
            textAlign: TextAlign.left,
            softWrap: true,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text(
            sanpham.desciption,
            textAlign: TextAlign.left,
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