import 'package:user_manager/src/models/item_model.dart';
import 'package:user_manager/src/repositories/resources/user_api_provider.dart';

class Repository {
  final userApiProvider = UserApiProvider();

  Future<ItemModel> fetchUserList(String q, int perPage, int page) => userApiProvider.fetchUserList(q, perPage, page);
}
