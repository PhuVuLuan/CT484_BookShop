// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class SanPham {
  final String? id;
  final String imgUrl;
  final String name;
  final String author;
  final String category;
  final String nxb;
  final double price;
  final String description;
  final ValueNotifier<bool> _FavoriteBook;

  SanPham({
    this.id,
    required this.imgUrl,
    required this.name,
    required this.author,
    required this.category,
    required this.nxb,
    required this.price,
    required this.description,
    // ignore: non_constant_identifier_names
    FavoriteBook = false,
  }) : _FavoriteBook = ValueNotifier(FavoriteBook);

  set FavoriteBook(bool newValue) {
    _FavoriteBook.value = newValue;
  }

  bool get FavoriteBook {
    return _FavoriteBook.value;
  }

  ValueNotifier<bool> get FavoriteBookListennable {
    return _FavoriteBook;
  }

  SanPham copyWith({
    String? id,
    String? imgUrl,
    String? name,
    String? author,
    String? category,
    String? nxb,
    double? price,
    String? description,
    bool? FavoriteBook,
  }) {
    return SanPham(
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      name: name ?? this.name,
      author: author ?? this.author,
      category: category ?? this.category,
      nxb: nxb ?? this.nxb,
      price: price ?? this.price,
      description: description ?? this.description,
      FavoriteBook: FavoriteBook ?? this.FavoriteBook,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imgUrl': imgUrl,
      'name': name,
      'author': author,
      'category': category,
      'nxb': nxb,
      'price': price,
      'description': description,
    };
  }

  static SanPham fromJson(Map<String, dynamic> json) {
    return SanPham(
      imgUrl: json['imgUrl'],
      id: json['id'],
      name: json['name'],
      author: json['author'],
      category: json['category'],
      nxb: json['nxb'],
      price: json['price'],
      description: json['description'],
    );
  }
}
