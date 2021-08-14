import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:japamaids/layouts/doula_list.dart';

class Maps extends StatefulWidget {
  Maps({this.username});
  final String username;
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Maps> {
  _HomepageState({this.username});
  String username;
  GoogleMapController googleMapController;
  BitmapDescriptor icon;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MapType _currentMapType = MapType.normal;
  Position position;
  String addressLocation;
  String country;
  String postalCode;
  String user;

  _onMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  void _getCurrentLocation() async {
    Position currentPosition = await GeolocatorPlatform.instance.getCurrentPosition();

    setState(() {
      position = currentPosition;
      build(context);
    });
    final coord = new Coordinates(position.latitude, position.longitude);
    var address1 = await Geocoder.local.findAddressesFromCoordinates(coord);
    var firstAddress1 = address1.first;
    user = firstAddress1.addressLine;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _onMapType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 60,
                child: GoogleMap(
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,

                    //compassEnabled: true,
                    trafficEnabled: false,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      setState(
                        () {
                          googleMapController = controller;
                        },
                      );
                    },
                    initialCameraPosition: CameraPosition(target: LatLng(11.75954897, 79.76633952), zoom: 13.0),
                    markers: Set<Marker>.of(markers.values)),
              ),

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
                                fontFamily: "Avenir",
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DoulaList(
                                            user: user,
                                          )));
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontFamily: "Avenir",
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
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
