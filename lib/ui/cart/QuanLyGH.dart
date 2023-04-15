// ignore_for_file: file_names
import '../../models/info_cart_item.dart';
import 'package:flutter/foundation.dart';
import '../../models/SanPham.dart';

class QuanLyGioHang with ChangeNotifier {
  Map<String, info_cart_item> _items = {
    'b1': info_cart_item(
      id: 'c1',
      name: 'Doraemon',
      imgUrl: 'https://nhatrangbooks.com/wp-content/uploads/2019/10/fcb60eec06455f029cf12a9b8ff8fda1.jpg',
      price: 20000,
      quantity: 2,
    ),
  };

  // ignore: non_constant_identifier_names
  int get SoLuong_SP {
    return _items.length;
  }

  List<info_cart_item> get sanpham {
    return _items.values.toList();
  }

  Iterable<MapEntry<String, info_cart_item>> get Entries {
    return {..._items}.entries;
  }

  // ignore: non_constant_identifier_names
  double get Total {
    var total = 0.0;
    
    // ignore: non_constant_identifier_names
    _items.forEach((key, ItemDescription) {
      total += ItemDescription.price * ItemDescription.quantity;
    });
    return total;
  }

  void add(SanPham sanpham) {
    if (_items.containsKey(sanpham.id)){
      _items.update(
        sanpham.id!,
        (value) =>value.copyWith(
          quantity: value.quantity + 1,
        ),
        );
    } else {
      _items.putIfAbsent(sanpham.id!, () => info_cart_item(
        id: 'c${DateTime.now().toIso8601String()}',
        name: sanpham.name,
        imgUrl: sanpham.imgUrl,
        price: sanpham.price,
        quantity: 1,
        ),
        );
    }
    notifyListeners();
  }

  void remove(String idSanpham) {
    _items.remove(idSanpham);
    notifyListeners();
  }

  void removeSingle(String idSanpham) {
    if (!_items.containsKey(idSanpham)) {
      return;
    }
    if (_items[idSanpham]?.quantity as num > 1) {
      _items.update(
        idSanpham,
        (value) => value.copyWith(
          quantity: value.quantity - 1,
        ),
        );
    }else {
      _items.remove(idSanpham);
    }
    notifyListeners();
  }
  void clear(){
    _items = {};
    notifyListeners();
  }
}