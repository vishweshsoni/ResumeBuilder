import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";
import 'login.dart';

import 'homepage.dart';

class SignUp extends StatelessWidget{

  BoxDecoration decoration = BoxDecoration(
      border: Border(
          bottom: BorderSide(
              color: Colors.blueGrey[700],
              width: 1.0
          )
      )
  );

  TextStyle CustomTextStyle(){
    return TextStyle(
        color: Colors.blueGrey[700],
        fontSize: 15.0
    );
  }

  Widget CustomSizeBox({double height}){
    return SizedBox(
      height:height,
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  FocusNode emailNode = FocusNode();
  FocusNode passawordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  GestureDetector(
      onTap:()=> FocusScope.of(context).requestFocus(new FocusNode()),
      child:Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: SignupPage()
          )
      ),
    );
  }
}

class SignupPage extends StatefulWidget{
  createState() => LoginState();
}

class LoginState extends State<SignupPage>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool loading = false;
  FocusNode nameNode;
  FocusNode emailNode;
  FocusNode passawordNode;

  String name="";
  String email="";
  String password="";

  Future<bool> _doSignup(String signup_name, String signup_email,String signup_password) async {
    print("hii");
    String url = 'http://resume-builder1.herokuapp.com/user/signup';
    Map<String, String> headers = {"Content-type": "application/json"};

    final response = await http.post(Uri.encodeFull(url),
        headers: headers,
          body: json.encode({"id": signup_email, "name": signup_name,"password":signup_password}));
    print(response.body.toString() + "qwerty");

    String ans = response.body.toString();

    var responseJson = jsonDecode(ans);

    var result = responseJson["error"];

        if(result==false)
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
            }
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passawordNode = FocusNode();
    emailNode = FocusNode();
    loading = false;

  }

  //Make Sign up  Request for the api call
  Future<String>  _makeSignUprequest(String name1,String email1,String password1) async{
    String url = 'http://resume-builder1.herokuapp.com/user/signup';
        final response = await http.post(Uri.encodeFull(url),
            headers: {"Content-Type": 'application/json',},
            body: json.encode({"id": email1, "password": password1,"name":name1}));
        print(response.body.toString() + "signup result");
        String ans = response.body.toString();
        var responseJson = jsonDecode(ans);
        var result = responseJson["error"];

          return result.toString();

  }




  BoxDecoration decoration = BoxDecoration(
      border: Border(
          bottom: BorderSide(
              color: Colors.blueGrey[700],
              width: 1.0
          )
      )
  );

  TextStyle CustomTextStyle(){
    return TextStyle(
        color: Colors.blueGrey[700],
        fontSize: 15.0
    );
  }

  InputDecoration CustomTextDecoration({String text,IconData icon}){
    return InputDecoration(
      labelStyle: TextStyle(
        color: Colors.blueGrey[700],
      ),
      labelText: text,
      prefixIcon: Icon(icon,color: Colors.blueGrey[700]),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.blueGrey[700]
          )
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white70
          )
      ),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey[700],
          )
      ),
    );
  }

  Widget CustomSizeBox({double height}){
    return SizedBox(
      height:height,
    );
  }

  Widget LoginButton(BuildContext context){
    return new SizedBox(
      height: 45.0,
      width: double.infinity,
      child: new RaisedButton(
        color: Colors.blueGrey[700],
        child: Text("Sign me up",style:TextStyle(color: Colors.white),),
        onPressed: () async{

          FocusScope.of(context).requestFocus(new FocusNode());
          if(_formKey.currentState.validate()){
            setState(() {
              loading = true;
            });
            Future.delayed(Duration(seconds: 2),(){
              setState(() {
                loading = false;
              });
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Login success"),

              ));
            });


          }else{
            setState(() {
              _autoValidate = true;

            });

          }
            await _doSignup(name,email,password);
        },
      ),
    );
  }

  Widget LoginUi(){
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        children: <Widget>[
          CustomSizeBox(height: 80.0),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            child: Text("SignUp",style: TextStyle(fontSize: 50.0,color: Colors.blueGrey[700],),),
          ),
          CustomSizeBox(height: 50.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child:Column(
              children: <Widget>[
                Container(
                    decoration: decoration
                ),
                TextFormField(
                  enabled: true,
                  enableInteractiveSelection: true,
                  focusNode: nameNode,
                  style: CustomTextStyle(),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction:TextInputAction.next,
                  decoration: CustomTextDecoration(icon: Icons.person,text: "UserName"),
                  textCapitalization: TextCapitalization.none,
                  onFieldSubmitted: (term){
                    nameNode.unfocus();
                    FocusScope.of(context).requestFocus(passawordNode);
                  },
                  validator: (value){
                    if (value.isEmpty) {
                      return 'Please enter Name';
                    }else if(!new  RegExp(r"^[a-zA-Z.]").hasMatch(value)){
                      return "Plase enter chracter ranging from [a-z or A-Z]";
                    }else{
                      name=value.toString();
                    }
                  },
                ),
                TextFormField(
                  enabled: true,
                  enableInteractiveSelection: true,
                  focusNode: emailNode,
                  style: CustomTextStyle(),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction:TextInputAction.next,
                  decoration: CustomTextDecoration(icon: Icons.email,text: "Email"),
                  textCapitalization: TextCapitalization.none,
                  onFieldSubmitted: (term){
                    emailNode.unfocus();
                    FocusScope.of(context).requestFocus(passawordNode);
                  },
                  validator: (value){
                    if (value.isEmpty) {
                      return 'Please enter email';
                    }else if(!new  RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                      return "Plase enter valid email";
                    }else{
                      email=value.toString();
                    }
                  },
                ),
                TextFormField(
                  enabled: true,
                  enableInteractiveSelection: true,
                  obscureText: true,
                  textInputAction:TextInputAction.done,
                  style: CustomTextStyle(),
                  focusNode: passawordNode,
                  decoration: CustomTextDecoration(icon: Icons.lock,text: "Password"),
                  validator: (value){
                    if (value.isEmpty) {
                      return 'Please enter password';
                    }else if(value.length < 6){
                      return 'Password must be 6 digit';
                    }else{
                        password=value.toString();
                    }
                  },
                ),
                CustomSizeBox(height: 20.0),
                LoginButton(context),
                CustomSizeBox(
                    height: 30.0
                ),

                SizedBox(height: MediaQuery.of(context).size.height/9,width: MediaQuery.of(context).size.width/9,),
                GestureDetector(
                  onTap: (){
                    print("Login tapped");

                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Already User Login",
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


  Widget LoadingIndicator(){
    return Positioned(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[700],
        child: Center(
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: CircularProgressIndicator(
                strokeWidth:0.7
            ),
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        LoginUi(),
        loading ? LoadingIndicator() : Container()
      ],
    );
  }
}

