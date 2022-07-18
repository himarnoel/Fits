import 'dart:async';
import 'package:fits/Sigup.dart';
import 'package:fits/load.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _passwordVisible = true;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  bool load = false;
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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return load
        ? const Load()
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: height / 1.04,
                  width: width,
                  child: Column(children: <Widget>[
                    const Spacer(
                      flex: 2,
                    ),
                    Image.asset("lib/img/logo.png"),
                    SizedBox(
                      height: height / 25,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Input(
                            control: _controller,
                            obscured: false,
                            action: TextInputAction.next,
                            hintpext: "Email Address",
                            valid: (val) {
                              if (val.isEmpty) {
                                return "Please an Email";
                              } else {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val);
                                if (emailValid == true) {
                                  return null;
                                } else {
                                  return "Enter a correct email";
                                }
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          Input(
                            control: _controller1,
                            obscured: _passwordVisible,
                            hintpext: "Password",
                            action: TextInputAction.go,
                            submit: (val) {
                              if (_formkey.currentState!.validate()) {
                                _controller.clear();
                                _controller1.clear();
                                setState(() {
                                  load = true;
                                });
                                time();
                              }
                            },
                            valid: (val) {
                              if (val.isEmpty) {
                                return "Please Enter your Password";
                              } else if (val.length < 8) {
                                return "Password must be atleast 8 characters long";
                              } else {
                                return null;
                              }
                            },
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
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      widthFactor: 2.2,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgotten Password",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF614FE0),
                                fontWeight: FontWeight.w200),
                          )),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    SizedBox(
                      height: height / 15.52,
                      width: width / 5,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _controller.clear();
                            _controller1.clear();
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
                          "Log In",
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
                          "New here?",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Signup();
                              }));
                            },
                            child: const Text(
                              "Sign Up",
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

class Input extends StatelessWidget {
  final bool obscured;
  final String hintpext;
  final keyboardType, valid, control, action, submit;
  final icon, press;

  Input(
      {required this.obscured,
      required this.hintpext,
      this.submit,
      this.press,
      this.action,
      this.keyboardType,
      this.icon,
      this.valid,
      this.control});
  @override
  Widget build(BuildContext context) {
    double text = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextFormField(
        onFieldSubmitted: submit,
        controller: control,
        validator: valid,
        decoration: InputDecoration(
            fillColor: const Color(0xFFF3F3F3),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: hintpext,
            suffixIcon: icon),
        style: TextStyle(fontSize: text * 13, fontWeight: FontWeight.bold),
        keyboardType: keyboardType,
        textInputAction: action,
        obscureText: obscured,
      ),
    );
  }
}
