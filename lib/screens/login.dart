// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shoes_store/screens/Home_screen.dart';
import 'package:page_transition/page_transition.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  bool visible = true;
  Map<String, String> _map = {"email": "", "password": ""};
  @override
  Widget build(BuildContext context) {
    double the_size_height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    double the_size_width = MediaQuery.of(context).size.width;

    // final  _password_controller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Clean Shoes",
              style: TextStyle(
                  color: Color.fromARGB(255, 23, 111, 183), fontSize: 40),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            alignment: Alignment.topCenter,
            width: the_size_width * 0.8,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: 300,
                  child: Image.asset(
                    "assets/images/login_logo.png",
                  ),
                ),
                Container(
                  child: Form(
                    key: globalKey,
                    child: Column(
                      children: [
                        TextFormField(
                            validator: (val) {
                              if (val!.isEmpty || !val.contains("@")) {
                                return "invalid E-mail";
                              }
                              return null;
                            },
                            onSaved: ((newValue) =>
                                _map["email"] = newValue as String),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Color.fromARGB(255, 23, 111, 183),
                            decoration: InputDecoration(
                              label: Text("E-Mail"),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 23, 111, 183),
                                  fontWeight: FontWeight.bold),
                              prefixIcon: Icon(Icons.email,
                                  color: Color.fromARGB(255, 23, 111, 183)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 23, 111, 183)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 23, 111, 183)),
                                  borderRadius: BorderRadius.circular(50.0)),
                            )),
                        SizedBox(
                          height: the_size_height * 0.04,
                        ),
                        TextFormField(
                            validator: (val) {
                              if (val!.isEmpty || val.length <= 5) {
                                return "invalid password";
                              }
                              return null;
                            },
                            onSaved: ((newValue) =>
                                _map["password"] = newValue as String),
                            // controller: _password_controller,
                            obscureText: visible,
                            cursorColor: Color.fromARGB(255, 23, 111, 183),
                            decoration: InputDecoration(
                              label: Text("password"),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 23, 111, 183),
                                  fontWeight: FontWeight.bold),
                              prefixIcon: IconButton(
                                  icon: visible
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      visible = !visible;
                                    });
                                  },
                                  color: Color.fromARGB(255, 23, 111, 183)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 23, 111, 183)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 23, 111, 183)),
                                  borderRadius: BorderRadius.circular(50.0)),
                            )),
                        SizedBox(
                          height: the_size_height * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                    minWidth: double.infinity,
                    height: 58,
                    color: Color.fromARGB(255, 44, 121, 184),
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 111, 183)),
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {
                      if (!globalKey.currentState!.validate()) {
                        return;
                      } else {
                        globalKey.currentState!.save();
                        
                        Navigator.push(
                            context,
                            PageTransition(
                                child: HomePage(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 500),
                                reverseDuration: Duration(milliseconds: 500)));
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
              ]),
            ),
          ),
        ));
  }
}
