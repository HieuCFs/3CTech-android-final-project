import 'package:flutter/material.dart';

class SearchUtils extends SearchDelegate {
  String selectResult;
  final List<String> listExample;
  final List<String> recentList;

  SearchUtils(this.listExample, this.recentList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectResult),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(listExample.where(
            (element) => element.contains(query),
          ));
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
      return ListTile(
        title: Text(suggestionList[index]),
        onTap: () {
          selectResult = suggestionList[index];
          showResults(context);
        },
      );
    });
  }
}
