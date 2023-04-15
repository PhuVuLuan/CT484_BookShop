// ignore_for_file: file_names

import '../../models/SanPham.dart';
import 'package:flutter/foundation.dart';
import '../../services/sanpham_service.dart';
import '../../models/auth_token.dart';

class QuanLySP with ChangeNotifier {
  List<SanPham> _items = [];

  final SanPhamService _sanphamService;
  QuanLySP([AuthToken? authToken])
      : _sanphamService = SanPhamService(authToken);

  set authToken(AuthToken? authToken) {
    _sanphamService.authToken = authToken;
  }

  // final List<SanPham> _items = [
  //   SanPham(
  //     id: 'a1',
  //     imgUrl:
  //         'https://cdn0.fahasa.com/media/catalog/product/t/i/tieu-thuyet-one-piece-film-red---bia-ao-kem-obi.jpg',
  //     name: 'Onpiece',
  //     author: 'Eiichiro Oda',
  //     category: 'Hành động, phiêu lưu, viễn tưởng, hài',
  //     nxb: 'Kim Đồng',
  //     price: 25000,
  //     description:
  //         'One Piece kể về cuộc hành trình của Monkey D. Luffy - thuyền trưởng của băng hải tặc Mũ Rơm và các đồng đội của cậu. Luffy tìm kiếm vùng biển bí ẩn nơi cất giữ kho báu lớn nhất thế giới One Piece, với mục tiêu trở thành Tân Vua Hải Tặc.',
  //     FavoriteBook: true,
  //   ),
  //   SanPham(
  //     id: 'a2',
  //     imgUrl:
  //         'https://cdn0.fahasa.com/media/catalog/product/8/9/8935244884852.jpg',
  //     name: 'Doraemon: Nobita - Vũ trụ Phiêu Lưu Kí',
  //     author: 'Fujiko F Fujio',
  //     category: 'Hài kịch, khoa học, viễn tưởng',
  //     nxb: 'Kim Đồng',
  //     price: 16999,
  //     description:
  //         'Bộ truyện kể về một chú mèo máy màu xanh dễ thương tên là Doraemon đến từ thế kỷ XXII, sinh nhật ngày 3-9-2112 và trở thành người bạn thân thiết của cậu bé Nobita, một cậu học sinh lớp 4 hết sức hậu đậu, chậm chạp và không bao giờ đạt được thành tích tốt ở trường.',
  //     FavoriteBook: false,
  //   ),
  //   SanPham(
  //     id: 'a3',
  //     imgUrl:
  //         'https://cdn0.fahasa.com/media/catalog/product/t/h/tham-tu-lung-danh-conan---bai-tho-tinh-tham-do---tap-1---tb-2023.jpg',
  //     name: 'Thám Tử Lừng Danh Conan: Bài Thơ Tình Đỏ Thẫm',
  //     author: 'Gosho Aoyama, Takahiro Okura',
  //     category: 'Hành động, phiêu lưu, viễn tưởng, hài',
  //     nxb: 'Kim Đồng',
  //     price: 23999,
  //     description:
  //         'Thám tử lừng danh Conan là một series manga trinh thám được sáng tác bởi Aoyama Gōshō. Tác phẩm được đăng tải trên tạp chí Weekly Shōnen Sunday của nhà xuất bản Shogakukan vào năm 1994 và được đóng gói thành 102 tập tankōbon tính đến tháng 9 năm 2022. Truyện xoay quanh một cậu thám tử trung học có tên là Kudo Shinichi trong lúc đang điều tra một Tổ chức Áo đen bí ẩn đã bị ép phải uống một loại thuốc độc có thể gây chết người. May mắn là cậu đã sống sót nhưng cơ thể thì lại bị teo nhỏ như một đứa bé 6 tuổi. Kể từ đó để tránh bị lộ thân phận thực sự của mình, cậu đã lấy tên là Edogawa Conan và chuyển đến sống ở nhà của cô bạn thời thơ ấu Ran Mori cùng với bố của cô ấy là một thám tử tư tên Mori Kogoro với hy vọng một ngày nào đó cậu có thể hạ gục Tổ chức Áo Đen và lấy lại hình dáng ban đầu.',
  //     FavoriteBook: true,
  //   ),
  //   SanPham(
  //     id: 'a4',
  //     imgUrl:
  //         'https://cdn0.fahasa.com/media/catalog/product/n/a/naruto---tap-1---tb-2022.jpg',
  //     name: 'Naruto',
  //     author: 'Masashi Kishimoto',
  //     category: 'Hành động, phiêu lưu, võ thuật, nhẫn giả',
  //     nxb: 'Kim Đồng',
  //     price: 15999,
  //     description:
  //         'Naruto là một loạt manga Nhật Bản được viết và minh họa bởi Kishimoto Masashi. Manga được đăng lần đầu trên tạp chí Weekly Shonen Jump từ tháng 9 năm 1999 đến tháng 11 năm 2014, và sau đó được Shueisha phát hành thành 72 tập tankōbon. Câu chuyện xoay quanh Uzumaki Naruto, một ninja trẻ muốn tìm cách khẳng định mình để được mọi người công nhận và nuôi ước mơ trở thành Hokage - người lãnh đạo Làng Lá.',
  //     FavoriteBook: false,
  //   ),
  // ];

  int get itemCount {
    return _items.length;
  }

  List<SanPham> get items {
    return [..._items];
  }

  List<SanPham> get favoriteItems {
    return _items.where((item) => item.FavoriteBook).toList();
  }

  SanPham? findById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }

  Future<void> fetchSanPham([bool filterByUser = false]) async {
    _items = await _sanphamService.fetchSanPham(filterByUser);
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future<void> ThemSP(SanPham sanpham) async {
    final newSanPham = await _sanphamService.ThemSP(sanpham);
    if (newSanPham != null) {
      _items.add(newSanPham);
      notifyListeners();
    }
  }

  Future<void> toggleFavoriteStatus(SanPham sanpham) async {
    final savedStatus = sanpham.FavoriteBook;
    sanpham.FavoriteBook = !savedStatus;

    if (!await _sanphamService.saveFavoriteStatus(sanpham)) {
      sanpham.FavoriteBook = savedStatus;
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> CapNhatSP(SanPham sanpham) async {
    final index = _items.indexWhere((item) => item.id == sanpham.id);
    if (index >= 0) {
      if (await _sanphamService.CapNhatSP(sanpham)) {
        _items[index] = sanpham;
        notifyListeners();
      }
    }
  }

  Future<void> XoaSP(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    SanPham? existingSanPham = _items[index];
    _items.removeAt(index);
    notifyListeners();

    if (!await _sanphamService.XoaSP(id)) {
      _items.insert(index, existingSanPham);
    }
  }
}
