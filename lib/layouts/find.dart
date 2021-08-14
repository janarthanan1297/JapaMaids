import 'package:flutter/material.dart';
import 'package:japamaids/layouts/doula_list.dart';
import 'package:japamaids/layouts/map.dart';

class FindDoula extends StatefulWidget {
  @override
  _FindDoulaState createState() => _FindDoulaState();
}

class _FindDoulaState extends State<FindDoula> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello nice to meet you !",
                style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "To find japas around",
                style: TextStyle(fontFamily: "Avenir", fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => Maps()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.orangeAccent, borderRadius: BorderRadius.circular(15), boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 01,
                      offset: const Offset(0.0, 5.0),
                    )
                  ]),
                  child: Center(
                    child: Text(
                      "Your current location",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.orangeAccent, width: 3)),
                  child: Center(
                    child: Text(
                      "Search your location",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.orangeAccent),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DoulaList()));
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
