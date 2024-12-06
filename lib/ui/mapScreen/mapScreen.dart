import 'dart:async';
import 'dart:math' show cos, sqrt, asin;
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:base_flutter_provider_project/constants/constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

import '../../utils/rich_text.dart';
class GoogleMapPage extends StatefulWidget {
final String? lane;
GoogleMapPage({
  this.lane
});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final locationController = Location();
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  LatLng? _previousPoint;
  LatLng? _selectedLatLng;
  static const googlePlex = LatLng(12.9616, 77.5947);
  List<LatLng> polylineCoordinates = [];
  LatLng? currentPosition = const LatLng(12.9616, 77.5947);
  Map<PolylineId, Polyline> polylines = {};
  dynamic totalDistance;
  List<dynamic> leftLaneData =  [];
  List<dynamic> getleftLaneData =  [];
  List<dynamic> getrightLaneData =  [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await initializeMap());
    _loadMarkers();
  }

  Future<void> initializeMap() async {
    await fetchLocationUpdates();
  }


  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    return true;
  }
  double calculateDistanceMath(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    print('calc math::: ${12742 * asin(sqrt(a))}');
    return 12742 * asin(sqrt(a));
  }

  double calculateDistance(LatLng point1, LatLng point2) {
    return Geolocator.distanceBetween(
      point1.latitude,
      point1.longitude,
      point2.latitude,
      point2.longitude,
    );
  }
  void _loadMarkers() {
    // final box = Hive.box('markers');
    // final markersData = box.values.toList();
    print('late:: ${widget.lane}');
    if(widget.lane == "left"){
      getleftLaneData = box?.get('leftLaneData')??[];
      print('retrived data getleftLaneData length  :: ${getleftLaneData.length}');
      if(getleftLaneData.isNotEmpty){
        _markers.clear();
        setState(() {
          _markers.addAll(
            getleftLaneData.map<Marker>((markerData) {
              return Marker(
                markerId: MarkerId(markerData['id']),
                position: LatLng(markerData['latitude'], markerData['longitude']),
                infoWindow: InfoWindow(
                  title: markerData['title'],
                  snippet: markerData['snippet'],
                ),
              );
            }),
          );


          print('retrived data :: ${_markers.length}');

          // Add polylines to the map by connecting consecutive markers
          if (getleftLaneData.length > 1) {
            for (int i = 0; i < getleftLaneData.length - 1; i++) {
              final start = LatLng(
                getleftLaneData[i]['latitude'],
                getleftLaneData[i]['longitude'],
              );
              final end = LatLng(
                getleftLaneData[i + 1]['latitude'],
                getleftLaneData[i + 1]['longitude'],
              );

              _polylines.add(Polyline(
                polylineId: PolylineId('polyline_$i'),
                points: [start, end],
                color: Colors.blue,
                width: 5,
              ));
            }
          }

          // Set the previous point for future marker additions
          if (getleftLaneData.isNotEmpty) {
            final lastMarkerData = getleftLaneData.last;
            _previousPoint = LatLng(lastMarkerData['latitude'], lastMarkerData['longitude']);
            print('Previous Point Set: $_previousPoint');
          }

          if (_markers.length > 1) {
            final previousMarker = _markers.first;
            // final distance = calculateDistance(previousMarker.position, tappedPoint);
            //  final distance = calculateDistance(LatLng(28.7041, 77.1025), LatLng(19.0760, 72.8777)); // returns CM
            totalDistance = calculateDistanceMath(previousMarker.position.latitude, previousMarker.position.longitude, getleftLaneData.last['latitude'], getleftLaneData.last['longitude']);
            //  var radius = calculateDistanceMath(28.7041, 77.1025, 19.0760, 72.8777); // returns KM
            // print('Distance between markers: $totalDistance meters');
            // print('Previous point: ${previousMarker.position}');
            // print('Tapped point: $tappedPoint');
            // Display the distance on the map or in a list, etc.
          }
        });
      }else{
        print('retrived data getleftLaneData empty :: ${_markers.length}');
      }
    }else{
      getrightLaneData = box?.get('rightLaneData')??[];
      print('retrived data getrightLaneData length  :: ${getrightLaneData.length}');
      if(getrightLaneData.isNotEmpty){
        _markers.clear();
        setState(() {
          _markers.addAll(
            getrightLaneData.map<Marker>((markerData) {
              return Marker(
                markerId: MarkerId(markerData['id']),
                position: LatLng(markerData['latitude'], markerData['longitude']),
                infoWindow: InfoWindow(
                  title: markerData['title'],
                  snippet: markerData['snippet'],
                ),
              );
            }),
          );


          print('retrived data :: ${_markers.length}');

          // Add polylines to the map by connecting consecutive markers
          if (getrightLaneData.length > 1) {
            for (int i = 0; i < getrightLaneData.length - 1; i++) {
              final start = LatLng(
                getrightLaneData[i]['latitude'],
                getrightLaneData[i]['longitude'],
              );
              final end = LatLng(
                getrightLaneData[i + 1]['latitude'],
                getrightLaneData[i + 1]['longitude'],
              );

              _polylines.add(Polyline(
                polylineId: PolylineId('polyline_$i'),
                points: [start, end],
                color: Colors.blue,
                width: 5,
              ));
            }
          }

          // Set the previous point for future marker additions
          if (getrightLaneData.isNotEmpty) {
            final lastMarkerData = getrightLaneData.last;
            _previousPoint = LatLng(lastMarkerData['latitude'], lastMarkerData['longitude']);
            print('Previous Point Set: $_previousPoint');
          }

          if (_markers.length > 1) {
            final previousMarker = _markers.first;
            // final distance = calculateDistance(previousMarker.position, tappedPoint);
            //  final distance = calculateDistance(LatLng(28.7041, 77.1025), LatLng(19.0760, 72.8777)); // returns CM
            totalDistance = calculateDistanceMath(previousMarker.position.latitude, previousMarker.position.longitude, getrightLaneData.last['latitude'], getrightLaneData.last['longitude']);
            //  var radius = calculateDistanceMath(28.7041, 77.1025, 19.0760, 72.8777); // returns KM
            // print('Distance between markers: $totalDistance meters');
            // print('Previous point: ${previousMarker.position}');
            // print('Tapped point: $tappedPoint');
            // Display the distance on the map or in a list, etc.
          }
        });
      }else{
        print('retrived data getrightLaneData empty :: ${_markers.length}');
      }
    }



  }

  void _onMapTap(LatLng tappedPoint) async{
    if (await _handleLocationPermission()) {

      if(widget.lane == "left"){
        final markerData = {
          'id': tappedPoint.toString(),
          'latitude': tappedPoint.latitude,
          'longitude': tappedPoint.longitude,
          'title': 'Tapped Point',
          'snippet': 'Latitude: ${tappedPoint.latitude}, Longitude: ${tappedPoint.longitude}',
        };
        getleftLaneData.add(markerData);
        await box?.put('leftLaneData', getleftLaneData);
        var updatedLeftLaneData = box?.get('leftLaneData');
        print('Updated Left Lane Data: ${updatedLeftLaneData.length}');

        setState(() {
          _markers.add(Marker(
            markerId: MarkerId(tappedPoint.toString()),
            position: tappedPoint,
            infoWindow: InfoWindow(
              title: 'Tapped Point',
              snippet: 'Latitude: ${tappedPoint.latitude}, Longitude: ${tappedPoint.longitude}',
            ),
          ));
          if (_previousPoint != null) {
            _polylines.add(Polyline(
              polylineId: PolylineId('polyline_${_polylines.length}'),
              points: [_previousPoint!, tappedPoint],
              color: Colors.blue,
              width: 5,
            ));

          }
          if (_markers.length > 1) {
            final previousMarker = _markers.first;
            // final distance = calculateDistance(previousMarker.position, tappedPoint);
            //  final distance = calculateDistance(LatLng(28.7041, 77.1025), LatLng(19.0760, 72.8777)); // returns CM
            totalDistance = calculateDistanceMath(previousMarker.position.latitude, previousMarker.position.longitude, tappedPoint.latitude, tappedPoint.longitude);
            //  var radius = calculateDistanceMath(28.7041, 77.1025, 19.0760, 72.8777); // returns KM
            print('Distance between markers: $totalDistance meters');
            print('Previous point: ${previousMarker.position}');
            print('Tapped point: $tappedPoint');
            // Display the distance on the map or in a list, etc.
          }
          _previousPoint = tappedPoint;
        });
      }else{
        final markerData = {
          'id': tappedPoint.toString(),
          'latitude': tappedPoint.latitude,
          'longitude': tappedPoint.longitude,
          'title': 'Tapped Point',
          'snippet': 'Latitude: ${tappedPoint.latitude}, Longitude: ${tappedPoint.longitude}',
        };
        getrightLaneData.add(markerData);
        await box?.put('rightLaneData', getrightLaneData);
        var updatedRightLaneData = box?.get('rightLaneData');
        print('Updated Right Lane Data: ${updatedRightLaneData.length}');

        setState(() {
          _markers.add(Marker(
            markerId: MarkerId(tappedPoint.toString()),
            position: tappedPoint,
            infoWindow: InfoWindow(
              title: 'Tapped Point',
              snippet: 'Latitude: ${tappedPoint.latitude}, Longitude: ${tappedPoint.longitude}',
            ),
          ));
          if (_previousPoint != null) {
            _polylines.add(Polyline(
              polylineId: PolylineId('polyline_${_polylines.length}'),
              points: [_previousPoint!, tappedPoint],
              color: Colors.blue,
              width: 5,
            ));

          }
          if (_markers.length > 1) {
            final previousMarker = _markers.first;
            // final distance = calculateDistance(previousMarker.position, tappedPoint);
            //  final distance = calculateDistance(LatLng(28.7041, 77.1025), LatLng(19.0760, 72.8777)); // returns CM
            totalDistance = calculateDistanceMath(previousMarker.position.latitude, previousMarker.position.longitude, tappedPoint.latitude, tappedPoint.longitude);
            //  var radius = calculateDistanceMath(28.7041, 77.1025, 19.0760, 72.8777); // returns KM
            print('Distance between markers: $totalDistance meters');
            print('Previous point: ${previousMarker.position}');
            print('Tapped point: $tappedPoint');
            // Display the distance on the map or in a list, etc.
          }
          _previousPoint = tappedPoint;
        });
      }




    }else {
      print('Location permission denied');
    }
  }

  void clearAllMarkers() {
    final box = Hive.box('markers');
    box.clear();
    print('All markers cleared');
    setState(() {
      _markers.clear();
      _polylines.clear();
    });
  }


  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(
        children: [
          currentPosition == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: googlePlex,
              zoom: 18,
            ),
            markers: _markers,
            polylines: _polylines,
            onMapCreated: _onMapCreated,
            onTap: _onMapTap,

          ),
          Positioned(
            bottom: 10, // Position the container at the bottom
            right: 0, // Position the container at the right
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    // child: Text(
                    //   'Distance: ${formatToTwoDecimals(totalDistance ?? 0.0)} KM',
                    //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    // ),
                    child: CustomRichText(
                      textSpans: [
                        const TextSpan(
                          text: 'Distance: ',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        TextSpan(
                          text: '${formatToTwoDecimals(totalDistance ?? 0.0)} KM',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                ),
                InkWell(
                  onTap: clearAllMarkers,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Delete Points',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.delete,color: Colors.red,)
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GoogleMapPage(lane: widget.lane == "left"?"Right":"left",)));
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child:  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Mark ${widget.lane == "left"?"Right":"Left"} Lane',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      )
  );

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    LocationData locationData = await locationController.getLocation();
    print('current location :: ${locationData.latitude}, ${locationData.longitude}');
    locationController.onLocationChanged.listen((currentLocation) {
      print('location change');
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
      }
    });
  }

   fetchPolylinePoints() async {   //Future<List<LatLng>>
    final polylinePoints = PolylinePoints();
    print('coordinates in fetch poly ${currentPosition?.latitude ?? 00}, ${currentPosition?.longitude ?? 00}');
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: Constant.googleMapsApiKey,
     request: PolylineRequest(
       origin:  PointLatLng(googlePlex.latitude, googlePlex.longitude),
       destination: PointLatLng(currentPosition?.latitude ?? 9.9310446, currentPosition?.longitude ?? 78.0825197),  // PointLatLng(mountainView.latitude, mountainView.longitude),
       mode: TravelMode.driving,
       wayPoints: [PolylineWayPoint(location: "")
       ],
     )

    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    generatePolyLineFromPoints(polylineCoordinates);
  }

  Future<void> generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() => polylines[id] = polyline);
  }


}

String formatToTwoDecimals(double number) {
  return number.toStringAsFixed(2);
}