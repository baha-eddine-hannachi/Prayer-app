
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayer_app/home.dart' show Home;

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  double latitude = 0.0;
  double longitude = 0.0;
  String currentcity = "";
  navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(
          city: currentcity,
          culongitude: longitude,
          culatitude: latitude,
        ),
      ),
    );
  }

  showAlert(alert) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Icons.location_on),
        content: Text("$alert"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return showAlert("please anable location services");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return showAlert("please give location permission");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return showAlert(
        "Location permissions are permanently denied, we cannot request permissions.",
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    latitude = position.latitude;
    longitude = position.longitude;
    //get x y which any city
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    currentcity = placemarks[0].locality!;
    navigateToHome();
  }

  void initState() {
    determinePosition();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal, Colors.cyan],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mosque, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              "Pray App",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
