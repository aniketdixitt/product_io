import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NearbyShops extends StatefulWidget {
  const NearbyShops({Key? key}) : super(key: key);

  @override
  _NearbyShopsState createState() => _NearbyShopsState();
}

class _NearbyShopsState extends State<NearbyShops> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Stores & Products around you"),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      body: Container(
        color: Colors.green[50],
        padding: EdgeInsets.all(7),
        child: ListView(children: [
          Column(
            children: [
              Container(
                height: height * 0.3,
                width: width,
                child: InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "Its a Bakery Store",
                        toastLength: Toast.LENGTH_LONG,
                        timeInSecForIosWeb: 3,
                        fontSize: 15);
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage('images/pastry.png'),
                        ),
                        Text(
                          "Name : New Star Bakery",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.green[900]),
                        ),
                        Text(
                          "Bakers & Snacks",
                          style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: Colors.green[900]),
                        )
                      ],
                    ),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                        side:
                            BorderSide(color: Colors.green.shade900, width: 1)),
                    shadowColor: Colors.green[900],
                  ),
                ),
              ),
              Container(
                height: height * 0.3,
                width: width,
                child: InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "Its a General Store",
                        toastLength: Toast.LENGTH_LONG,
                        timeInSecForIosWeb: 3,
                        fontSize: 15);
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage('images/oil.png'),
                        ),
                        Text(
                          "Name : Sahu General Store",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.green[900]),
                        ),
                        Text(
                          "Cooking Oils, Ghee",
                          style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: Colors.green[900]),
                        )
                      ],
                    ),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                        side:
                            BorderSide(color: Colors.green.shade900, width: 1)),
                    shadowColor: Colors.green[900],
                  ),
                ),
              ),
              Container(
                height: height * 0.3,
                width: width,
                child: InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "Its a Meat Store",
                        toastLength: Toast.LENGTH_LONG,
                        timeInSecForIosWeb: 3,
                        fontSize: 15);
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage('images/fish.png'),
                        ),
                        Text(
                          "Name : Shine Meat Store",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.green[900]),
                        ),
                        Text(
                          "Fish, Meat & Chicken",
                          style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: Colors.green[900]),
                        )
                      ],
                    ),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                        side:
                            BorderSide(color: Colors.green.shade900, width: 1)),
                    shadowColor: Colors.green[900],
                  ),
                ),
              ),
              Container(
                height: height * 0.3,
                width: width,
                child: InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "Its a Restaurant",
                        toastLength: Toast.LENGTH_LONG,
                        timeInSecForIosWeb: 3,
                        fontSize: 15);
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage('images/cocktail.png'),
                        ),
                        Text(
                          "Name : Ambrosia",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.green[900]),
                        ),
                        Text(
                          "Restaurant , Drinks",
                          style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: Colors.green[900]),
                        )
                      ],
                    ),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                        side:
                            BorderSide(color: Colors.green.shade900, width: 1)),
                    shadowColor: Colors.green[900],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
