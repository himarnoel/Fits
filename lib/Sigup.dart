import 'package:fits/load.dart';
import 'package:fits/sigin.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  bool load = false;
  String confirmPass = "";
  time() {
    return Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => const MyHomePage(title: "In"))));
      setState(() {
        load = false;
      });
    });
  }

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return load
        ? const Load()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: height / 1.14,
                  width: width,
                  child: Column(children: <Widget>[
                    const Spacer(
                      flex: 2,
                    ),
                    Image.asset("lib/img/logo.png"),
                    SizedBox(
                      height: height / 20,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Input(
                              control: _controller,
                              obscured: false,
                              hintpext: "Name",
                              action: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              valid: (val) {
                                if (val.isEmpty) {
                                  return "Please Enter your name";
                                } else {
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: height / 40,
                          ),
                          Input(
                            control: _controller1,
                            obscured: false,
                            hintpext: "Email Address",
                            action: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            valid: (val) {
                              if (val.isEmpty) {
                                return "Please an Email";
                              } else {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val);
                                if (emailValid) {
                                  return null;
                                } else {
                                  return "Enter a correct email";
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          Input(
                            control: _controller2,
                            obscured: _passwordVisible,
                            hintpext: "Password",
                            action: TextInputAction.next,
                            icon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black)),
                            keyboardType: TextInputType.visiblePassword,
                            valid: (val) {
                              confirmPass = val;
                              if (val.isEmpty) {
                                return "Please Re-Enter New Password";
                              } else if (val.length < 8) {
                                return "Password must be at least 8 characters long";
                              } else if (!RegExp(r"[a-z]").hasMatch(val)) {
                                return "Password must contain at least a small letter";
                              } else if (!RegExp(r"[A-Z]").hasMatch(val)) {
                                return "Password must contain at least a Capital letter";
                              } else if (!RegExp(r"[0-9]").hasMatch(val)) {
                                return "Password must contain at least a number";
                              } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                  .hasMatch(val)) {
                                return "Password must contain atleast a special character";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          Input(
                            control: _controller3,
                            obscured: _passwordVisible,
                            hintpext: "Confirm Password",
                            action: TextInputAction.go,
                            keyboardType: TextInputType.visiblePassword,
                            submit: (val) {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  load = true;
                                });
                                time();
                              }
                            },
                            valid: (val) {
                              if (val.isEmpty) {
                                return "Please Re-Enter New Password";
                              } else if (val.length < 8) {
                                return "Password must be at least 8 characters long";
                              } else if (!RegExp(r"[a-z]").hasMatch(val)) {
                                return "Password must contain at least a small letter";
                              } else if (!RegExp(r"[A-Z]").hasMatch(val)) {
                                return "Password must contain at least a Capital letter";
                              } else if (!RegExp(r"[0-9]").hasMatch(val)) {
                                return "Password must contain atleast a number";
                              } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                  .hasMatch(val)) {
                                return "Password must contain at least a special character";
                              } else if (val != confirmPass) {
                                return "Password do not match";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 26,
                    ),
                    SizedBox(
                      height: height / 15.52,
                      width: width / 5,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              load = true;
                            });
                            time();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF614FE0),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "I have an account",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          );
  }
}
