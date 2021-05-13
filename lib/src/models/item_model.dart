class ItemModel {
  int _total_count;
  bool _incomplete_results;
  List<User> _items = [];

  ItemModel.fromJson(Map<String, dynamic> parseJson) {
    _total_count = parseJson["total_count"];
    _incomplete_results = parseJson["incomplete_results"];
    parseJson['items'].forEach((item) => _items.add(User(item)));
    print(parseJson['items']);
  }

  List<User> get items => _items;

  bool get incomplete_results => _incomplete_results;

  int get total_count => _total_count;
}

class User {
  String _login;
  int _id;
  String _avatar_url;

  User(result) {
    _login = result['login'];
    _id = result['id'];
    _avatar_url = result['avatar_url'];
  }

  String get avatar_url => _avatar_url;

  int get id => _id;

  String get login => _login;
}
