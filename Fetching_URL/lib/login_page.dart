import 'package:GalleryCam/Constants.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final bgColor = const Color(0xFF34495e);
  final barColor = const Color(0xFF2C3A47);
  final boxColor = const Color(0xFF191919);
  final borColor = const Color(0xFF3498db);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Login Page",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: barColor,
      ),
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: SingleChildScrollView(
                child: Container(
                  child: Card(
                    color: boxColor,
                    child: Column(
                      children: <Widget>[
                        Form(
                            child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 0.5,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24.0)),
                                    borderSide:
                                        BorderSide(color: borColor, width: 2),
                                  ),
                                  hintText: "Enter Username",
                                  labelText: "Username",
                                  focusColor: Colors.white,
                                  filled: true,
                                  labelStyle: new TextStyle(
                                      color: Colors.white24, fontSize: 16.0),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                obscureText: true,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24.0),
                                    ),
                                    borderSide:
                                        BorderSide(color: borColor, width: 2),
                                  ),
                                  hintText: "Enter Password",
                                  labelText: "Password",
                                  focusColor: Colors.white,
                                  filled: true,
                                  labelStyle: new TextStyle(
                                    color: Colors.white24,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              // Navigator.push<MaterialPageRoute>(
                              //     context,
                              //     // ignore: always_specify_types
                              //     MaterialPageRoute(
                              //         builder: (context) => App()));
                              Constants.prefs.setBool("loggedIn", true);
                              Navigator.pushReplacementNamed(context, "/home");
                            },
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: boxColor,
                                  border: Border.all(
                                      color:
                                          Color(0xff2ecc71), // set border color
                                      width: 2.0), // set border width
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          24.0)), // set rounded corner radius
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black,
                                        offset: Offset(1, 3))
                                  ] // make rounded corner of border
                                  ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            color: boxColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
