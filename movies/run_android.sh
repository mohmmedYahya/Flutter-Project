#!/bin/bash

echo "🤖 Movies App - Android Setup & Run Script"
echo "==========================================="

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    exit 1
fi

# Check if Android setup is ready
echo "🔍 Checking Flutter doctor..."
flutter doctor --android-licenses > /dev/null 2>&1

# Check if google-services.json exists
if [ ! -f "android/app/google-services.json" ]; then
    echo "⚠️  Warning: google-services.json not found!"
    echo "📋 Please follow these steps:"
    echo "   1. Go to Firebase Console: https://console.firebase.google.com/"
    echo "   2. Create a project and add Android app"
    echo "   3. Download google-services.json"
    echo "   4. Place it in android/app/google-services.json"
    echo ""
    echo "💡 Or run: flutterfire configure"
    echo ""
fi

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# List available devices
echo "📱 Available Android devices:"
flutter devices | grep android

# Check if any Android device is connected
if flutter devices | grep -q android; then
    echo ""
    echo "🚀 Running app on Android..."
    flutter run --target lib/main.dart
else
    echo ""
    echo "❌ No Android devices found!"
    echo "📋 Please:"
    echo "   • Connect an Android device via USB (with USB debugging enabled)"
    echo "   • Or start an Android emulator"
    echo ""
    echo "🔧 To list emulators: flutter emulators"
    echo "🔧 To launch emulator: flutter emulators --launch <emulator_name>"
fi 