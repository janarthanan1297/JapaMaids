import 'dart:async';
import 'package:skeleton_animation/skeleton_animation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:japamaids/layouts/find.dart';
import 'package:page_transition/page_transition.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CategoryModel {
  final name, color, text, mask1, mask2, mask3, mask4;

  CategoryModel({this.name, this.color, this.text, this.mask1, this.mask2, this.mask3, this.mask4});
}

List<CategoryModel> categories = [
  CategoryModel(
    name: " Book a Doula",
    color: Color(0xFF4561FF),
    text: Colors.white,
    mask1: AssetImage("assets/image/Mask1.png"),
    mask2: AssetImage("assets/image/Mask2.png"),
    mask3: AssetImage("assets/image/Mask3.png"),
    mask4: AssetImage("assets/image/Mask4.png"),
  ),
  CategoryModel(
    name: " Consult a\n Gynecologist",
    color: Color(0xFfFFB937),
    text: Color(0xff626A7D),
    mask1: AssetImage("assets/image/Mask5.png"),
    mask2: AssetImage("assets/image/Mask6.png"),
    mask3: AssetImage("assets/image/Mask7.png"),
    mask4: AssetImage("assets/image/Mask8.png"),
  ),
  CategoryModel(
    name: " Expect Approved" + "\n" + " pregnancy",
    color: Color(0xFFF06000),
    text: Colors.white,
    mask1: AssetImage("assets/image/Mask9.png"),
    mask2: AssetImage("assets/image/Mask10.png"),
    mask3: AssetImage("assets/image/Mask11.png"),
    mask4: AssetImage("assets/image/Mask12.png"),
  ),
  CategoryModel(
    name: " Dietary",
    color: Color(0xFFE034D5),
    text: Color(0xff626A7D),
    mask1: AssetImage("assets/image/Mask13.png"),
    mask2: AssetImage("assets/image/Mask14.png"),
    mask3: AssetImage("assets/image/Mask15.png"),
    mask4: AssetImage("assets/image/Mask16.png"),
  ),
  CategoryModel(
    name: " Want to know how" + "\n" + " your future baby\n looks?",
    color: Color(0xFF05D96F),
    text: Colors.white,
    mask1: AssetImage("assets/image/Mask17.png"),
    mask2: AssetImage("assets/image/Mask18.png"),
    mask3: AssetImage("assets/image/Mask19.png"),
    mask4: AssetImage("assets/image/Mask20.png"),
  ),
];

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _searchController = TextEditingController();
  FocusNode searchNode;
  int activetab = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Fluttertoast.showToast(
            msg: 'Welcome to Japamaids!',
            backgroundColor: Color(0xffFFA600),
            textColor: Color(0xffFFFFFF),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM)
        .whenComplete(() {
      // ignore: unused_local_variable
      Timer _everySecond = Timer.periodic(Duration(seconds: 4), (Timer t) {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          height: 775,
          width: MediaQuery.of(context).size.width,
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
                        hintStyle: TextStyle(fontFamily: "Nunito Sans", fontSize: 14, color: Color(0xff6C717E), fontWeight: FontWeight.w400),
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
            Container(
                width: MediaQuery.of(context).size.width,
                child: (isLoading == true)
                    ? Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 35),
                              child: Skeleton(
                                borderRadius: BorderRadius.circular(10),
                                style: SkeletonStyle.text,
                                textColor: Colors.grey[350],
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35),
                              child: Skeleton(
                                borderRadius: BorderRadius.circular(10),
                                style: SkeletonStyle.text,
                                textColor: Colors.grey[350],
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35),
                              child: Skeleton(
                                borderRadius: BorderRadius.circular(10),
                                style: SkeletonStyle.text,
                                textColor: Colors.grey[350],
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35),
                              child: Skeleton(
                                borderRadius: BorderRadius.circular(10),
                                style: SkeletonStyle.text,
                                textColor: Colors.grey[350],
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Skeleton(
                                borderRadius: BorderRadius.circular(10),
                                style: SkeletonStyle.text,
                                textColor: Colors.grey[350],
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ],
                        ),
                      )
                    : AnimationLimiter(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 850),
                                    child: SlideAnimation(
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: FindDoula()));
                                          },
                                          child: Container(
                                            height: 88,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: categories[index].color,
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(left: 90, right: 08),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: categories[index].mask1,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    )),
                                                Padding(
                                                    padding: EdgeInsets.only(left: 155, right: 08),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: categories[index].mask2,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    )),
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Visibility(
                                                    child: Padding(
                                                        padding: EdgeInsets.only(right: 0),
                                                        child: Container(
                                                          alignment: Alignment.centerRight,
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: categories[index].mask3,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Visibility(
                                                    child: Padding(
                                                        padding: EdgeInsets.only(right: 15),
                                                        child: Container(
                                                          alignment: Alignment.centerRight,
                                                          height: 88,
                                                          width: 120,
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: categories[index].mask4,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 19),
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      categories[index].name,
                                                      style: TextStyle(
                                                          fontFamily: "Nunito Sans",
                                                          fontSize: 16,
                                                          color: categories[index].text,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  )
                                ],
                              );
                            }),
                      )),
          ]),
        ),
        Container(
          height: 260,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFF626A7D),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 25, top: 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "In the Spotlight",
                    style: TextStyle(fontFamily: "Nunito Sans", fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 8, left: 25, bottom: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Explore deals, offers and recent features",
                    style: TextStyle(
                        fontFamily: "Nunito Sans", fontSize: 14, color: Colors.white.withOpacity(0.5019607843137255), fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              CarouselSlider(
                  options: CarouselOptions(
                      height: 146,
                      viewportFraction: 0.72,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activetab = index;
                        });
                      }),
                  items: List.generate(
                    3,
                    (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //padding: EdgeInsets.only(right: 40),
                            child: Container(
                              width: 220,
                              height: 128,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (index % 2 == 0) ? Color(0XFFE7EAFF) : Color(0xffFFF0D3),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 14,
                                      left: 20,
                                      child: Text(
                                        "flat",
                                        style: TextStyle(
                                          fontFamily: "Nunito Sans",
                                          fontSize: 12,
                                          color: Color(0xff474747),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      )),
                                  Positioned(
                                      top: 32,
                                      left: 19,
                                      child: Text(
                                        (index % 2 == 0) ? "15% off" : "10% off",
                                        style:
                                            TextStyle(fontFamily: "Nunito Sans", fontSize: 20, color: Color(0xff474747), fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      )),
                                  Positioned(
                                      top: 57,
                                      left: 19,
                                      child: Text(
                                        (index % 2 == 0) ? "on your first doctor\nconsulation" : "On your first doula\nbooking",
                                        style: TextStyle(
                                          fontFamily: "Nunito Sans",
                                          fontSize: 12,
                                          color: Color(0xff474747),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.left,
                                      )),
                                  Positioned(
                                      top: 94,
                                      left: 25,
                                      child: Container(
                                        height: 21,
                                        width: 98,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/image/tag.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            index % 2 == 0 ? "first : fir15" : "first : fir10",
                                            style: TextStyle(
                                              fontFamily: "Nunito Sans",
                                              fontSize: 10,
                                              color: Color(0xff474747),
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      // left: 147,
                                      child: Container(
                                        height: 175,
                                        width: 83,
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey,
                                          image: DecorationImage(
                                              image: NetworkImage((index % 2 == 0)
                                                  ? "https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjI5MTE0MTMx&ixlib=rb-1.2.1&dpr=2&auto=format&fit=crop&w=120&h=200&q=60"
                                                  : "https://nutrexact.com/wp-content/uploads/2020/04/alicia-petresc-c3KZP4azG6g-unsplash-scaled.jpg"),
                                              fit: BoxFit.cover),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
              SizedBox(
                height: 5,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        width: activetab == index ? 11 : 8,
                        height: activetab == index ? 11 : 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: activetab == index ? Color(0xffFFB836) : Color(0xffFFB836).withOpacity(0.5019607843137255)),
                      ),
                    );
                  })),
            ],
          ),
        ),
        Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 25, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Free expert answers to your health questions",
                    style: TextStyle(
                      fontFamily: "Nunito Sans",
                      fontSize: 14,
                      color: Color(0xff474747),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                child: CarouselSlider(
                    options: CarouselOptions(
                        height: 220, viewportFraction: .65, initialPage: 0, enableInfiniteScroll: true, onPageChanged: (index, reason) {}),
                    items: List.generate(
                      5,
                      (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 212,
                              height: 207,
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
                                      top: 17,
                                      left: 19,
                                      child: Container(
                                        height: 25,
                                        width: 23,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage((index % 2 == 0 ? "assets/image/love1.png" : "assets/image/love2.png")),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                      top: 15,
                                      left: 54,
                                      child: Text(
                                        index % 2 == 0 ? "Asked by Mother" : "Asked by Father",
                                        style: TextStyle(
                                          fontFamily: "Nunito Sans",
                                          fontSize: 12,
                                          color: Color(0xff474747),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                  Positioned(
                                      top: 15,
                                      left: 164,
                                      child: Text(
                                        "5m ago",
                                        style: TextStyle(
                                          fontFamily: "Nunito Sans",
                                          fontSize: 10,
                                          color: Color(0xff474747),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                  Positioned(
                                      top: 31,
                                      left: 54,
                                      child: Text(
                                        "32 years Kolkata",
                                        style: TextStyle(
                                          fontFamily: "Nunito Sans",
                                          fontSize: 10,
                                          color: Color(0xff474747),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                  Positioned(
                                      top: 70,
                                      left: 19,
                                      child: Text(
                                        "Question",
                                        style: TextStyle(
                                          fontFamily: "Nunito Sans",
                                          fontSize: 12,
                                          color: Color(0xff474747),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                  Positioned(
                                      top: 93,
                                      left: 19,
                                      child: Text(
                                        index % 2 == 0
                                            ? "Is hair loss normal after a\nmonth of child's birth?"
                                            : "How do I monitor doctor\nappointments with a long\ndistance job?",
                                        style: TextStyle(
                                          fontFamily: "Nunito Sans",
                                          fontSize: 14,
                                          color: Color(0xff474747),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                  Positioned(
                                      top: 163,
                                      child: Container(
                                        height: 44,
                                        width: 212,
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                          color: Color(0xffFFF0D3),
                                        ),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                          Text(
                                            "2 Answers from doctors",
                                            style: TextStyle(
                                              fontFamily: "Nunito Sans",
                                              fontSize: 12,
                                              color: Color(0xff474747),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                "https://images.unsplash.com/photo-1612349316228-5942a9b489c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80",
                                              ),
                                              radius: 11.0,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                "https://images.unsplash.com/photo-1594824476967-48c8b964273f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                                              ),
                                              radius: 11.0,
                                            ),
                                          ),
                                        ]),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
