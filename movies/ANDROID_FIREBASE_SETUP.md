# Android Firebase Setup Guide

## 🤖 Android-Specific Firebase Authentication Setup

Since you're focusing on Android development, here's a streamlined setup guide specifically for Android.

## Prerequisites

1. **Android Studio** installed with Flutter plugin
2. **Android device** or emulator for testing
3. **Firebase Project** created at [Firebase Console](https://console.firebase.google.com/)

## Step-by-Step Android Setup

### 1. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project" or "Add project"
3. Enter project name (e.g., "movies-app")
4. Enable Google Analytics (optional)
5. Click "Create project"

### 2. Add Android App to Firebase

1. In Firebase Console, click "Add app" and select Android
2. Enter your Android package name: `com.example.movies`
3. Enter app nickname: "Movies App"
4. Click "Register app"

### 3. Download google-services.json

1. Download the `google-services.json` file
2. Move it to your Android app module root directory:
   ```
   android/app/google-services.json
   ```

### 4. Enable Authentication

1. In Firebase Console, go to "Authentication"
2. Click "Get started"
3. Go to "Sign-in method" tab
4. Enable "Email/Password" provider
5. Click "Save"

### 5. Configure Firebase in Android

The Firebase configuration is already set up in your Flutter project:

✅ **android/build.gradle.kts** - Google Services plugin added
✅ **android/app/build.gradle.kts** - Google Services applied
✅ **pubspec.yaml** - Firebase dependencies added
✅ **lib/firebase_options.dart** - Configuration file created

### 6. Update Firebase Configuration

After running `flutterfire configure`, your `lib/firebase_options.dart` will be automatically updated with your project's Android configuration.

## Quick Setup Commands

```bash
# Install FlutterFire CLI
npm install -g firebase-tools
dart pub global activate flutterfire_cli

# Login to Firebase
firebase login

# Configure Firebase for your project
flutterfire configure

# Get dependencies
flutter pub get

# Run on Android
flutter run
```

## Android-Specific Features

### 📱 **What's Included for Android:**

- **Email/Password Authentication** - Complete sign-up and sign-in flow
- **Password Reset** - Send reset emails directly from the app
- **Form Validation** - Client-side email and password validation
- **Error Handling** - User-friendly error messages
- **Auto Login** - Remember user sessions across app restarts
- **Material Design** - Native Android Material 3 UI components
- **Responsive Layout** - Optimized for various Android screen sizes

### 🎨 **Android UI Features:**

- Material 3 design system
- Native Android navigation
- Keyboard-friendly input handling
- Android-style snackbar notifications
- Proper Android back button handling
- Material elevation and shadows

## Testing on Android

### Run on Android Emulator:

```bash
# List available emulators
flutter emulators

# Launch emulator
flutter emulators --launch <emulator_id>

# Run app
flutter run
```

### Run on Physical Android Device:

1. Enable Developer Options on your Android device
2. Enable USB Debugging
3. Connect device via USB
4. Run: `flutter run`

## Android Build Configuration

Your Android configuration is ready with:

- **Minimum SDK**: As specified in Flutter configuration
- **Target SDK**: Latest Android SDK
- **Compile SDK**: Latest Android SDK
- **Java Version**: 11 (required for Firebase)
- **Kotlin Support**: Enabled

## Firebase Security Rules

For production, update your Firebase Authentication settings:

1. **Email Verification**: Enable in Firebase Console
2. **Password Policy**: Set minimum requirements
3. **Rate Limiting**: Configure to prevent abuse
4. **Domain Restrictions**: Add your domain if needed

## Troubleshooting

### Common Android Issues:

1. **"google-services.json not found"**

   - Ensure file is in `android/app/` directory
   - Check file name spelling

2. **"Failed to apply plugin"**

   - Verify Google Services plugin in build.gradle files
   - Check Gradle version compatibility

3. **"Firebase not initialized"**

   - Ensure `Firebase.initializeApp()` is called in main()
   - Check firebase_options.dart configuration

4. **"Network error"**
   - Check internet connection
   - Verify Firebase project is active

## Next Steps

After setup is complete:

1. **Test Authentication**: Try register → login → logout flow
2. **Add User Profiles**: Store additional user data in Firestore
3. **Add Movie Features**: Implement your movies functionality
4. **Add Push Notifications**: Firebase Cloud Messaging
5. **Add Analytics**: Firebase Analytics for user insights

## Build for Release

When ready to build for production:

```bash
# Build APK
flutter build apk --release

# Build App Bundle (recommended for Play Store)
flutter build appbundle --release
```

Your Android app with Firebase authentication is now ready! 🚀
