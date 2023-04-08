import 'package:flutter/material.dart';
import '../../models/ItemDesciption.dart';
import '../shared/HopThoai.dart';

class thongTinMatHang extends StatelessWidget {
  final String id_sp;
  final ItemDescription itemD;

  const thongTinMatHang({
    required this.id_sp,
    required this.itemD,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(itemD.id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return hopThoai(context, 'Bạn có muốn xóa mặt hàng này không?',);
      },
      onDismissed: (direction) {
        print('Cart item dismissed');
      },
      child: xayDungGioHang(),
    );
  }

  Widget xayDungGioHang() {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            // child: SizedBox(
              // padding: const EdgeInsets.all(1),
              // height: 100,
                child: Image.network(
                  itemD.imgUrl,
                  
                // ),
              
            ),
          ),
          title: Text(itemD.name),
          subtitle: Text('Tổng tiền: ${(itemD.price * itemD.quantity)} vnd'),
          trailing: Text('${itemD.quantity} x'),
        ),
      ),
    );
  }
}