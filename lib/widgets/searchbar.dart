import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  static String routeName = '/search';

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100.0),
      elevation: 5.0,
      child: TextField(
            decoration: InputDecoration(
              hintText: "Search for food",
              suffixIcon: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(40.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 17.0),
            ),
          ),
    );
  }
}