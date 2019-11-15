import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:resume_app/model/user.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  BoxDecoration decoration = BoxDecoration(
      border:
          Border(bottom: BorderSide(color: Colors.blueGrey[700], width: 1.0)));

  TextStyle CustomTextStyle() {
    return TextStyle(color: Colors.blueGrey[700], fontSize: 15.0);
  }

  Widget CustomSizeBox({double height}) {
    return SizedBox(
      height: height,
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  FocusNode emailNode = FocusNode();
  FocusNode passawordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(child: LoginPage())),
    );
  }
}

class LoginPage extends StatefulWidget {
  createState() => LoginState();
}


class LoginState extends State<LoginPage>{

  SharedPreferences prefs;

  TextEditingController email1 = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Future<User>  user;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool loading = false;
  FocusNode emailNode;
  FocusNode passawordNode;
  String tobeDisplayed = "Hi";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passawordNode = FocusNode();
    emailNode = FocusNode();
    loading = false;
  }

  Future<bool> _getLogin(String email, String password) async
  {

    String url = 'http://192.168.137.1:8080/user/login';
    Map<String,String> headers = {"Content-type": "application/json"};

    final response = await http.post(Uri.encodeFull(url),
        headers: headers,
        body: json.encode({"id": email, "password": password}));
    print(response.body.toString() + "qwerty");

    String ans = response.body.toString();

    var responseJson = jsonDecode(ans);

    var result = responseJson["error"];


        var u_id = responseJson["data"]["id"].toString();
        prefs = await SharedPreferences.getInstance();
        print("personal_de");
        print(u_id);

        if(result==false)
          {
            prefs.setString('u_id', u_id);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }


  }

  BoxDecoration decoration = BoxDecoration(
      border:
          Border(bottom: BorderSide(color: Colors.blueGrey[700], width: 1.0)));

  TextStyle CustomTextStyle() {
    return TextStyle(color: Colors.blueGrey[700], fontSize: 15.0);
  }

  InputDecoration CustomTextDecoration({String text, IconData icon}) {
    return InputDecoration(
      labelStyle: TextStyle(
        color: Colors.blueGrey[700],
      ),
      labelText: text,
      prefixIcon: Icon(icon, color: Colors.blueGrey[700]),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[700])),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.blueGrey[700],
      )),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.blueGrey[700],
      )),
    );
  }

  Widget CustomSizeBox({double height}) {
    return SizedBox(
      height: height,
    );
  }

  Widget LoginButton(BuildContext context) {
    return new SizedBox(
      height: 45.0,
      width: double.infinity,
      child: new RaisedButton(
        color: Colors.blueGrey[700],
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () async {
          FocusScope.of(context).requestFocus(new FocusNode());
          if (_formKey.currentState.validate()) {
            setState(() {
              loading = true;
            });


            Future.delayed(Duration(seconds: 7), () {

              setState(() {
                loading = false;
              });
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text('${tobeDisplayed}'),
              ));
            });
          } else {
            setState(() {
              _autoValidate = true;
            });
          }


          await _getLogin(email1.text, password.text);



//            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

        },
      ),
    );
  }

  Widget LoginUi() {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        children: <Widget>[
          CustomSizeBox(height: 80.0),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            child: Text(
              "Login Here",
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.blueGrey[700],
              ),
            ),
          ),
          CustomSizeBox(height: 50.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: <Widget>[
                Container(decoration: decoration),
                TextFormField(
                  controller: email1,
                  enabled: true,
                  enableInteractiveSelection: true,
                  focusNode: emailNode,
                  style: CustomTextStyle(),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration:
                      CustomTextDecoration(icon: Icons.person, text: "Email"),
                  textCapitalization: TextCapitalization.none,
                  onFieldSubmitted: (term) {
                    emailNode.unfocus();
                    FocusScope.of(context).requestFocus(passawordNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter email';
                    } else if (!new RegExp(
                            r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Plase enter valid email";
                    }
                  },
                ),
                TextFormField(
                  controller: password,
                  enabled: true,
                  enableInteractiveSelection: true,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  style: CustomTextStyle(),
                  focusNode: passawordNode,
                  decoration:
                      CustomTextDecoration(icon: Icons.lock, text: "Password"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter password';
                    } else if (value.length < 6) {
                      return 'Password must be 6 digit';
                    }
                  },
                ),
                CustomSizeBox(height: 20.0),
                LoginButton(context),
                CustomSizeBox(height: 30.0),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Forgot password ?",
                    style: TextStyle(
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 9,
                  width: MediaQuery.of(context).size.width / 9,
                ),
                GestureDetector(
                  onTap: () {
                    print("signup pressed");
                    Navigator.of(context).pushNamed('/SignupPage');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "First time user SignUp",
                      style: TextStyle(
                        color: Colors.blueGrey[700],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget LoadingIndicator() {
    return Positioned(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[700],
        child: Center(
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: CircularProgressIndicator(strokeWidth: 0.7),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[LoginUi(), loading ? LoadingIndicator() : Container()],
    );
  }
}
