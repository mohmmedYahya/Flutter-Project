# SHA-1 Fingerprint Setup Guide

## 🔑 Your SHA-1 Fingerprint

```
A3:94:66:B6:A6:AD:A6:07:C7:2E:A5:68:03:7D:9E:90:53:35:81:5B
```

## 🚀 Step-by-Step Firebase Configuration

### Step 1: Open Firebase Console

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click on your project: **movies-f56b7**

### Step 2: Navigate to Project Settings

1. Click the **gear icon ⚙️** (Project Settings)
2. Scroll down to the **"Your apps"** section
3. Find your Android app with package name: `com.example.movies`

### Step 3: Add SHA-1 Fingerprint

1. In your Android app section, click **"Add fingerprint"**
2. Paste this SHA-1 fingerprint:
   ```
   A3:94:66:B6:A6:AD:A6:07:C7:2E:A5:68:03:7D:9E:90:53:35:81:5B
   ```
3. Click **"Save"**

### Step 4: Enable Google Sign-In

1. Go to **"Authentication"** in the left sidebar
2. Click **"Sign-in method"** tab
3. Find **"Google"** in the list
4. Click **"Google"** to configure it
5. Toggle **"Enable"** to ON
6. Enter your support email (your Firebase account email)
7. Click **"Save"**

### Step 5: Download Updated google-services.json (Optional)

After adding the SHA-1 fingerprint, you might want to download the updated `google-services.json`:

1. Go back to **Project Settings** → **Your apps**
2. Click the **download icon** next to your Android app
3. Replace the existing `android/app/google-services.json` with the new one

## 🔧 Understanding Different Fingerprints

### Debug vs Release

- **Debug SHA-1**: Used during development and testing
- **Release SHA-1**: Used for production apps on Google Play Store

### Current Setup

- **Debug SHA-1**: `A3:94:66:B6:A6:AD:A6:07:C7:2E:A5:68:03:7D:9E:90:53:35:81:5B`
- **Release SHA-1**: You'll need to generate this when you create a release keystore

## 🎯 Testing Your Setup

### After Adding SHA-1 to Firebase:

1. Run your app: `flutter run`
2. Navigate to login screen
3. Tap **"Continue with Google"**
4. You should see the Google account picker
5. Select an account and authorize

### Troubleshooting:

- **Error 10**: SHA-1 fingerprint not added or incorrect
- **Error 12501**: Indicates user canceled or network issues
- **Error 7**: Network error, check internet connection

## 📋 Commands Used to Get SHA-1

### Method 1: Gradle (Used)

```bash
cd android
./gradlew signingReport
```

### Method 2: Keytool (Alternative)

```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

## 🔒 Security Notes

- Debug certificates are automatically generated
- Never share your release keystore or passwords
- Each developer machine has a unique debug certificate
- For production, you'll need to generate a release keystore

## ✅ Verification Checklist

- [ ] SHA-1 fingerprint added to Firebase project
- [ ] Google Sign-In provider enabled in Firebase Authentication
- [ ] Support email configured in Google Sign-In settings
- [ ] App tested with Google Sign-In
- [ ] No error messages during sign-in process

## 🆘 Need Help?

If you encounter issues:

1. Double-check the SHA-1 fingerprint matches exactly
2. Ensure Google Sign-In is enabled in Firebase
3. Check internet connection
4. Try `flutter clean && flutter pub get`
5. Restart your development environment

## 📞 Support Resources

- [Firebase Authentication Documentation](https://firebase.google.com/docs/auth)
- [Google Sign-In for Android](https://developers.google.com/identity/sign-in/android)
- [Flutter Firebase Setup](https://firebase.flutter.dev/docs/auth/social)
