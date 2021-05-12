import 'package:demo/model/Player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var players = [
  Player(
      "Trần Dần",
      "https://nhanquyenvn.org/wp-content/uploads/2021/03/tran-dan.png",
      12.345,
      10),
  Player(
      "Bác Đa 70",
      "https://s.memehay.com/files/posts/bcf5d29bff082f221548b95c58d5ab16toi-nam-nay-hon-70-tuoi-ma-chua-gap-truong-hop-nao-nhu-the-nay-ca.jpg",
      87.345,
      10),
  Player(
      "Huấn Rose",
      "https://s.memehay.com/files/posts/20200812/f135e0fedad300cf07b43a47b0e72c95toan-bo-loi-ran-day-cua-huan-hoa-hong-huan-rose.png",
      78.222,
      10),
  Player(
      "Trần Dần",
      "https://nhanquyenvn.org/wp-content/uploads/2021/03/tran-dan.png",
      12.345,
      10),
  Player(
      "Trần Dần",
      "https://nhanquyenvn.org/wp-content/uploads/2021/03/tran-dan.png",
      12.345,
      10),
  Player(
      "Trần Dần",
      "https://nhanquyenvn.org/wp-content/uploads/2021/03/tran-dan.png",
      12.345,
      10),
  Player(
      "Trần Dần",
      "https://nhanquyenvn.org/wp-content/uploads/2021/03/tran-dan.png",
      12.345,
      10),
  Player(
      "Trần Dần",
      "https://nhanquyenvn.org/wp-content/uploads/2021/03/tran-dan.png",
      12.345,
      10),
  Player(
      "Trần Dần",
      "https://nhanquyenvn.org/wp-content/uploads/2021/03/tran-dan.png",
      12.345,
      10),
  Player(
      "Trần Dần",
      "https://nhanquyenvn.org/wp-content/uploads/2021/03/tran-dan.png",
      12.345,
      10),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white60.withOpacity(0.85),
            body: MyHomePage(),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      child: Column(
        children: [
          Text(
            "LeaderBoard",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.only(top: 18, left: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 32,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(right: 15),
                        child: _PlayerCardState(players[0], 15),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 18,right: 3),
                          child: Image.network(
                            "https://pngimage.net/wp-content/uploads/2018/06/1-prize-png-9.png",
                            width: 37,
                            height: 37,
                          )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 36,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          width: double.infinity,
                          child: _PlayerCardState(players[1]),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Image.network(
                            "https://pngimage.net/wp-content/uploads/2018/06/1-prize-png-9.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 32,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(right: 18),
                          child: _PlayerCardState(players[2], 15),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 18, right: 6),
                            child: Image.network(
                              "https://pngimage.net/wp-content/uploads/2018/06/1-prize-png-9.png",
                              width: 37,
                              height: 37,
                            )),
                      ],
                    )),
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 18, right: 18),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 28),
                  child: Align(
                    child: Text(
                      "POPULAR",
                      style: TextStyle(color: Colors.black45, fontSize: 20),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 14),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextHeader("Rank"),
                            CustomTextHeader("User"),
                          ],
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: Container(),
                        flex: 4,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextHeader("Rank"),
                            CustomTextHeader("User"),
                          ],
                        ),
                        flex: 3,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: players.length - 3,
                        itemBuilder: (context, i) {
                          return _PlayerCardItem(players[i + 3], i + 4);
                        })),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class CustomTextHeader extends StatelessWidget {
  final String _text;

  CustomTextHeader(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
    );
  }
}

class _PlayerCardItem extends StatelessWidget {
  final Player _player;
  final int _rank;

  const _PlayerCardItem(this._player, this._rank);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17),
      margin: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    _rank.toString(),
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 7),
                        child: CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage(_player.avatarUrl)),
                      ),
                      Text(
                        _player.name.toString(),
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            flex: 5,
          ),
          Expanded(
            child: Container(),
            flex: 2,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _player.pts.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  _player.level.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}

class _PlayerCardState extends StatelessWidget {
  final Player _player;
  final double _marginTop;

  _PlayerCardState(this._player, [this._marginTop = 0]);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 160,
      child: Container(
        margin: EdgeInsets.only(top: _marginTop),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
                radius: 28, backgroundImage: NetworkImage(_player.avatarUrl)),
            Text(
              _player.name,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  fontFamily: "Times New Roman"),
            ),
            Text(
              "${_player.pts} pts",
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  fontFamily: "Times New Roman"),
            ),
            Text(
              "Level ${_player.level}",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  fontFamily: "Times New Roman"),
            ),
          ],
        ),
      ),
    );
  }
}
