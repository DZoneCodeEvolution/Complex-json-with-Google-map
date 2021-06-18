import 'dart:typed_data';

import 'package:final_test/model/posts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';


class DetailScreen extends StatefulWidget {
   final catelog;
   const DetailScreen({ this.catelog });



  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();

   static var  _initialPosition;
  final Set<Marker> _markers = {};
  static LatLng _lastMapPosition = _initialPosition;




  @override
  void initState() {
    super.initState();
    _getUserLocation();

  }



  void _getUserLocation() async {
    Geolocator.getCurrentPosition().then((currloc) {
      setState(() {

        _initialPosition = LatLng(double.parse(widget.catelog.lat), double.parse(widget.catelog.lon));
      //  _initialPosition = LatLng(currloc.latitude, currloc.longitude);

        // currentLocation = currloc;
      });
    });
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
    });
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }





  @override
  Widget build(BuildContext context) {
    Map<MarkerId, Marker> markers = <MarkerId, Marker>{MarkerId('marker_id_1'):Marker(
      markerId: MarkerId('marker_id_1'),
      position: LatLng(double.parse(widget.catelog.lat), double.parse(widget.catelog.lon)),
      infoWindow: InfoWindow(title: 'marker_id_1', snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },  )};
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text("${widget.catelog.name}")
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          Container(
            height: 500,
            child: GoogleMap(
              mapType: MapType.normal,
              markers:  Set<Marker>.of(markers.values),
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
              ),
              onMapCreated: _onMapCreated,
              zoomGesturesEnabled: true,
              onCameraMove: _onCameraMove,
              myLocationEnabled: true,
              compassEnabled: true,
              tiltGesturesEnabled: true,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
            ),
          ),

               Container(
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Text("Name : ${ widget.catelog.name  }",style: TextStyle(color: Colors.black) ,textScaleFactor: 1.5 ,)),
                      SizedBox(width: 60,),
                      Expanded(child: Text("Icao : ${widget.catelog.icao}",style: TextStyle(color: Colors.black) ,textScaleFactor: 1.5 ,)),

                    ],
                  ),
                ),
              Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("City : ${widget.catelog.city} , State : ${widget.catelog.state}",style: TextStyle(color: Colors.black) ,textScaleFactor: 1.5 ,),
                        Text("Country : ${widget.catelog.country}",style: TextStyle(color: Colors.black) ,textScaleFactor: 1.5 ,),
                        Text("Tz : ${widget.catelog.tz}",style: TextStyle(color: Colors.black) ,textScaleFactor: 1.5 ,),
                      ],
                    ),
                  ),
                )

        ]),
      ),
    );
  }

}
