import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:resume_app/model/educationmodel.dart';
import 'addEduDetails.dart';

class EducationDetails1 extends StatefulWidget {
  @override
  _EducationDetails1State createState() => _EducationDetails1State();
}

class _EducationDetails1State extends State<EducationDetails1> {
  bool loading = false;




  final String uri = 'http://192.168.137.1:8080/resume/getEducation/1001';
  Future<List<EdModel>> _fetchUsers() async {
//    Map<String,String> headers = {"Content-type": "application/json"};
//    var response = await http.get(Uri.encodeFull(uri),headers: headers);
//    String ans = response.body.toString(); var responseJson = jsonDecode(ans);
//
//    if (responseJson["error"]==false) {
//      final items = json.decode(response  .body).cast<Map<String, dynamic>>();
//      print(items.runtimeType);
//      List<EdModel> listofDegree = items["data"].map<EdModel>((json) {
//        return EdModel.fromJson(json);
//      }).toList();
//
//      return listofDegree;
//    } else {
//      throw Exception('Failed to load internet');
//    }
    Map<String,String> headers = {"Content-type": "application/json"};

    final response = await http.get(Uri.encodeFull(uri),
        headers: headers);
//    print(response.body.toString() + "qwerty");

    String ans = response.body.toString();

    var responseJson = jsonDecode(ans);

    var result = responseJson["error"];


    if(result==false)
    {

      final items = responseJson["data"].cast<Map<String, dynamic>>();

      List<EdModel> listofDegree = items.map<EdModel>((json) {
        return EdModel.fromJson(json);
      }).toList();
      return listofDegree;
      }


  }
  Widget educationListviewWidget(){
    return FutureBuilder<List<EdModel>>(
      future: _fetchUsers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return ListView(
          children: snapshot.data
              .map((user) => GestureDetector(
            onTap: () {

            },
//              child: Container(
//                  height: MediaQuery.of(context).size.height/7,
//                  margin: EdgeInsets.all(20.0),
//
//                  decoration: BoxDecoration(
//                    color: Colors.white70,
//                    borderRadius: BorderRadius.circular(22.0),
//                    border: Border.all(color: Colors.grey,style: BorderStyle.solid)
//                  ),
//                  child: Center(child: Text(user.degree,style: TextStyle(
//                      fontSize: 19.0,
//                      fontFamily: 'Montserrat',
//                      fontWeight: FontWeight.bold,
//                      color: Colors.grey
//                  ),
//                  )
//                  ),
//                ),
            child: Card(
              margin: EdgeInsets.all(10.0),
              elevation:15.0,
              child: Padding(
                padding: EdgeInsets.all(9.0),
                child: Column(

                  mainAxisSize: MainAxisSize.max,

                  children: <Widget>[
                    ListTile(
                      leading: Card(
                        child: Container(
                          height: 25.0,
                          width:50.0,
                          child: Center(child: Text(user.year),
                          ),
                        ),

                      ),
                      title:Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Degree: "+user.degree),
                          Text("CPI: "+user.cpi),
                          Text("Year: "+user.year),

                        ],
                      ),


                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
//                                setState(() {
//                                  loading=true;
//                                });
//                                Future.delayed(Duration(seconds: 7),(){
//                                  setState(() {
//                                    loading = false;
//                                  });
//                                });

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => EducationDetails1()));

                            },
                            child: Container(
                              height: 25.0,
                              width:35.0,
                              child: Center(child: Icon(Icons.remove_circle,color: Colors.blueGrey,),
                              ),

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ),
//              child: ListTile(
//                title: Text(user.university + "   CPI: "+user.cpi),
//                subtitle: Text(user.degree),
//                leading: CircleAvatar(
//                  backgroundColor: Colors.red,
//                  child: Text(user.year,
//                      style: TextStyle(
//                        fontSize: 9.0,
//                        color: Colors.white,
//                      )),
//                ),
//                trailing: IconButton(
//                  icon: Icon(Icons.arrow_forward_ios),
//                ),
//              ),
          ))
              .toList(),
        );

      },
    );
  }
  Widget LoadingIndicator() {
    return Positioned(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[700],
        child: Center(
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: CircularProgressIndicator(strokeWidth: 0.7),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Education Details',style: TextStyle(color: Colors.white),),
        actions: <Widget>[

          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEduDetails()));
            },
          ),

        ],
      ),
      body: Stack(
        children: <Widget>[educationListviewWidget(),loading ?LoadingIndicator:Container()],
      ),
    );
  }
}

class Users {
  int id;
  String name;
  String username;
  String email;

  Users({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
    );
  }
}
