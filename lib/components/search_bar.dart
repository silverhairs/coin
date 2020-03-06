import 'package:flutter/material.dart';
import 'package:rounded_floating_app_bar/rounded_floating_app_bar.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, isInnerBoxScroll) {
        return [
          RoundedFloatingAppBar(
            backgroundColor: Color(0xFF182A56),
            floating: true,
            snap: true,
            title: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
        ];
      },
      body: Container(),
    );
  }
}
