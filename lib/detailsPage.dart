import 'package:flutter/material.dart';
import 'package:futurebuilder_eg1/user.dart';
class DetailsPage extends StatelessWidget {
  final User _userslist;
  DetailsPage(this._userslist);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(_userslist.name),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(_userslist.picture,height: 100,width: 100,),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: <Widget>[
                Text(
                  _userslist.name,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                Text(_userslist.email),
                Text(_userslist.about)
              ],
            ),
          )
        ],
      ),
    );
  }
}
