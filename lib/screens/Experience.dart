import 'package:flutter/material.dart';
import 'package:resume_app/sizeconfig.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {

  SharedPreferences prefs;
  var u_id;
  String uid="";

  TextEditingController controllerExperience = new TextEditingController();

  getdata() async{
    prefs = await SharedPreferences.getInstance();
    u_id = prefs.getString("u_id");
    uid = u_id.toString();
    print(u_id);
    _getExperienceDetails();
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  Future<String>_getExperienceDetails() async
  {
    print("hello");
    print(uid);
    String url = 'http://resume-builder1.herokuapp.com/resume/getExperience/'+uid;
    print(url);
    Map<String,String> headers = {"Content-type": "application/json"};

    final data = await http.get(Uri.encodeFull(url),headers: headers);
    var jsonData1 = json.decode(data.body.toString());
    String experience = jsonData1["data"][0]["exp"];


    controllerExperience =  TextEditingController(text: experience);


    print("experienceDetails");
    print(jsonData1);

  }


  Future<String> _AddExperience(String experience) async
  {
    String url = 'http://resume-builder1.herokuapp.com/resume/addExperience/'+uid;
    print(url);
    Map<String,String> headers = {"Content-type": "application/json"};

    final response = await http.post(Uri.encodeFull(url),
        headers: headers,
        body: json.encode({"experience": experience}));
    print(response.body.toString() + "qwerty");

    String ans = response.body.toString();

    var responseJson = jsonDecode(ans);

    var result = responseJson["error"];

    if(result==false)
    {
      Fluttertoast.showToast(
          msg: "Added Details",
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
        title: Text(
          "Experience",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){},
          ),
          IconButton(
            icon: const Icon(Icons.check),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){
              _AddExperience(controllerExperience.text);
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
                      controller: controllerExperience,
                      maxLines: 10,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        //     prefixIcon: Icon(Icons.verified_user, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Experience",
                        labelStyle: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,

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
            )
          ],

        ),
      ),

    );
  }
}
