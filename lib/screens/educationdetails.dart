import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'addEduDetails.dart';

class EducationDetails extends StatefulWidget {
  @override
  _EducationDetailsState createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  final String uri = 'https://jsonplaceholder.typicode.com/users';
  Future<List<Users>> _fetchUsers() async {
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Users> listOfUsers = items.map<Users>((json) {
        return Users.fromJson(json);
      }).toList();

      return listOfUsers;
    } else {
      throw Exception('Failed to load internet');
    }
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
      body: FutureBuilder<List<Users>>(
        future: _fetchUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map((user) => GestureDetector(
                      onTap: () {
                        if (user.name == "Ervin Howell") {
                          print("hi");
                        }
                      },
                      child: ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Text(user.name[0],
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              )),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ))
                .toList(),
          );
        },
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
