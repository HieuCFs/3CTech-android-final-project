import 'package:http/http.dart' show Client, Response;
import 'package:http/http.dart';
import 'package:user_manager/src/models/item_model.dart';
import 'dart:convert';

class UserApiProvider {
  Client client = Client();
  final _baseUrl = 'api.github.com';

  Future<ItemModel> fetchUserList(String q, int per_page, int page) async {
    Response response = await client.get(Uri.https(_baseUrl,'/search/users', {'q': q, 'per_page' : '$per_page', 'page' : '$page'}));
    if(response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load users');
    }
  }
}
