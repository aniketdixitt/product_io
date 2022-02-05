import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Shops extends StatefulWidget {
  const Shops({Key? key}) : super(key: key);
  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  String shopname = "";
  _showDialog(BuildContext context, String type) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: Text('Enter Store Name'),
            content: TextField(
              onChanged: (value) {
                shopname = value;
              },
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection("Shops")
                        .doc(shopname)
                        .set({'Name': shopname, 'Type': type});
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "Shop added successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 3,
                        fontSize: 16.0);
                  },
                  child: Text("Done")),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Your Store"),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      body: Container(
        color: Colors.green[50],
        padding: EdgeInsets.all(5),
        child: ListView(children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.3,
                    width: width * 0.5,
                    child: InkWell(
                      onTap: () {
                        _showDialog(context, "Cooking Oils & Ghee");
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage('images/oil.png'),
                            ),
                            Text(
                              "Cooking Oils & Ghee",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green[900]),
                            )
                          ],
                        ),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                            side: BorderSide(
                                color: Colors.green.shade900, width: 1)),
                        shadowColor: Colors.green[900],
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.3,
                    width: width * 0.5,
                    child: InkWell(
                      onTap: () {
                        _showDialog(context, "Dairy and Milk");
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage('images/dairy-products.png'),
                            ),
                            Text(
                              "Dairy and Milk",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green[900]),
                            )
                          ],
                        ),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                            side: BorderSide(
                                color: Colors.green.shade900, width: 1)),
                        shadowColor: Colors.green[900],
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.3,
                    width: width * 0.5,
                    child: InkWell(
                      onTap: () {
                        _showDialog(context, "Fish and Meat");
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image(
                                  image: AssetImage('images/fish.png'),
                                ),
                              ],
                            ),
                            Text(
                              "Fish and Meat",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green[900]),
                            )
                          ],
                        ),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                            side: BorderSide(
                                color: Colors.green.shade900, width: 1)),
                        shadowColor: Colors.green[900],
                      ),
                    ),
                  )
                ],
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.3,
                      width: width * 0.5,
                      child: InkWell(
                        onTap: () {
                          _showDialog(context, "Beverages");
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage('images/cocktail.png'),
                              ),
                              Text(
                                "Beverages",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green[900]),
                              )
                            ],
                          ),
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                              side: BorderSide(
                                  color: Colors.green.shade900, width: 1)),
                          shadowColor: Colors.green[900],
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.3,
                      width: width * 0.5,
                      child: InkWell(
                        onTap: () {
                          _showDialog(context, "Fruits and Vegetables");
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(
                                    'images/fruits-and-vegetables.png'),
                              ),
                              Text(
                                "Fruits and Vegetables",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green[900]),
                              )
                            ],
                          ),
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                              side: BorderSide(
                                  color: Colors.green.shade900, width: 1)),
                          shadowColor: Colors.green[900],
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.3,
                      width: width * 0.5,
                      child: InkWell(
                        onTap: () {
                          _showDialog(context, "Pastry");
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage('images/pastry.png'),
                              ),
                              Text(
                                "Pastry",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green[900]),
                              )
                            ],
                          ),
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                              side: BorderSide(
                                  color: Colors.green.shade900, width: 1)),
                          shadowColor: Colors.green[900],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
