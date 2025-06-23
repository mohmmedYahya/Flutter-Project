# Firebase Setup Guide

## Prerequisites

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication with Email/Password in Firebase Console:
   - Go to Authentication > Sign-in method
   - Enable "Email/Password" provider

## Firebase Configuration

### Step 1: Install FlutterFire CLI

```bash
npm install -g firebase-tools
dart pub global activate flutterfire_cli
```

### Step 2: Login to Firebase

```bash
firebase login
```

### Step 3: Configure Firebase for your Flutter app

```bash
flutterfire configure
```

This will:

- Create/update `firebase_options.dart` with your actual project configuration
- Update Android and iOS configuration files

### Step 4: Update Dependencies

Run the following command to get the Firebase packages:

```bash
flutter pub get
```

## Manual Configuration (Alternative)

If you prefer manual setup, replace the placeholder values in `lib/firebase_options.dart` with your actual Firebase project configuration:

### For Web:

```dart
static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'your-actual-web-api-key',
  appId: 'your-actual-web-app-id',
  messagingSenderId: 'your-actual-messaging-sender-id',
  projectId: 'your-actual-project-id',
  authDomain: 'your-actual-project-id.firebaseapp.com',
  storageBucket: 'your-actual-project-id.appspot.com',
);
```

### For Android:

```dart
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'your-actual-android-api-key',
  appId: 'your-actual-android-app-id',
  messagingSenderId: 'your-actual-messaging-sender-id',
  projectId: 'your-actual-project-id',
  storageBucket: 'your-actual-project-id.appspot.com',
);
```

### For iOS:

```dart
static const FirebaseOptions ios = FirebaseOptions(
  apiKey: 'your-actual-ios-api-key',
  appId: 'your-actual-ios-app-id',
  messagingSenderId: 'your-actual-messaging-sender-id',
  projectId: 'your-actual-project-id',
  storageBucket: 'your-actual-project-id.appspot.com',
  iosBundleId: 'com.example.movies', // Update with your actual bundle ID
);
```

## Testing the Implementation

1. Run `flutter pub get` to install dependencies
2. Start your app with `flutter run`
3. Try registering a new user
4. Try signing in with the registered user
5. Test the logout functionality

## Authentication Features Included

✅ **User Registration** - Create new accounts with email/password
✅ **User Login** - Sign in with existing credentials  
✅ **User Logout** - Sign out functionality
✅ **Password Reset** - Send password reset emails
✅ **Form Validation** - Email and password validation
✅ **Error Handling** - Comprehensive error messages
✅ **Auth State Management** - Automatic routing based on auth state
✅ **Loading States** - Loading indicators during auth operations

## Security Notes

- Passwords must be at least 6 characters long
- Email validation is performed on the client side
- Firebase handles secure password storage and authentication
- Auth state is managed automatically across app restarts

## Next Steps

After Firebase is configured, you can:

1. Add email verification requirements
2. Implement social login (Google, Facebook, etc.)
3. Add user profile management
4. Implement Firestore for user data storage
5. Add password complexity requirements
