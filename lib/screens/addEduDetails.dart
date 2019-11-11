import 'package:flutter/material.dart';
import 'package:resume_app/sizeconfig.dart';

class AddEduDetails extends StatefulWidget {
  @override
  _AddEduDetailsState createState() => _AddEduDetailsState();
}

class _AddEduDetailsState extends State<AddEduDetails> {

  TextEditingController degree = new TextEditingController();
  TextEditingController uni = new TextEditingController();
  TextEditingController year = new TextEditingController();
  TextEditingController cpi = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Add Education Details",style: TextStyle(color: Colors.white),),
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
            onPressed: (){},
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
                      controller: degree,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.school, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Degree",
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
                      controller: uni,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.school, color: Colors.blueGrey, size: 25.0,),
                        labelText: "University",
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
                      controller: year,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.date_range, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Year",
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
                      controller: cpi,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.playlist_add, color: Colors.blueGrey, size: 25.0,),
                        labelText: "CPI/Percentage",

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
