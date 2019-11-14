import 'package:flutter/material.dart';
import 'package:resume_app/sizeconfig.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController address = new TextEditingController();


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
                      controller: name,
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
                      controller: email,
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
                      controller: dob,
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
                      controller: address,
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
