# 🕌 Prayer Times App - Flutter Mobile Application

## 📱 Project Overview
A beautiful, location-aware Flutter mobile application that displays accurate Islamic prayer times based on the user's current geographical location.

## ✨ Features
- 📍 **Automatic Location Detection** - Uses device GPS to determine user location
- 🕋 **Accurate Prayer Times** - Fetches precise prayer timings from Aladhan API
- 📅 **Dual Calendar Display** - Shows both Gregorian and Hijri dates
- 🎨 **Beautiful UI** - Clean, responsive design with gradient backgrounds
- 🔄 **Real-time Updates** - Live clock showing current time
- 📱 **Cross-platform** - Works on both iOS and Android
- 🔒 **Permission Handling** - Proper handling of location permissions

## 🛠️ Technology Stack
- **Flutter** - UI framework
- **Dart** - Programming language
- **Geolocator** - Location services
- **Geocoding** - Reverse geocoding for city names
- **HTTP** - API requests
- **Aladhan API** - Islamic prayer times API

## 📁 Project Structure
prayer_app/
├── main.dart # App entry point
├── location.dart # Location permission & detection screen
├── home.dart # Main prayer times display screen
└── images/
└── bg1.png # Background image

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest version)
- Android Studio / VS Code with Flutter extension

### Installation
1. Clone the repository
```bash
git clone <repository-url>
cd prayer_app
Install dependencies

bash
flutter pub get
Run the app

bash
flutter run
🔧 API Integration
The app uses the Aladhan API to fetch prayer times:
API Endpoint: http://api.aladhan.com/v1/timings/{date}
Parameters: latitude, longitude, method=18
📱 Screens
1. Location Screen
Shows loading animation

Requests location permission

Displays mosque icon and app title

2. Home Screen
Current time display (updates every second)

City name

Gregorian and Hijri dates

Prayer times list
🤝 Contributing
Fork the repository

Create your feature branch

Commit your changes

Push to the branch

Open a Pull Request
📄 License
This project is licensed under the MIT License.

## **Method 4: Download as file**
If you're using a desktop browser, you can:
1. **Right-click** on the page
2. Select **"Save As"** or **"Save Page As"**
3. Choose **"Web Page, HTML Only"** format
4. Save as `README.html`

## **Quick Tips:**
- For GitHub, use **Method 3** (Markdown version)
- For a beautiful offline view, use **Method 2** or **4** (HTML version)
- The HTML version includes styling and looks more professional
- The Markdown version is what GitHub displays

**Which method do you prefer?** I can help you with the specific method you choose!
