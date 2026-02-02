GitHub README for Flutter Prayer Times App
🕌 Prayer Times App - Flutter Mobile Application
📱 Project Overview
A beautiful, location-aware Flutter mobile application that displays accurate Islamic prayer times based on the user's current geographical location. The app automatically detects the user's city and shows prayer timings according to the Islamic (Hijri) calendar.

✨ Features
📍 Automatic Location Detection - Uses device GPS to determine user location

🕋 Accurate Prayer Times - Fetches precise prayer timings from Aladhan API

📅 Dual Calendar Display - Shows both Gregorian and Hijri dates

🎨 Beautiful UI - Clean, responsive design with gradient backgrounds

🔄 Real-time Updates - Live clock showing current time

📱 Cross-platform - Works on both iOS and Android

🔒 Permission Handling - Proper handling of location permissions

🛠️ Technology Stack
Flutter - UI framework

Dart - Programming language

Geolocator - Location services

Geocoding - Reverse geocoding for city names

HTTP - API requests

Aladhan API - Islamic prayer times API

📁 Project Structure
text
prayer_app/
├── main.dart          # App entry point
├── location.dart      # Location permission & detection screen
├── home.dart          # Main prayer times display screen
└── images/
    └── bg1.png       # Background image
🚀 Getting Started
Prerequisites
Flutter SDK (latest version)

Android Studio / VS Code with Flutter extension

iOS simulator or Android emulator (for testing)

Installation
Clone the repository

bash
git clone <repository-url>
cd prayer_app
Install dependencies

bash
flutter pub get
Add required permissions (Android)
Add to android/app/src/main/AndroidManifest.xml:

xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
For iOS, add to ios/Runner/Info.plist:

xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location to show prayer times for your city</string>
Run the app

bash
flutter run
📖 Code Explanation
Main Components
1. main.dart - Application Entry Point
dart
// Sets app orientation to portrait only
SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
]);
2. location.dart - Location Handler
Requests location permissions

Gets current coordinates using Geolocator

Converts coordinates to city name using Geocoding

Navigates to Home screen with location data

3. home.dart - Main Display Screen
Fetches prayer times from Aladhan API

Displays 6 prayer times: Fajr, Sunrise, Dhuhr, Asr, Maghrib, Isha

Shows current time with live updates

Displays both Gregorian and Hijri dates

🔧 API Integration
The app uses the Aladhan API to fetch prayer times:

text
API Endpoint: http://api.aladhan.com/v1/timings/{date}
Parameters: latitude, longitude, method=18
Example API call:

dart
var url = Uri.parse(
  "http://api.aladhan.com/v1/timings/$today?latitude=$latitude&longitude=$longitude&method=18"
);
🎯 Key Functions
Location Detection (location.dart)
dart
Position position = await Geolocator.getCurrentPosition();
latitude = position.latitude;
longitude = position.longitude;
List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
currentcity = placemarks[0].locality!;
Prayer Times Fetching (home.dart)
dart
FutureBuilder(
  future: get(url),
  builder: (context, snapshot) {
    // Handles API response
    if (snapshot.hasData && snapshot.data!.statusCode == 200) {
      var jsondata = jsonDecode(snapshot.data!.body);
      // Process prayer times...
    }
  }
)
Real-time Clock
dart
Timer.periodic(Duration(seconds: 1), (timer) {
  setState(() {
    timenow(); // Updates time every second
  });
});
📱 Screens
1. Location Screen
Shows loading animation

Requests location permission

Displays mosque icon and app title

Automatically navigates to Home after getting location

2. Home Screen
Current time display (updates every second)

City name

Gregorian and Hijri dates

Prayer times list with icons

Beautiful gradient background

⚙️ Configuration
Prayer Calculation Method
The app uses method 18 (Umm al-Qura University, Makkah). You can change this by modifying the API URL parameter.

Supported Prayers
Fajr (Dawn)

Sunrise

Dhuhr (Noon)

Asr (Afternoon)

Maghrib (Sunset)

Isha (Night)

🐛 Common Issues & Solutions
1. Location Permission Denied
Ensure location services are enabled on device

Check app permissions in device settings

For iOS: Add proper permission descriptions in Info.plist

2. API Not Responding
Check internet connection

Verify API endpoint is accessible

Handle API errors in FutureBuilder

3. City Name Not Found
The app uses reverse geocoding which might fail in remote areas

Consider adding a manual city selection fallback

🚀 Future Enhancements
Add manual city selection

Implement notifications for prayer times

Add Qibla direction finder

Support multiple calculation methods

Dark/Light mode toggle

Offline caching of prayer times

Monthly prayer timetable view

📝 Dependencies
Add these to your pubspec.yaml:

yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
  geolocator: ^10.0.0
  geocoding: ^2.1.0
🤝 Contributing
Fork the repository

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

🙏 Acknowledgments
Aladhan API for prayer times data

Flutter for the amazing framework

Geolocator and Geocoding packages

📧 Contact
For questions or feedback, please open an issue on the GitHub repository.
