import 'package:flutter/material.dart';

class DoulaList extends StatefulWidget {
  final String user;

  DoulaList({this.user});
  @override
  _DoulaListState createState() => _DoulaListState();
}

class DoulaModel {
  final name, mask1;

  DoulaModel({
    this.name,
    this.mask1,
  });
}

List<DoulaModel> doulas = [
  DoulaModel(
    name: "₹ 7000",
    mask1: AssetImage("assets/maid1.png"),
  ),
  DoulaModel(
    name: "₹ 8000",
    mask1: AssetImage("assets/maid2.png"),
  ),
  DoulaModel(
    name: "₹ 6000",
    mask1: AssetImage("assets/maid3.png"),
  ),
  DoulaModel(
    name: "₹ 5000",
    mask1: AssetImage("assets/maid4.png"),
  ),
  DoulaModel(
    name: "₹ 7000",
    mask1: AssetImage("assets/maid1.png"),
  ),
  DoulaModel(
    name: "₹ 8000",
    mask1: AssetImage("assets/maid2.png"),
  ),
  DoulaModel(
    name: "₹ 6000",
    mask1: AssetImage("assets/maid3.png"),
  ),
  DoulaModel(
    name: "₹ 5000",
    mask1: AssetImage("assets/maid4.png"),
  ),
  DoulaModel(
    name: "₹ 7000",
    mask1: AssetImage("assets/maid1.png"),
  ),
  DoulaModel(
    name: "₹ 8000",
    mask1: AssetImage("assets/maid2.png"),
  ),
];

class _DoulaListState extends State<DoulaList> {
  TextEditingController location = TextEditingController();
  bool isLocation = false;
  bool isService = false;
  bool isprice = false;
  bool isprediatic = false;

  Future<void> _filter() {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 25),
                      child: Text(
                        "Filter By",
                        style: TextStyle(
                          fontFamily: "Nunito Sans",
                          fontSize: 16,
                          color: Color(0xff626A7D),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        activeColor: Colors.orangeAccent,
                        value: isLocation,
                        onChanged: (bool value) {
                          state(() {
                            isLocation = value;
                          });
                        },
                        title: Text(
                          "Location",
                          style: TextStyle(
                            fontFamily: "Nunito Sans",
                            fontSize: 13,
                            color: Color(0xff515C6F),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "chennai",
                        style: TextStyle(
                          fontFamily: "Nunito Sans",
                          fontSize: 13,
                          color: Color(0xFF1B2B47).withOpacity(.4),
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xff727C8E).withOpacity(.2),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5, right: 20),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios),
                                  iconSize: 10,
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
                              ),
                            )))
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        activeColor: Colors.orangeAccent,
                        value: isService,
                        onChanged: (bool value) {
                          state(() {
                            isService = value;
                          });
                        },
                        title: Text(
                          "Services",
                          style: TextStyle(
                            fontFamily: "Nunito Sans",
                            fontSize: 13,
                            color: Color(0xff515C6F),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "Japa, Cleaning",
                        style: TextStyle(
                          fontFamily: "Nunito Sans",
                          fontSize: 13,
                          color: Color(0xFF1B2B47).withOpacity(.4),
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xff727C8E).withOpacity(.2),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5, right: 20),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios),
                                  iconSize: 10,
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
                              ),
                            )))
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        activeColor: Colors.orangeAccent,
                        value: isprice,
                        onChanged: (bool value) {
                          state(() {
                            isprice = value;
                          });
                        },
                        title: Text(
                          "Price",
                          style: TextStyle(
                            fontFamily: "Nunito Sans",
                            fontSize: 13,
                            color: Color(0xff515C6F),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "6000-10000",
                        style: TextStyle(
                          fontFamily: "Nunito Sans",
                          fontSize: 13,
                          color: Color(0xFF1B2B47).withOpacity(.4),
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xff727C8E).withOpacity(.2),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5, right: 20),
                                child: IconButton(icon: Icon(Icons.arrow_forward_ios), iconSize: 10, color: Colors.black, onPressed: () {}),
                              ),
                            )))
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        activeColor: Colors.orangeAccent,
                        value: isprediatic,
                        onChanged: (bool value) {
                          state(() {
                            isprediatic = value;
                          });
                        },
                        title: Text(
                          "Pediatic nurse",
                          style: TextStyle(
                            fontFamily: "Nunito Sans",
                            fontSize: 13,
                            color: Color(0xff515C6F),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
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
                        width: 149,
                        height: 37,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(0xffFFA600), width: 2)),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontFamily: "Nunito Sans",
                              fontSize: 12,
                              color: Color(0xffFFA600),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 01),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 149,
                        height: 37,
                        decoration: BoxDecoration(color: Color(0xffFFA600), borderRadius: BorderRadius.circular(15), boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: const Offset(0.0, 5.0),
                          )
                        ]),
                        child: Center(
                          child: Text(
                            "Apply Filters",
                            style: TextStyle(
                              fontFamily: "Nunito Sans",
                              fontSize: 12,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF626A7D),
              padding: EdgeInsets.only(top: 35, left: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          right: 10,
                        ),
                        child: Icon(
                          Icons.location_on,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.user,
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: "Nunito Sans",
                            fontSize: 14,
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    indent: 50,
                    endIndent: 12,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF626A7D),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 5, bottom: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Doulas Availabele in your area\n45 doulas",
                          style: TextStyle(
                            fontFamily: "Nunito Sans",
                            fontSize: 16,
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.73,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 31.0,
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
                              height: 117,
                              width: 123,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                  image: DecorationImage(image: doulas[index].mask1, fit: BoxFit.cover)),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Doula Name',
                              style: TextStyle(
                                fontFamily: "Nunito Sans",
                                fontSize: 12,
                                color: Color(0xff515C6F),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  doulas[index].name,
                                  style: TextStyle(
                                    fontFamily: "Nunito Sans",
                                    fontSize: 9,
                                    color: Color(0xff515C6F),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 33,
                                  height: 16,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffFFA600),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 05,
                                      ),
                                      Text(
                                        '4.9',
                                        style: TextStyle(
                                          fontFamily: "Nunito Sans",
                                          fontSize: 7,
                                          color: Color(0xffffffff),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 03,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 9,
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
      bottomNavigationBar: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 0.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      _filter();
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.filter_list,
                            color: Color(0xff626A7D),
                          ),
                          SizedBox(
                            width: 05,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                              fontFamily: "Nunito Sans",
                              fontSize: 13,
                              color: Color(0xff515C6F),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ))),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Center(
                      child: Text(
                        "Experience",
                        style: TextStyle(
                          fontFamily: "Nunito Sans",
                          fontSize: 13,
                          color: Color(0xff515C6F),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
