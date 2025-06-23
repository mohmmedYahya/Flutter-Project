# Google Sign-In Setup for Movies App

This document explains how Google Sign-In has been integrated into the Movies Flutter app.

## Features Added

### 1. Google Sign-In Authentication

- Users can now sign in with their Google account
- Seamless integration with Firebase Authentication
- Automatic sign-out from Google when signing out from the app

### 2. Updated UI

- Added a "Continue with Google" button on the login screen
- Clean separation between email/password and Google sign-in options
- Fallback icon when Google logo is not available

### 3. Enhanced Auth Service

- `signInWithGoogle()` method for Google authentication
- Updated `signOut()` method to handle Google sign-out
- Proper error handling for Google sign-in failures

## Technical Implementation

### Dependencies Added

```yaml
dependencies:
  google_sign_in: ^6.2.1
```

### Assets Added

- `assets/images/google_logo.png` - Google logo for the sign-in button
- Updated `pubspec.yaml` to include assets folder

### Code Changes

#### AuthService (`lib/services/auth_service.dart`)

- Added Google Sign-In instance: `GoogleSignIn _googleSignIn = GoogleSignIn()`
- New method: `signInWithGoogle()` - handles Google authentication flow
- Updated `signOut()` method to sign out from both Firebase and Google

#### Login Screen (`lib/screens/login_screen.dart`)

- Added `_signInWithGoogle()` method
- New UI elements: divider, Google sign-in button
- Integrated with existing loading states and error handling

## Firebase Configuration

### Required Firebase Setup

1. **Enable Google Sign-In Provider**:

   - Go to Firebase Console → Authentication → Sign-in methods
   - Enable "Google" provider
   - Set up OAuth 2.0 client IDs

2. **Android Configuration**:

   - The `google-services.json` file already includes OAuth client configuration
   - Package name: `com.example.movies`

3. **iOS Configuration** (if needed):
   - Add `GoogleService-Info.plist` to iOS project
   - Configure URL schemes in `Info.plist`

## Usage

### For Users

1. Open the app and navigate to the login screen
2. Choose between:
   - Sign in with email/password
   - Continue with Google
3. For Google sign-in: select your Google account and authorize the app

### For Developers

```dart
// Sign in with Google
try {
  final result = await authService.signInWithGoogle();
  if (result != null) {
    // User signed in successfully
  }
} catch (e) {
  // Handle sign-in error
}

// Sign out (includes Google sign-out)
await authService.signOut();
```

## Error Handling

The implementation includes comprehensive error handling for:

- Network connectivity issues
- User cancellation of Google sign-in
- Firebase authentication errors
- Google Sign-In specific errors

## Security Considerations

- All sensitive data is handled through Firebase Authentication
- Google Sign-In follows OAuth 2.0 security standards
- No sensitive credentials are stored in the app

## Testing

### Android Testing

- Build and run on Android device/emulator
- Test Google sign-in flow
- Verify sign-out functionality

### iOS Testing (when configured)

- Configure iOS OAuth client in Firebase
- Add `GoogleService-Info.plist`
- Test on iOS device/simulator

## Troubleshooting

### Common Issues

1. **Google Sign-In fails**:

   - Check internet connection
   - Verify Firebase project configuration
   - Ensure Google provider is enabled in Firebase

2. **Build errors**:

   - Run `flutter clean && flutter pub get`
   - Check Android/iOS configuration files

3. **Logo not displaying**:
   - Check if `assets/images/google_logo.png` exists
   - Verify assets are included in `pubspec.yaml`

## Next Steps

1. **Enable Google Sign-In in Firebase Console**:

   - Go to Authentication → Sign-in methods
   - Enable Google provider
   - Add your SHA-1 fingerprint for Android

2. **iOS Setup** (if targeting iOS):

   - Add iOS OAuth client ID in Firebase
   - Configure iOS-specific settings

3. **Testing**:
   - Test on different devices
   - Verify sign-in/sign-out flow
   - Test error scenarios

## Support

For issues related to Google Sign-In implementation, check:

- [Google Sign-In Flutter Plugin Documentation](https://pub.dev/packages/google_sign_in)
- [Firebase Authentication Documentation](https://firebase.google.com/docs/auth)
- [Flutter Firebase Setup Guide](https://firebase.flutter.dev/docs/auth/social)
