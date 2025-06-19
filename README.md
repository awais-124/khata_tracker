# Khata Tracker 💰

[![Flutter](https://img.shields.io/badge/Flutter-3.16-blue)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-11.0-orange)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

A cross-platform debt management app built with Flutter & Firebase. Track loans, credit, and payments seamlessly across Android, iOS, and Web.

## Features ✨

* 🔐 Secure authentication (Email/Google)
* 📝 Record debts with details (amount, date, witness)
* 🔍 Search & filter by person/status
* 📊 Monthly debt summaries
* 🎨 Dark/Light theme support
* 📄 Export transactions to PDF
* 🔔 Payment reminders

## Tech Stack 🖪️

* **Frontend**: Flutter 3.16
* **Backend**: Firebase (Auth, Firestore)
* **State Management**: Provider
* **PDF Generation**: `pdf` package
* **Notifications**: `flutter_local_notifications`

## Screenshots 📱

| Login Screen                                         | Debt List                                            | Add Transaction                                         |
| ---------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------------- |
| <img src="assets/screenshots/login.png" width="200"> | <img src="assets/screenshots/debts.png" width="200"> | <img src="assets/screenshots/add_debt.png" width="200"> |

## Installation 🚀

### Prerequisites

* Flutter SDK (>=3.16.0)
* Firebase account
* Android Studio/Xcode (for mobile builds)

### 1. Clone the Repository

```bash
git clone https://github.com/awais-124/khata_tracker.git
cd khata_tracker
```

### 2. Firebase Setup

Create a new Firebase project at [console.firebase.google.com](https://console.firebase.google.com)

Enable these services:

* **Authentication** (Email/Password + Google)
* **Firestore Database** (Start in test mode)

### 3. Configure FlutterFire

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Run configuration (select platforms: Android, iOS, Web)
flutterfire configure
```

### 4. Install Dependencies

```bash
flutter pub get
```

### 5. Running the App ▶️

**Web Development**

```bash
flutter run -d chrome
```

**Android Build**

```bash
flutter build apk --release
# APK location: build/app/outputs/flutter-apk/app-release.apk
```

**iOS Build (Mac Only)**

```bash
flutter build ios
open ios/Runner.xcworkspace
```

## Project Structure 📂

```
lib/
├── core/               # Business logic & utilities
│   ├── constants/      # App constants
│   ├── services/       # Firebase services
│   └── utils/          # Helper functions
├── features/           # Feature modules
│   ├── auth/           # Authentication
│   ├── debts/          # Debt management
│   └── settings/       # User settings
├── shared/             # Reusable components
│   ├── models/         # Data models
│   └── widgets/        # Custom widgets
└── main.dart           # App entry point
```

## Environment Variables 🔒

Create `.env` file in root (add to `.gitignore`):

```env
FIREBASE_API_KEY=your_api_key
FIREBASE_AUTH_DOMAIN=your_project.firebaseapp.com
FIREBASE_PROJECT_ID=your_project_id
```

## Common Issues & Fixes ⚠️

### 1. Firebase Not Initialized

```bash
# Ensure you've run:
flutterfire configure
```

### 2. Web CORS Errors

Update Firestore rules (for dev only):

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

## Contributing 🤝

1. Fork the repository
2. Create a new branch

```bash
git checkout -b feature/your-feature
```

3. Commit your changes

```bash
git commit -m "Add some feature"
```

4. Push to the branch

```bash
git push origin feature/your-feature
```

5. Open a Pull Request

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Need Help?

Contact [@awais-124](https://github.com/awais-124) or open an issue in the repository.

---