import 'package:flutter/material.dart';

class DoulaList extends StatefulWidget {
  final String user;

  DoulaList({this.user});
  @override
  _DoulaListState createState() => _DoulaListState();
}

class _DoulaListState extends State<DoulaList> {
  bool isLocation = true;
  bool isService = true;
  bool isprice = true;
  bool isprediatic = true;

  _onLoactionChanged(bool value) {
    setState(() {
      isLocation = value;
    });
  }

  _onPriceChanged(bool value) {
    setState(() {
      isprice = value;
    });
  }

  _onServiceChanged(bool value) {
    setState(() {
      isService = value;
    });
  }

  _onprediaticChanged(bool value) {
    setState(() {
      isprediatic = value;
    });
  }

  void _filter() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              CheckboxListTile(
                activeColor: Colors.orangeAccent,
                value: isLocation,
                onChanged: _onLoactionChanged,
                title: Text(
                  "Location",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                activeColor: Colors.orangeAccent,
                value: isService,
                onChanged: _onServiceChanged,
                title: Text(
                  "Services",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                activeColor: Colors.orangeAccent,
                value: isprice,
                onChanged: _onPriceChanged,
                title: Text(
                  "Price",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                activeColor: Colors.orangeAccent,
                value: isprediatic,
                onChanged: _onprediaticChanged,
                title: Text(
                  "Pediatic nurse",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 01),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.orangeAccent, width: 3)),
                      child: Center(
                        child: Text(
                          "CANCEL",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.orangeAccent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 01),
                  InkWell(
                    onTap: () {
                      //Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => HomeScreen(notificationAppLaunchDetails)));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 40,
                      decoration: BoxDecoration(color: Colors.orangeAccent, borderRadius: BorderRadius.circular(15), boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: const Offset(0.0, 5.0),
                        )
                      ]),
                      child: Center(
                        child: Text(
                          "APPLY",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 01)
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user),
        centerTitle: true,
        backgroundColor: Color(0xFF626a7d),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          _filter();
        },
        tooltip: 'Welcome to JapaMaids',
        child: Icon(
          Icons.filter_alt,
          color: Color(0xFF626a7d),
          size: 40,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF626a7d),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Doulas Availabele in your area",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "45 doulas",
                          style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 30.0,
                  children: List.generate(10, (index) {
                    return Container(
                      padding: EdgeInsets.all(10),
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
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 130,
                              //width: 150,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                                image: DecorationImage(image: NetworkImage("https://maatriyoga.com/images/resource/japa_maid.jpg"), fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Doula Name',
                              style: TextStyle(fontFamily: "Avenir", fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  '₹ $index' + '000.0',
                                  style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 50,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 05,
                                      ),
                                      Text(
                                        '4.3',
                                        style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 03,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
