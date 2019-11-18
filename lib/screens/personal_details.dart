import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resume_app/sizeconfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {

  SharedPreferences prefs;
  var u_id;
  String uid="";

  TextEditingController controller_name;
  TextEditingController controller_email;
  TextEditingController controller_dob;
  TextEditingController controller_address;


  getdata() async{
    prefs = await SharedPreferences.getInstance();
    u_id = prefs.getString("u_id");
    uid = u_id.toString();
    print(u_id);
    _getUserDetails();
  }



  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }




  Future<String>_getUserDetails() async
  {
    print("hello");
    print(uid);
    String url = 'http://resume-builder1.herokuapp.com/user/getUserById/'+uid;
    print(url);
    Map<String,String> headers = {"Content-type": "application/json"};

    final data = await http.get(Uri.encodeFull(url),headers: headers);
    var jsonData1 = json.decode(data.body.toString());
    String email = jsonData1["data"]["id"];
    String name = jsonData1["data"]["name"];
    String dob = jsonData1["data"]["dob"];
    String address = jsonData1["data"]["address"];

    controller_name =  TextEditingController(text: name);
    controller_email =  TextEditingController(text: email);
    controller_dob =  TextEditingController(text: dob);
    controller_address =  TextEditingController(text: address);

    print("userdetails");
    print(jsonData1);

  }
  Future<String> _AddPersonalDetails(String dob,String address) async
  {
    String url = 'http://resume-builder1.herokuapp.com/resume/addUserDetail/'+uid;
    Map<String,String> headers = {"Content-type": "application/json"};

    final response = await http.post(Uri.encodeFull(url),
        headers: headers,
        body: json.encode({"address": address, "dob": dob}));
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
        title: Text("Personal Details",style: TextStyle(color: Colors.white),),
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
              _AddPersonalDetails(controller_dob.text, controller_address.text);
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
                      enabled: false,
                      controller: controller_name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Name",
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
                      enabled: false,
                      controller: controller_email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Email",
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
                      autofocus: true,
                      controller: controller_dob,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.date_range, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Birthdate",
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
                      controller: controller_address,
                      maxLines: 4,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Address",

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
