import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:futurebuilder_eg1/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'detailsPage.dart';

class HomePage extends StatefulWidget {
  String  title;
  HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

Future<List<User>> getlist() async{
  List<User> _users=[];
  var responseurl=await http.get("http://www.json-generator.com/api/json/get/ceDTBYcMEi?indent=2");
  if(responseurl.statusCode==200){
    var jsonData=json.decode(responseurl.body);
    for(var userinfo in jsonData){
      User _user=User(userinfo['index'],userinfo['about'] ,userinfo['picture'] ,userinfo['email'] ,userinfo['name']);
      _users.add(_user);
    }
    return _users;
  }
  else
   return throw new Exception();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getlist(),
          builder: (BuildContext context,snapshot){
        if(snapshot.data==null){
          return Container(
            child: Center(
              child: Text("Loading ...",style: TextStyle(color: Colors.blue,fontSize: 32,fontWeight: FontWeight.bold),),
            ),
          );
        }
        else
          return ListView.builder(
            itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context,int index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data[index].picture),
                ),
                title: Text("${snapshot.data[index].name}"),
                subtitle: Text("${snapshot.data[index].email}"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(snapshot.data[index])));
                },
              );
              }
          );

      }
      ),
    );
  }
}
