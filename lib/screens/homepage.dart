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
          body: Stack(
        children: <Widget>[

          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 48,
                ),
                Container(
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
                          backgroundColor: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
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
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12),
                                    ]),
                                child: IconButton(
                                  splashColor: Colors.lightBlueAccent,
                                  icon: Icon(
                                    Icons.person,
                                    size: 35.0,
                                    color: Colors.white,
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
                                height: MediaQuery.of(context).size.height / 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12),
                                    ]),
                                child: IconButton(
                                  splashColor: Colors.lightBlueAccent,
                                  icon: Icon(
                                    Icons.person,
                                    size: 35.0,
                                    color: Colors.white,
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
                                height: MediaQuery.of(context).size.height / 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12),
                                    ]),
                                child: IconButton(
                                  splashColor: Colors.lightBlueAccent,
                                  icon: Icon(
                                    Icons.person,
                                    size: 35.0,
                                    color: Colors.white,
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
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12),
                                    ]),
                                child: IconButton(
                                  splashColor: Colors.lightBlueAccent,
                                  icon: Icon(
                                    Icons.person,
                                    size: 35.0,
                                    color: Colors.white,
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
                                height: MediaQuery.of(context).size.height / 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12),
                                    ]),
                                child: IconButton(
                                  splashColor: Colors.lightBlueAccent,
                                  icon: Icon(
                                    Icons.person,
                                    size: 35.0,
                                    color: Colors.white,
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
                                height: MediaQuery.of(context).size.height / 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12),
                                    ]),
                                child: IconButton(
                                  splashColor: Colors.lightBlueAccent,
                                  icon: Icon(
                                    Icons.person,
                                    size: 35.0,
                                    color: Colors.white,
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
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12),
                                    ]),
                                child: IconButton(
                                  splashColor: Colors.lightBlueAccent,
                                  icon: Icon(
                                    Icons.person,
                                    size: 35.0,
                                    color: Colors.white,
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
                                height: MediaQuery.of(context).size.height / 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12),
                                    ]),
                                child: IconButton(
                                  splashColor: Colors.lightBlueAccent,
                                  icon: Icon(
                                    Icons.person,
                                    size: 35.0,
                                    color: Colors.white,
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
                                    color: Colors.grey.shade400,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12),
                                    ]),
                                child: IconButton(
                                  splashColor: Colors.lightBlueAccent,
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Text("Preview")
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
                                    color: Colors.grey.shade400,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12),
                                    ]),
                                child: IconButton(
                                  splashColor: Colors.lightBlueAccent,
                                  icon: Icon(
                                    Icons.file_download,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Text("Download")
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
       )
      ),
    );
  }
}
