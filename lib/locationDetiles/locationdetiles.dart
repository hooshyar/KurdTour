import 'package:KurdTour/home_main/home_screen_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../data/location.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationDetileView extends StatefulWidget {
  const LocationDetileView({Key? key, required this.loc}) : super(key: key);
  final Location loc;
  @override
  State<LocationDetileView> createState() => _LocationDetileViewState();
}

class _LocationDetileViewState extends State<LocationDetileView> {
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    final marker = Marker(
      markerId: MarkerId(widget.loc.title.toString()),
      position:
          LatLng(widget.loc.loca!.toDouble(), widget.loc.locl!.toDouble()),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: widget.loc.title,
      ),
    );
    setState(() {
      markers[MarkerId(widget.loc.title.toString())] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeMainScreen()));
            },
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Location Detail",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.amber[500],
        ),
        body: Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            height: 655,
            width: 370,
            color: Colors.grey[200],
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.loc.image.toString(),
                      fit: BoxFit.cover,
                      height: 180,
                      width: 350,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
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
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: RatingBarIndicator(
                        rating: widget.loc.rating!.toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 26,
                        direction: Axis.horizontal,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: const Text('Description',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  width: 330,
                  height: 65,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(widget.loc.description.toString(),
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Opiting hour : ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.loc.openhourse.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: const Text(
                        "Visit Website",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => {launch(widget.loc.website!)},
                    ),
                    InkWell(
                      child: const Text(
                        "Call",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () =>
                          {launch('tel:' + widget.loc.phone.toString())},
                    ),
                    InkWell(
                      child: const Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => {launch('mailto:' + widget.loc.email!)},
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 350,
                  height: 235,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(widget.loc.loca!.toDouble(),
                          widget.loc.locl!.toDouble()),
                      zoom: 16.0,
                    ),
                    markers: markers.values.toSet(),
                    myLocationButtonEnabled: true,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
