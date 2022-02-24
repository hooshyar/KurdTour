import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/location.dart';

class LocationDetileView extends StatefulWidget {
  const LocationDetileView({Key? key, required this.loc}) : super(key: key);
  final Location loc;
  @override
  State<LocationDetileView> createState() => _LocationDetileViewState();
}

class _LocationDetileViewState extends State<LocationDetileView> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(36.872664, 42.974988);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Location Detile",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.amber[500],
        ),
        body: Container(
            margin: EdgeInsets.only(left: 10, top: 20),
            height: 620,
            width: 370,
            color: Colors.grey[200],
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/kurdtour.appspot.com/o/05.jpg?alt=media&token=aadc3b1f-d499-4788-afe6-8a201e2e5721',
                      fit: BoxFit.fitWidth,
                      height: 160,
                      width: 350,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 50,
                        width: 220,
                        child: Text(
                          widget.loc.title.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 150,
                          child: Text(widget.loc.rating.toString())),
                    )
                  ],
                ),
                const Text('Discription',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: const Text(
                      'dlfl;dsf,lds,l ,flds,lf;kmldsfmldsfldsl;fkl;sdkfl;skdlfkl;dsfk;ldskfl;dskl;fkl;f',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Opiting hour : ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "11:30 AM - 18:30 PM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Visit Website",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Call",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 350,
                  height: 230,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                    myLocationButtonEnabled: true,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
