import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/SanPham.dart';
import '../models/auth_token.dart';
import 'firebase_service.dart';

class SanPhamService extends FirebaseService {
  SanPhamService([AuthToken? authToken]) : super(authToken);
  Future<List<SanPham>> fetchSanPham([bool filterByUser = false]) async {
    final List<SanPham> sanphams = [];
    try {
      final filters =
          filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
      final sanphamUrl =
          Uri.parse('$databaseUrl/sanphams.json?auth=$token&$filters');
      final response = await http.get(sanphamUrl);
      final sanphamMap = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        print(sanphamMap['error']);
        return sanphams;
      }

      final userFavoritesUrl =
          Uri.parse('$databaseUrl/userFavorites/$userId.json?auth=$token');
      final userFavoritesResponse = await http.get(userFavoritesUrl);
      final userFavoritesMap = json.decode(userFavoritesResponse.body);

      sanphamMap.forEach((sanphamId, sanpham) {
        // ignore: non_constant_identifier_names
        final FavoriteBook = (userFavoritesMap == null)
            ? false
            : (userFavoritesMap[sanphamId] ?? false);
        sanphams.add(
          SanPham.fromJson({
            'id': sanphamId,
            ...sanpham,
          }).copyWith(FavoriteBook: FavoriteBook),
        );
      });
      return sanphams;
    } catch (error) {
      print(error);
      return sanphams;
    }
  }

  // ignore: non_constant_identifier_names
  Future<SanPham?> ThemSP(SanPham sanpham) async {
    try {
      final url = Uri.parse('$databaseUrl/sanphams.json?auth=$token');
      final response = await http.post(
        url,
        body: json.encode(
          sanpham.toJson()
            ..addAll({
              'creatorId': userId,
            }),
        ),
      );
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return sanpham.copyWith(
        id: json.decode(response.body)['name'],
      );
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> CapNhatSP(SanPham sanpham) async {
    try {
      final url =
          Uri.parse('$databaseUrl/sanphams/${sanpham.id}.json?auth=$token');
      final response = await http.patch(
        url,
        body: json.encode(sanpham.toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> XoaSP(String id) async {
    try {
      final url = Uri.parse('$databaseUrl/sanphams/$id.json?auth=$token');
      final response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> saveFavoriteStatus(SanPham sanpham) async {
    try {
      final url = Uri.parse(
          '$databaseUrl/userFavorites/$userId/${sanpham.id}.json?auth=$token');
      final response = await http.put(
        url,
        body: json.encode(
          sanpham.FavoriteBook,
        ),
      );
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
