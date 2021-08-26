import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:japamaids/animation/page_transition.dart';
import 'package:japamaids/layouts/doula_list.dart';

class Maps extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Maps> {
  _HomepageState({this.username});
  String username;
  GoogleMapController googleMapController;
  BitmapDescriptor icon;
  List<Marker> allMarkers = [];
  MapType _currentMapType = MapType.normal;
  Position position;
  BitmapDescriptor pinLocationIcon;
  Coordinates coords;
  String addressLocation;
  String country;
  String postalCode;
  String user = '';

  changeMapMode() {
    getJsonFile("assets/dark.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    setState(() {
      googleMapController.setMapStyle(mapStyle);
    });
  }

  void _getCurrentLocation() async {
    Position currentPosition = await GeolocatorPlatform.instance.getCurrentPosition();

    setState(() {
      position = currentPosition;
      build(context);
    });
    final coords = new Coordinates(position.latitude, position.longitude);
    var address1 = await Geocoder.local.findAddressesFromCoordinates(coords);
    var firstAddress1 = address1.first;
    user = firstAddress1.addressLine;

    setState(() {
      allMarkers.add(new Marker(
        markerId: MarkerId('1'),
        // width: 45.0,
        //height: 45.0,
        position: new LatLng(position.latitude, position.longitude),
        icon: pinLocationIcon,
      ));
    });
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 5, size: Size(37, 52)),
      'assets/image/marker.png',
    );
  }

  void moveCameraToUserLocation() async {
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          bearing: 40,
          tilt: 90,
          zoom: 19,
        ),
      ),
    );
    circles();
  }

  Set<Circle> circles() {
    return Set.from([
      Circle(
          circleId: CircleId("myCircle"),
          radius: 02,
          center: LatLng(position.latitude ?? 0.0, position.longitude ?? 0.0),
          fillColor: Colors.orangeAccent,
          strokeColor: Colors.orangeAccent,
          onTap: () {
            print('circle pressed');
          }),
      Circle(
          circleId: CircleId("myCircle"),
          radius: 20,
          center: LatLng(position.latitude ?? 0.0, position.longitude ?? 0.0),
          fillColor: Colors.orangeAccent.withOpacity(.5),
          strokeColor: Colors.transparent,
          onTap: () {
            print('circle pressed');
          }),
      Circle(
          circleId: CircleId("myCircle"),
          radius: 50,
          center: LatLng(position.latitude ?? 0.0, position.longitude ?? 0.0),
          fillColor: Colors.grey.withOpacity(.3),
          strokeColor: Colors.transparent,
          onTap: () {
            print('circle pressed');
          })
    ]);
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    setCustomMapPin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height - 50,
                  child: (position == null)
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF626A7D)),
                            ),
                          ),
                        )
                      : GoogleMap(
                          zoomControlsEnabled: false,
                          mapType: MapType.normal,
                          compassEnabled: false,
                          trafficEnabled: false,
                          myLocationEnabled: false,
                          onMapCreated: (GoogleMapController controller) {
                            setState(
                              () {
                                googleMapController = controller;
                                changeMapMode();
                                moveCameraToUserLocation();
                              },
                            );
                          },
                          initialCameraPosition: CameraPosition(
                            target: LatLng(11.759747, 79.765840),
                            zoom: 14.4746,
                            tilt: 90,
                          ),
                          markers: Set<Marker>.of(allMarkers),
                          circles: circles(),
                        ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height - 230,
                  left: MediaQuery.of(context).size.width / 2.5,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(color: Colors.black.withOpacity(.001), borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Booking for",
                          style: TextStyle(
                            fontFamily: "Nunito Sans",
                            fontSize: 16,
                            color: Color(0xff626A7D),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height - 200,
                  left: 15,
                  child: Container(
                    width: 350,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: (user == null) ? Colors.transparent : Colors.black.withOpacity(.001), borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        user,
                        maxLines: 3,
                        style: TextStyle(
                          fontFamily: "Nunito Sans",
                          fontSize: 16,
                          color: Color(0xff626A7D),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ]),

              // Text('User Address : $user',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0)),
              // Text('Crime location: $addressLocation',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0)),
              //Text('PostalCode : $postalCode'),
              //Text('Country : $country',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.0))

              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      children: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(
                                  fontFamily: "Nunito Sans",
                                  fontSize: 16,
                                  color: Color(0xff626A7D),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              textAlign: TextAlign.left,
                            ))
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(CreateRoute(
                                  page: DoulaList(
                                user: user,
                              )));
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  fontFamily: "Nunito Sans",
                                  fontSize: 16,
                                  color: Color(0xff626A7D),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              textAlign: TextAlign.left,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
