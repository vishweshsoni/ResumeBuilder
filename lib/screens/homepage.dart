import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_app/screens/project.dart';
import 'package:resume_app/sizeconfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'educationdetails1.dart';
import 'personal_details.dart';
import 'educationdetails.dart';
import 'Awards.dart';
import 'Experience.dart';
import 'skills.dart';
import 'interest.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences prefs;
  var u_id;
  String uid="";


  getdata() async{
    prefs = await SharedPreferences.getInstance();
    u_id = prefs.getString("u_id");
    uid = u_id.toString();
    print(u_id);

  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }


  Color colorx = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Center(child: Text("Resume Builder",style: TextStyle(color: Colors.white),)),
            automaticallyImplyLeading: false, // Used for removing back buttoon.

          ),
          body: SingleChildScrollView(
            child: Stack(
        children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: MediaQuery.of(context).size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('Assets/images/profile.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                GestureDetector(

                                  onTap: () {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PersonalDetails()));
                                  },
                                  child: Text(
                                    "Personal Detail",
                                    style: TextStyle(
                                        color: colorx,
                                        fontFamily: 'Oswald',
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: MediaQuery.of(context).size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                      image: new AssetImage(
                                          'Assets/images/education.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                GestureDetector(

                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EducationDetails1(u_id)));
                                    },
                                    child: Text(
                                      "Education",
                                      style: TextStyle(
                                          color: colorx,
                                          fontFamily: 'Oswald',
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: MediaQuery.of(context).size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                      image: new AssetImage(
                                          'Assets/images/skills.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Skills()));
                                  },
                              child:  Text(
                                  "Skills",
                                  style: TextStyle(
                                      color: colorx,
                                      fontFamily: 'Oswald',
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: MediaQuery.of(context).size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                      image: new AssetImage(
                                          'Assets/images/experience.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Experience()));
                                  },
                              child:  Text(
                                  "Experience",
                                  style: TextStyle(
                                      color: colorx,
                                      fontFamily: 'Oswald',
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                ))
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: MediaQuery.of(context).size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                      image: new AssetImage(
                                          'Assets/images/projects.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: (){

                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) =>
                                    Projects(u_id)));
                                    },
                                    child:  Text(
                                      "Projects",
                                      style: TextStyle(
                                          color: colorx,
                                          fontFamily: 'Oswald',
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal),
                                    )),

                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: MediaQuery.of(context).size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                      image: new AssetImage(
                                          'Assets/images/awards.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Awards()));
                                  },
                                child : Text(
                                  "Achivements",
                                  style: TextStyle(
                                      color: colorx,
                                      fontFamily: 'Oswald',
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[

                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: MediaQuery.of(context).size.height / 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                      image: new AssetImage(
                                          'Assets/images/hobbies.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Interest()));
                                  },
                                  child: Text(
                                    "Intrest & Hobbies",
                                    style: TextStyle(
                                        color: colorx,
                                        fontFamily: 'Oswald',
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: MediaQuery.of(context).size.height / 12,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: colorx,
                                      boxShadow: [
                                        BoxShadow(color: Colors.black12),
                                      ]),
                                  child: IconButton(
                                    splashColor: Colors.pinkAccent,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20.0,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Text(
                                  "Preview",
                                  style: TextStyle(
                                      color: colorx,
                                      fontFamily: 'Oswald',
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                        ),
                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: MediaQuery.of(context).size.height / 12,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: colorx,
                                      boxShadow: [
                                        BoxShadow(color: Colors.black12),
                                      ]),
                                  child: IconButton(
                                    splashColor: Colors.pinkAccent,
                                    icon: Icon(
                                      Icons.file_download,
                                      size: 25.0,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Text(
                                  "Download",
                                  style: TextStyle(
                                      color: colorx,
                                      fontFamily: 'Oswald',
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
          )),
    );
  }
}
