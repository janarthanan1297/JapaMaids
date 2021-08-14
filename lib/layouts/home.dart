import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:japamaids/layouts/doula_list.dart';
import 'package:japamaids/layouts/find.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CategoryModel {
  final name, color, text;

  CategoryModel({this.name, this.color, this.text});
}

List<CategoryModel> categories = [
  CategoryModel(name: " Book a doula service", color: Colors.blueAccent, text: Colors.white),
  CategoryModel(name: " Consult a Gynecologist", color: Colors.yellow[800], text: Colors.grey[700]),
  CategoryModel(name: " Expect approved" + "\n" + " pregnancy", color: Colors.orange[800], text: Colors.white),
  CategoryModel(name: " Dietry Regulations", color: Colors.purpleAccent, text: Colors.grey[700]),
  CategoryModel(name: " Want to know how" + "\n" + " your future baby looks?", color: Colors.green[400], text: Colors.white),
];

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _searchController = TextEditingController();
  FocusNode searchNode;
  int activetab = 0;
  @override
  void initState() {
    super.initState();
    Fluttertoast.showToast(msg: 'Welcome to Japamaids!', toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 900,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: 46,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.16),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Center(
                      child: TextFormField(
                        controller: _searchController,
                        focusNode: searchNode,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          hintText: "Search JapaMaids",
                          hintStyle: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.black45, fontWeight: FontWeight.bold),
                          suffixIconConstraints: BoxConstraints(
                            minHeight: 19,
                            minWidth: 19,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => FindDoula()));
                                },
                                child: Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: categories[index].color,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 200),
                                            decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                gradient: new LinearGradient(
                                                    colors: [
                                                      Colors.white.withOpacity(.5),
                                                      Colors.white.withOpacity(.0),
                                                    ],
                                                    stops: [
                                                      0.0,
                                                      1.0
                                                    ],
                                                    begin: FractionalOffset.centerLeft,
                                                    end: FractionalOffset.centerRight,
                                                    tileMode: TileMode.repeated)),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              categories[index].name,
                                              style: TextStyle(
                                                  fontFamily: "Avenir", fontSize: 20, color: categories[index].text, fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          );
                        })),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            height: 350,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF626a7d),
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "In the Spotlight",
                      style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Explore deals, offers and recent features",
                      style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                            options: CarouselOptions(
                                viewportFraction: 2,
                                enableInfiniteScroll: false,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activetab = index;
                                  });
                                }),
                            items: List.generate(
                              3,
                              (index) {
                                return Container(
                                  width: 370,
                                  height: 128,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0XFFe7eaff),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 20,
                                          left: 26,
                                          child: Text(
                                            "flat",
                                            style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                                          )),
                                      Positioned(
                                          top: 45,
                                          left: 25,
                                          child: Text(
                                            "15% off",
                                            style: TextStyle(fontFamily: "Avenir", fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
                                          )),
                                      Positioned(
                                          top: 75,
                                          left: 25,
                                          child: Text(
                                            "on your first doctor \n consulation",
                                            style: TextStyle(
                                              fontFamily: "Avenir",
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          )),
                                      Positioned(
                                          top: 135,
                                          left: 25,
                                          child: Container(
                                            height: 30,
                                            width: 150,
                                            color: Colors.amber,
                                            child: Center(
                                              child: Text("first : fir15"),
                                            ),
                                          )),
                                      Positioned(
                                          left: 220,
                                          child: Container(
                                            height: 200,
                                            width: 150,
                                            decoration: new BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey,
                                              image: DecorationImage(
                                                  image: NetworkImage("https://vidmed.co.in/wp-content/uploads/2020/08/doctor-14044.png"),
                                                  fit: BoxFit.fill),
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              },
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          width: activetab == index ? 10 : 8,
                          height: activetab == index ? 10 : 8,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, color: activetab == index ? Colors.orange : Colors.orange.withOpacity(0.2)),
                        ),
                      );
                    })),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Free expert answers to your health questions",
                      style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                            options:
                                CarouselOptions(viewportFraction: .75, initialPage: 0, enableInfiniteScroll: true, onPageChanged: (index, reason) {}),
                            items: List.generate(
                              3,
                              (index) {
                                return Container(
                                  width: 250,
                                  height: 128,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.16),
                                        offset: Offset(0, 3),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 20,
                                          left: 45,
                                          child: Text(
                                            "Asked by Mother",
                                            style: TextStyle(fontFamily: "Avenir", fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
                                          )),
                                      Positioned(
                                          top: 20,
                                          left: 190,
                                          child: Text(
                                            "5m ago",
                                            style: TextStyle(
                                              fontFamily: "Avenir",
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                          )),
                                      Positioned(
                                          top: 40,
                                          left: 50,
                                          child: Text(
                                            "32 years Kolkata",
                                            style: TextStyle(
                                              fontFamily: "Avenir",
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                          )),
                                      Positioned(
                                          top: 80,
                                          left: 25,
                                          child: Text(
                                            "Question",
                                            style: TextStyle(fontFamily: "Avenir", fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                          )),
                                      Positioned(
                                          top: 110,
                                          left: 25,
                                          child: Text(
                                            "Is hair loss normal after a\nmonth of child birth ?",
                                            style: TextStyle(
                                              fontFamily: "Avenir",
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          )),
                                      Positioned(
                                          top: 198,
                                          child: Container(
                                            height: 40,
                                            width: 250,
                                            decoration: new BoxDecoration(
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                              color: Colors.amber,
                                            ),
                                            child: Center(
                                              child: Text("2 Answers from doctors"),
                                            ),
                                          )),
                                    ],
                                  ),
                                );
                              },
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: null,
        tooltip: 'Welcome to JapaMaids',
        child: Icon(
          Icons.home,
          color: Colors.blue,
          size: 40,
        ),
      ),
    );
  }
}
