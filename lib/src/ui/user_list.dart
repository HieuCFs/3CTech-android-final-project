import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:loadmore/loadmore.dart';
import 'package:user_manager/src/blocs/user_bloc.dart';
import 'package:user_manager/src/models/item_model.dart';

class UserList extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Texto $index");
  final List<String> recentList = [];
  List<User> _users = [];
  String query = "a";
  int page = 1;
  int totalItem = 0;
  int limit = 15;

  @override
  UserListState createState() => UserListState();
}

class UserListState extends State<UserList> {
  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Search Users From Github API'),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
    widget.query = value;
    widget._users.clear();
    bloc.fetchUserList(q: widget.query, page: widget.page);
  }

  UserListState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }

  @override
  void initState() {
    super.initState();
    bloc.fetchUserList(q: widget.query, page: widget.page);
    bloc.allMovies.listen((event) {
      setState(() {
        widget._users.addAll(event.items);
        widget.totalItem = event.total_count;
      });
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: searchBar.build(context),
      body: buildList(),
    );
  }

  Widget buildList() {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: LoadMore(
        isFinish: (widget.page * widget.limit) >= widget.totalItem,
        onLoadMore: _loadMore,
        child: ListView.builder(
            itemCount: widget._users.length,
            itemBuilder: (context, index) {
              return userItem(widget._users[index]);
            }),
        whenEmptyLoad: false,
        delegate: DefaultLoadMoreDelegate(),
        textBuilder: DefaultLoadMoreTextBuilder.chinese,
      ),
    );
  }

  void load() {
    bloc.fetchUserList(q: widget.query, page: widget.page);
  }

  Future<bool> _loadMore() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    widget.page = widget.page + 1;
    load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    widget.query = 'a';
    widget.page = 1;
    widget._users.clear();
    load();
  }

  Widget userItem(User user) {
    return Container(
      margin: EdgeInsets.only(right: 7, left: 7, top: 7),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(user.avatar_url),
            ),
            Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  user.login,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  maxLines: 2,
                ))
          ],
        ),
      ),
    );
  }
}
