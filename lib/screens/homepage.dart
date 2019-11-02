import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_app/sizeconfig.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Resume Builder",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Oswald',
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                    Container(
                      child: CircleAvatar(
                        maxRadius: 20.0,
                        child: IconButton(
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
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
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.amber
                              ),
                              child: IconButton(
                                splashColor: Colors.lightBlueAccent,
                                icon: Icon(
                                  Icons.person,
                                  size: 35.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Text("hi")
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
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.amber
                              ),
                              child: IconButton(
                                splashColor: Colors.lightBlueAccent,
                                icon: Icon(
                                  Icons.person,
                                  size: 35.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Text("hi")
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
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.amber
                              ),
                              child: IconButton(
                                splashColor: Colors.lightBlueAccent,
                                icon: Icon(
                                  Icons.person,
                                  size: 35.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Text("hi")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17,
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
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.amber
                              ),
                              child: IconButton(
                                splashColor: Colors.lightBlueAccent,
                                icon: Icon(
                                  Icons.person,
                                  size: 35.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Text("hi")
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
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.amber
                              ),
                              child: IconButton(
                                splashColor: Colors.lightBlueAccent,
                                icon: Icon(
                                  Icons.person,
                                  size: 35.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Text("hi")
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
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.amber
                              ),
                              child: IconButton(
                                splashColor: Colors.lightBlueAccent,
                                icon: Icon(
                                  Icons.person,
                                  size: 35.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Text("hi")
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
      ),
    );
  }
}
