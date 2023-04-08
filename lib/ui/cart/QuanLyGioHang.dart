import '../../models/ItemDesciption.dart';

class QuanLyGioHang {
  final Map<String, ItemDescription> _items = {
    'b1': ItemDescription(
      id: 'c1',
      name: 'Doraemon',
      imgUrl: 'https://nhatrangbooks.com/wp-content/uploads/2019/10/fcb60eec06455f029cf12a9b8ff8fda1.jpg',
      price: 20000,
      quantity: 2,
    ),
  };

  int get SoLuong_SP {
    return _items.length;
  }

  List<ItemDescription> get sanpham {
    return _items.values.toList();
  }

  Iterable<MapEntry<String, ItemDescription>> get Entries {
    return {..._items}.entries;
  }

  double get Total {
    var total = 0.0;
    _items.forEach((key, ItemDescription) {
      total += ItemDescription.price * ItemDescription.quantity;
    });
    return total;
  }
}