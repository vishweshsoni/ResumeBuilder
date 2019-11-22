import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
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
import 'package:http/http.dart' as http;
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
                                    )
                                  ),

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
                                    onPressed: () {
                                      Printing.layoutPdf(
                                        onLayout: buildPdf,
                                      );
                                    },
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
  Future<List<int>> buildPdf(PdfPageFormat format) async{

    var data = await http.get('http://resume-builder1.herokuapp.com/resume/getResume/78f45f92-b8b6-478a-b732-8fec2afaadf5',headers: {"Content-Type": "application/json"});
    print(data.body+"vidisha");
    var jsonData1 = json.decode(data.body);
    print(jsonData1["data"][0]["id"]);

    final pdf.Document doc = pdf.Document();
    String jsonData = '{"userId": 1,"id": 1,"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit","body": "quia et suscipitsuscipit recusandae consequuntur expedita et cumreprehenderit molestiae ut ut quas totamnostrum rerum est autem sunt rem eveniet architecto"}';
    var jsonParse = json.decode(jsonData);
    Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => await Printing.convertHtml(
          format: format,
          html: '<html>'
              +'<head>'
              +'<style>'
               +'table {border-collapse: collapse;  width: 100%;  height: 100px;}'
                +'table, tr,td, th {border: 1px solid black;} '
                +'.div_img{float:left;margin-right: 50px;}'
              +'</style>'+'</head>'
              +'<body>'
              +'<div class="flex-container">'
              +'<div class="div_img">'
              +'<img src="https://media.glassdoor.com/sqll/458917/da-iict-squarelogo.png" alt="web-img" width="110" height="110">'
              +'</div>'
              +'<div>'
              +'<h1><b>'+jsonData1["data"][0]["name"]+'</b></h1>'
              +'<div>Email : '+jsonData1["data"][0]["id"]+'</div>'
              +'<div>DOB: '+'1997-08-25'+'</div>'
              +'<div>Address: '+'204,Shreeji Palace,Near paliyadnagar bus stop,Ahmedabad.'+'</div>'
              +'</div>'
              +'</div>'
              +'</p>'
              +'<hr size="5" background="black">'
              +'<div>'
                +'<h1>'+'Education'+'</h1>'
              +'</div>'
              +'<table>'
                +'<tr>'
                  +'<td>'+'<b>'+'Degree'+'</b>'+'</td>'
                  +'<td>'+'<b>'+'University'+'</b>'+'</td>'
                  +'<td>'+'<b>'+'Year'+'</b>'+'</td>'
                  +'<td>'+'<b>'+'CPI'+'</b>'+'</td>'
                +'</tr>'
                +'<tr>'
                  +'<td>'+jsonData1["data"][4][0]["degree"]+'</td>'
                  +'<td>'+jsonData1["data"][4][0]["university"]+'</td>'
                  +'<td>'+jsonData1["data"][4][0]["year"]+'</td>'
                  +'<td>'+jsonData1["data"][4][0]["cpi"]+'</td>'
                +'</tr>'
                +'<tr>'
                    +'<td>'+jsonData1["data"][4][1]["degree"]+'</td>'
                    +'<td>'+jsonData1["data"][4][1]["university"]+'</td>'
                    +'<td>'+jsonData1["data"][4][1]["year"]+'</td>'
                    +'<td>'+jsonData1["data"][4][1]["cpi"]+'</td>'
                +'</tr>'
                  +'<tr>'
                    +'<td>'+jsonData1["data"][4][2]["degree"]+'</td>'
                    +'<td>'+jsonData1["data"][4][2]["university"]+'</td>'
                    +'<td>'+jsonData1["data"][4][2]["year"]+'</td>'
                    +'<td>'+jsonData1["data"][4][2]["cpi"]+'</td>'
                  +'</tr>'
                +'<tr>'
                    +'<td>'+jsonData1["data"][4][3]["degree"]+'</td>'
                    +'<td>'+jsonData1["data"][4][3]["university"]+'</td>'
                    +'<td>'+jsonData1["data"][4][3]["year"]+'</td>'
                    +'<td>'+jsonData1["data"][4][3]["cpi"]+'</td>'
                +'</tr>'
                +'</table>'
                +'<div>'
                +'<h1>'+'Skills'+'</h1>'
                +'</div>'
                +'<div>'
                +'<table>'
                  +'<tr>'
                      +'<td><b>'+'Area of Interest'+'</b></td>'
                      +'<td>'+jsonData1["data"][6][0]["area_of_interest"]+'</td>'
                  +'</tr>'
                  +'<tr>'
                      +'<td><b>'+'Programming Languages'+'</b></td>'
                      +'<td>'+jsonData1["data"][6][0]["prog_lang"]+'</td>'
                  +'</tr>'
                  +'<tr>'
                      +'<td><b>'+'Framework'+'</b></td>'
                      +'<td>'+jsonData1["data"][6][0]["framework"]+'</td>'
                  +'</tr>'
                  +'<tr>'
                      +'<td><b>'+'Tools'+'</b></td>'
                      +'<td>'+jsonData1["data"][6][0]["tools"]+'</td>'
                  +'</tr>'
                  +'<tr>'
                      +'<td><b>'+'Technologies'+'</b></td>'
                      +'<td>'+jsonData1["data"][6][0]["technologies"]+'</td>'
                  +'</tr>'
                  +'</table>'
                    //+'<p>'+'<h3>'+'Expertise Area/Area(s) of Intrest: '+'</h3>'+jsonData1["data"][6][0]["area_of_interest"]+'</p>'
                +'</div>'

                +'<div><h1>'+'Projects'+'</h1></div>'
                +'<div>'
                    +'<h2>'+jsonData1["data"][5][0]["title"]+'</h2>'
                    +'<p><b>'+'Duration :</b>'+jsonData1["data"][5][0]["duration"]+'</p>'
                    +'<p><b>'+'Mentor :</b>'+jsonData1["data"][5][0]["mentor"]+'</p>'
                    +'<p><b>'+'Team Size :</b>'+jsonData1["data"][5][0]["team_size"]+'</p>'
                    +'<p><b>'+'Description :</b>'+jsonData1["data"][5][0]["description"]+'</p>'

                    +'<h2>'+jsonData1["data"][5][1]["title"]+'</h2>'
                    +'<p><b>'+'Duration :</b>'+jsonData1["data"][5][1]["duration"]+'</p>'
                    +'<p><b>'+'Mentor :</b>'+jsonData1["data"][5][1]["mentor"]+'</p>'
                    +'<p><b>'+'Team Size :</b>'+jsonData1["data"][5][1]["team_size"]+'</p>'
                    +'<p><b>'+'Description :</b>'+jsonData1["data"][5][1]["description"]+'</p>'

                    +'<h2>'+jsonData1["data"][5][2]["title"]+'</h2>'
                    +'<p><b>'+'Duration :</b>'+jsonData1["data"][5][2]["duration"]+'</p>'
                    +'<p><b>'+'Mentor :</b>'+jsonData1["data"][5][2]["mentor"]+'</p>'
                    +'<p><b>'+'Team Size :</b>'+jsonData1["data"][5][2]["team_size"]+'</p>'
                    +'<p><b>'+'Description :</b>'+jsonData1["data"][5][2]["description"]+'</p>'
                +'</div>'

                +'<div>'
                  +'<h1>'+'Positions of Responsibility'+'</h1>'
                  +'<ul>'
                    +'<li>'+jsonData1["data"][2][0]["awards"]+'</li>'
                  +'<ul>'
                +'</div>'

                +'<div>'
                  +'<h1>'+'Interest & Hobbies'+'</h1>'
                  +'<ul>'
                    +'<li>'+jsonData1["data"][3][0]["interest"]+'</li>'
                  +'<ul>'
                +'</div>'


                  '</body></html>',
        ));

//    doc.addPage(
//      pdf.Page(
//        pageFormat: format,
//        build: (pdf.Context context) {
//          return pdf.ConstrainedBox(
//            constraints: const pdf.BoxConstraints.expand(),
//            child: pdf.FittedBox(
//              child: pdf.Text(
//                'Hello World',
//              ),
//            ),
//          );
//        },
//      ),
//    );

    return doc.save();
  }



}
