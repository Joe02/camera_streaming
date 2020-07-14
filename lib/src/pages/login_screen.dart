import 'package:camera_streaming/src/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildLoginBody());
  }

  buildLoginBody() {
    return Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                Colors.purple,
                Colors.deepPurple,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: buildLoginCard());
  }

  buildLoginCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    "Login",
                    "E-mail",
                    "Digite seu e-mail",
                    Icons.email,
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(
                    "Login",
                    "Senha",
                    "Digite sua senha",
                    Icons.lock,
                  ),
                  RaisedButton(
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
