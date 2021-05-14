import 'package:user_manager/src/models/item_model.dart';
import 'package:user_manager/src/repositories/repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _repository = Repository();
  final _userFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allMovies => _userFetcher.stream;

  fetchUserList({String q = "a", int perPage = 15, int page = 0}) async {
    ItemModel itemModel = await _repository.fetchUserList(q, perPage, page);
    _userFetcher.sink.add(itemModel);
  }

  dispose() {
    _userFetcher.close();
  }
}

final bloc = UserBloc();
