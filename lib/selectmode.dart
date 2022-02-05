import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'routing.dart' as routing;

class Selectmode extends StatefulWidget {
  const Selectmode({Key? key}) : super(key: key);

  @override
  _SelectmodeState createState() => _SelectmodeState();
}

class _SelectmodeState extends State<Selectmode> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          "PRODUCT IO",
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green[50],
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Hello there!",
              style: TextStyle(
                  fontSize: width * 0.075, fontWeight: FontWeight.w800),
            ),
            Text(
              "Are you a .. ?",
              style: TextStyle(
                  fontSize: width * 0.07, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: height * 0.25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('images/customer.png'),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextButton(
                        child: Text("Customer",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w800,
                                color: Colors.red[900])),
                        onPressed: () async {
                          final docu = ModalRoute.of(context)!
                              .settings
                              .arguments as String;
                          await FirebaseFirestore.instance
                              .collection("Users")
                              .doc(docu)
                              .update({'Type': "Customer"});
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            routing.customerPage,
                            (route) => false,
                          );
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('images/female.png'),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextButton(
                        //"Shopkeeper",
                        child: Text("Shopkeeper",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w800,
                                color: Colors.green[900])),
                        onPressed: () async {
                          final docu = ModalRoute.of(context)!
                              .settings
                              .arguments as String;
                          await FirebaseFirestore.instance
                              .collection("Users")
                              .doc(docu)
                              .update({'Type': "Shopkeeper"});
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            routing.shopkeeper,
                            (route) => false,
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            Flexible(
              child: Container(
                height: double.maxFinite,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "The text written is clickable!",
                      style: TextStyle(fontSize: width * 0.03),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
