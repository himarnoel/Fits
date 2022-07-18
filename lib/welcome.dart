import 'package:fits/sigin.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        const Spacer(),
        Center(child: Image.asset("lib/img/logo.png")),
        const Spacer(),
        SizedBox(
          height: height / 15.52,
          width: width / 1.2,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Signin();
              }));
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF614FE0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              elevation: 0,
            ),
            child: const Text(
              "Log In",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        SizedBox(
          height: height / 45,
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Create New Account",
              style: TextStyle(color: Color(0XFF272728)),
            )),
        const Spacer(
          flex: 3,
        ),
      ]),
    ));
  }
}
