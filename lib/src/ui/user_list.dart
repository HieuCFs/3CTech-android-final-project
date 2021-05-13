import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:user_manager/src/blocs/user_bloc.dart';
import 'package:user_manager/src/models/item_model.dart';

class UserList extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Texto $index");
  final List<String> recentList = [];

  @override
  UserListState createState() => UserListState();
}

class UserListState extends State<UserList> {
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Search Users From Github API'),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
    print('You wrote $value!');
    setState(() => bloc.fetchUserList(q : value));
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
    bloc.fetchUserList();
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
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.items.length,
        itemBuilder: (context, index) {
          return UserItem(snapshot.data.items[index]);
        });
  }

  Widget UserItem(User user) {
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
                  color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
            ))
          ],
        ),
      ),
    );
  }
}
