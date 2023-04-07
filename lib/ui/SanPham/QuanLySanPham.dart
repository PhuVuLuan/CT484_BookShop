import '../../models/SanPham.dart';

class QuanLySP {
  final List<SanPham> _items = [
    SanPham(
      id: 'b1',
      imgUrl: 'https://nhatrangbooks.com/wp-content/uploads/2019/10/fcb60eec06455f029cf12a9b8ff8fda1.jpg',
      kindOfBook: 'Truyện tranh',
      name: 'Doraemon',
      price: 20000,
      author: 'Fujiko F Fujio',
      desciption: 'Doraemon là chú mèo máy đến từ tương lai',
      NXB: 'Kim Đồng',
      )
  ];

  int get iCount {
    return _items.length;
  }

  List<SanPham> get items {
    return [..._items];
  }

  List<SanPham> get favorites {
    return _items.where((item) => item.FavoriteBook).toList();
  }
}