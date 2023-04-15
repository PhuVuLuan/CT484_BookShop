// ignore: camel_case_types
class info_user{
  final String hoTen;
  final String gioiTinh;
  final DateTime namSinh;
  final String sdt;
  final String email;

  info_user({
    required this.hoTen,
    required this.email,
    required this.sdt,
    required this.gioiTinh,
    required this.namSinh
  });

  info_user copyWith({
    String? hoTen,
    String? gioiTinh,
    DateTime? namSinh,
    String? sdt,
    String? email,
  }){
    return info_user(
      hoTen: hoTen ?? this.hoTen,
      email: email ?? this.email,
      sdt: sdt ?? this.sdt,
      gioiTinh: gioiTinh ?? this.gioiTinh,
      namSinh: namSinh ?? this.namSinh
      );
  }
}