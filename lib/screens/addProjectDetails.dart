import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../sizeconfig.dart';
import 'homepage.dart';

class ProjectDetails extends StatefulWidget {
  var uid;
  ProjectDetails(this.uid);
  @override
  _ProjectDetailsState createState() => _ProjectDetailsState(this.uid);
}

class _ProjectDetailsState extends State<ProjectDetails> {
  var uid;
  TextEditingController description = new TextEditingController();
  TextEditingController title = new TextEditingController();
  TextEditingController duration = new TextEditingController();
  TextEditingController mentor = new TextEditingController();
  TextEditingController team_size = new TextEditingController();

  _ProjectDetailsState(this.uid);

  Future<String> doBackgroudcall(String pTitle,String pDescription,String pDuration,String pMentor,String pTeamSize)async{

        String url='http://resume-builder1.herokuapp.com/resume/addProject'+uid;
        print(url);

        Map<String,String> headers = {"Content-type": "application/json"};
        final response = await http.post(Uri.encodeFull(url),
          headers: headers,
          body: json.encode(
              {"description": pDescription,
                "title": pTitle,
                "duration":pDuration,
                "mentor":pMentor,
                "team_size":pTeamSize
              })
        );

        print(response.body.toString() + "Response of AddedProjects");
        String ans = response.body.toString();
        var responseJson = jsonDecode(ans);
        var result = responseJson["error"];

        if(result==false)
        {
          Fluttertoast.showToast(
              msg: "Project Details added",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.black87,
              fontSize: 16.0
          );
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }




  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Add Project Details",style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){

            },
          ),
          IconButton(
            icon: const Icon(Icons.check),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){
              doBackgroudcall(title.text.toString(),description.text.toString(),duration.text.toString(),mentor.text.toString(),team_size.text.toString());
            },
          ),
        ],
      ),

      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[

            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(
                  SizeConfig.safeBlockVertical * 6),

              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: title,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.school, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Titile",
                        labelStyle: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//                        focusedBorder: UnderlineInputBorder(
//                          borderSide: BorderSide(
//                              color: Colors.blueGrey
//                          ),
//                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: description,
                      maxLines: 7,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.school, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Description",
                        contentPadding: EdgeInsets.zero,
                        labelStyle: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//                        focusedBorder: UnderlineInputBorder(
//                          borderSide: BorderSide(
//                              color: Colors.blueGrey
//                          ),
//                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: duration,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.date_range, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Duration",
                        labelStyle: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//                        focusedBorder: UnderlineInputBorder(
//                          borderSide: BorderSide(
//                              color: Colors.blueGrey
//                          ),
//                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: mentor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.playlist_add, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Mentor",

                        labelStyle: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//                        focusedBorder: UnderlineInputBorder(
//                          borderSide: BorderSide(
//                              color: Colors.blueGrey
//                          ),
//                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: mentor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Team Size",

                        labelStyle: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//                        focusedBorder: UnderlineInputBorder(
//                          borderSide: BorderSide(
//                              color: Colors.blueGrey
//                          ),
//                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
