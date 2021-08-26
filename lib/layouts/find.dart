import 'package:flutter/material.dart';
import 'package:japamaids/animation/page_transition.dart';
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
          icon: Icon(Icons.arrow_back, color: Color(0xff626A7D), size: 16),
          onPressed: () {
            Navigator.pop(
              context,
            );
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
                "Hello, nice to meet you!",
                style: TextStyle(
                    fontFamily: "Nunito Sans", fontSize: 13, color: Color(0xff626A7D).withOpacity(0.5019607843137255), fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                "To find japas around",
                style: TextStyle(
                  fontFamily: "Nunito Sans",
                  fontSize: 22,
                  color: Color(0xff474747),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 71,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, CreateRoute(page: Maps()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 48,
                  decoration: BoxDecoration(color: Color(0xffFFA600), borderRadius: BorderRadius.circular(15), boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 01,
                      offset: const Offset(0.0, 5.0),
                    )
                  ]),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.my_location_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          "Your current location",
                          style: TextStyle(
                            fontFamily: "Nunito Sans",
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
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
                  height: 48,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(0xffFFA600), width: 2)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Color(0xff626A7D),
                          size: 16,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          "Search your location",
                          style: TextStyle(
                            fontFamily: "Nunito Sans",
                            fontSize: 14,
                            color: Color(0xff626A7D),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
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
                        fontFamily: "Nunito Sans",
                        fontSize: 14,
                        color: Color(0xff626A7D),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.left,
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
