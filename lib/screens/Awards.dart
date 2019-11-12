import 'package:flutter/material.dart';
import 'package:resume_app/sizeconfig.dart';

class Awards extends StatefulWidget {
  @override
  _AwardsState createState() => _AwardsState();
}

class _AwardsState extends State<Awards> {

  TextEditingController awards = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Awards",
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
                      controller: awards,
                      maxLines: 10,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                   //     prefixIcon: Icon(Icons.verified_user, color: Colors.blueGrey, size: 25.0,),
                        labelText: "Awards/Achievements",
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