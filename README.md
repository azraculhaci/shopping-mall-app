# 🛍️ AVMNEREDE - Shopping Mall Discovery App

<div align="center">

![Logo](frontend/assets/center_logo.png)

*Discover, explore, and plan your perfect shopping experience*

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Node.js](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white)](https://nodejs.org)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)](https://postgresql.org)
[![Express.js](https://img.shields.io/badge/Express.js-404D59?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com)

</div>

## 🌟 Features

### 🗺️ **Interactive Mall Map**
- **Real-time location tracking** with GPS integration
- **Interactive Google Maps** showing all shopping malls in your area
- **Detailed mall information** with addresses and contact details
- **Distance calculation** from your current location

### 🎮 **Lucky Pick Mini-Game**
- **Interactive selection game** to help you decide where to go
- **Category-based recommendations** (Cinema, Sports, Food, Shopping, etc.)
- **Location-aware suggestions** based on your city and district
- **Fun and engaging UI** with animations and smooth transitions

### 🌤️ **Weather Integration & Planning**
- **Real-time weather data** from OpenWeatherMap API
- **5-day weather forecast** to help plan your visits
- **Weather-based animations** with beautiful Lottie animations
- **Smart planning tools** integrated with weather conditions

### 📝 **Personal Shopping Planner**
- **Note-taking system** using Hive local database
- **Bullet point mode** for organized planning
- **Persistent storage** - your notes are saved locally
- **Day-specific planning** tools

### ⭐ **Reviews & Ratings System**
- **Community-driven reviews** for each shopping mall
- **Star rating system** (1-5 stars)
- **Comment filtering and sorting** (newest, oldest, highest rated)
- **Real-time rating calculations**

### 🔍 **Advanced Search & Filtering**
- **Multi-criteria filtering** by city, district, brands, and facilities
- **Real-time search** with instant results
- **Brand-specific filtering** (find malls with your favorite stores)
- **Facility-based search** (parking, food court, cinema, etc.)

### 🎨 **Beautiful UI/UX**
- **Modern Material Design** with custom animations
- **Lottie animations** for enhanced user experience
- **Curved navigation bar** with smooth transitions
- **Shimmer loading effects** for better perceived performance
- **Custom Google Fonts** (Quicksand) for elegant typography

## 🛠️ Technology Stack

### Frontend (Flutter)
```yaml
Framework: Flutter 3.7.2+
Language: Dart
State Management: StatefulWidget with Controllers
Local Storage: Hive (NoSQL database)
```

**Key Dependencies:**
- `google_maps_flutter` - Interactive maps integration
- `lottie` - Beautiful animations
- `http` - RESTful API communication
- `geolocator` & `geocoding` - Location services
- `shared_preferences` - User preferences
- `hive_flutter` - Local data persistence
- `curved_navigation_bar` - Custom navigation
- `shimmer` - Loading animations
- `google_fonts` - Typography
- `url_launcher` - External link handling
- `permission_handler` - Runtime permissions

### Backend (Node.js + Express)
```javascript
Runtime: Node.js
Framework: Express.js 5.1.0
Database: PostgreSQL 8.16.0
```

**Key Features:**
- RESTful API architecture
- CORS enabled for cross-origin requests
- PostgreSQL database with complex queries
- Advanced filtering and sorting capabilities
- Real-time rating calculations

**API Endpoints:**
- `/cities` - City management
- `/districts` - District filtering
- `/malls` - Mall CRUD operations
- `/filter-malls` - Advanced filtering
- `/brands` - Brand management
- `/facilities` - Facility listings
- `/activities` - Activity categories
- `/comments` - Review system

### Database Schema
```sql
Tables:
├── cities (id, name)
├── districts (id, name, city_id)
├── shopping_malls (id, name, city_id, district_id, rating, etc.)
├── brands (id, name)
├── facilities (id, name)
├── random_activities (id, name)
├── comments (id, name, email, comment, rating, mall_id)
├── mall_brands (mall_id, brand_id)
├── mall_facilities (mall_id, facility_id)
└── mall_activities (mall_id, activity_id)
```

## 📺 Demo Video

[![Watch the demo on YouTube](https://img.youtube.com/vi/8RNINAKFxeg/0.jpg)](https://youtu.be/8RNINAKFxeg)



## 🚀 Installation & Setup

### Prerequisites
- **Flutter SDK** (3.7.2 or higher)
- **Node.js** (16.x or higher)
- **PostgreSQL** (12.x or higher)
- **Android Studio** / **Xcode** (for mobile development)

### Backend Setup

1. **Clone the repository**
```bash
git clone https://github.com/azraculhaci/shopping-mall-app.git
cd shopping-mall-app/backend
```

2. **Install dependencies**
```bash
npm install
```

3. **Database Configuration**
```javascript
// Update database credentials in index.js
const pool = new Pool({
  user: 'your_username',
  host: 'localhost',
  database: 'avmapp_db',
  password: 'your_password',
  port: 5432,
});
```

4. **Create PostgreSQL database**
```sql
CREATE DATABASE avmapp_db;
-- Run your database migrations here
```

5. **Start the server**
```bash
node index.js
```
The server will run on `http://localhost:3000`

### Frontend Setup

1. **Navigate to frontend directory**
```bash
cd ../frontend
```

2. **Install Flutter dependencies**
```bash
flutter pub get
```

3. **Configure API endpoints**
Update the base URL in your API service files to match your backend server.

4. **Add Google Maps API key**
Add your Google Maps API key in:
- `android/app/src/main/AndroidManifest.xml`
- `ios/Runner/AppDelegate.swift`

5. **Add OpenWeatherMap API key**
Update the API key in `lib/services/weather_service.dart`:
```dart
final _weatherService = WeatherService('your_openweathermap_api_key');
```

6. **Run the app**
```bash
flutter run
```

## 🔧 Configuration

### Weather Service
Get your free API key from [OpenWeatherMap](https://openweathermap.org/api) and update:
```dart
// lib/services/weather_service.dart
final _weatherService = WeatherService('YOUR_API_KEY_HERE');
```

### Google Maps
Get your API key from [Google Cloud Console](https://console.cloud.google.com/) and add it to:
- Android: `android/app/src/main/AndroidManifest.xml`
- iOS: `ios/Runner/AppDelegate.swift`

### Database
Create the required tables in PostgreSQL:
```sql
-- Add your database schema here
-- Cities, districts, shopping_malls, brands, facilities, etc.
```

## 📋 API Documentation

### Malls
- `GET /malls` - Get all malls with sorting
- `GET /malls/:id` - Get specific mall details
- `GET /filter-malls` - Advanced filtering

### Location
- `GET /cities` - Get all cities
- `GET /districts` - Get districts by city

### Reviews
- `GET /comments?mallId=:id` - Get mall reviews
- `POST /comments` - Add new review

### Activities & Brands
- `GET /brands` - Get all brands
- `GET /facilities` - Get all facilities
- `GET /activities` - Get all activities

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Azra Culhaci**
- GitHub: [@azraculhaci](https://github.com/azraculhaci)

## 🙏 Acknowledgments

- OpenWeatherMap for weather data
- Google Maps Platform for mapping services
- Lottie Files for beautiful animations
- Flutter community for amazing packages

---

<div align="center">

**⭐ Star this repository if you found it helpful!**

Made with ❤️ by [Azra Culhaci](https://github.com/azraculhaci)

</div>
