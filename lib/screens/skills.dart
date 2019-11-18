import 'package:flutter/material.dart';
import 'package:resume_app/sizeconfig.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {

  SharedPreferences prefs;
  var u_id;
  String uid="";


  TextEditingController controller_area_of_interest = new TextEditingController();
  TextEditingController controller_prog_lang = new TextEditingController();
  TextEditingController controller_framework = new TextEditingController();
  TextEditingController controller_tools = new TextEditingController();
  TextEditingController controller_technologies = new TextEditingController();



  getdata() async{
    prefs = await SharedPreferences.getInstance();
    u_id = prefs.getString("u_id");
    uid = u_id.toString();
    print(u_id);
    _getSkillDetails();
  }

  Future<String>_getSkillDetails() async
  {
    print("hello");
    print(uid);
    String url = 'http://resume-builder1.herokuapp.com/resume/getSkills/'+uid;
    print(url);
    Map<String,String> headers = {"Content-type": "application/json"};

    final data = await http.get(Uri.encodeFull(url),headers: headers);
    var jsonData1 = json.decode(data.body.toString());
    String a_of_interest = jsonData1["data"][0]["area_of_interest"];
    String prog_lang = jsonData1["data"][0]["prog_lang"].toString();
    String framework = jsonData1["data"][0]["framework"];
    String tools = jsonData1["data"][0]["tools"];
    String technologies = jsonData1["data"][0]["technologies"];

    controller_area_of_interest =  TextEditingController(text: a_of_interest);
    controller_prog_lang =  TextEditingController(text: prog_lang);
    controller_framework =  TextEditingController(text: framework);
    controller_tools =  TextEditingController(text: tools);
    controller_technologies = TextEditingController(text: technologies);

    print("userdetails");
    print(jsonData1);

  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }



  Future<String> _AddSkills(String a_of_interest,String prog_lang,String framework,String tools, String technologies) async
  {
    String url = 'http://resume-builder1.herokuapp.com/resume/addSkill/'+uid;
    Map<String,String> headers = {"Content-type": "application/json"};

    final response = await http.post(Uri.encodeFull(url),
        headers: headers,
        body: json.encode({"area_of_interest": a_of_interest, "prog_lang": prog_lang, "framework":framework, "tools":tools, "technologies":technologies}));
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Add Skills",style: TextStyle(color: Colors.white),),
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
              _AddSkills(controller_area_of_interest.text, controller_prog_lang.text,
                  controller_framework.text, controller_tools.text, controller_technologies.text);
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
                      autofocus: true,
                      controller: controller_area_of_interest,
                      decoration: InputDecoration(
                        labelText: "Area of Interest",
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
                      controller: controller_prog_lang,
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: "Programing Languages",
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
                      controller: controller_framework,
                      decoration: InputDecoration(
                        labelText: "Framework",
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
                      controller: controller_tools,
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: "Tools",

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
                      controller: controller_technologies,
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: "Technologies",

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

    );;
  }
}

