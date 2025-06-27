import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../screens/login_screen.dart';
import '../screens/main_navigation_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        print('AuthWrapper - Connection State: ${snapshot.connectionState}');
        print('AuthWrapper - Has Data: ${snapshot.hasData}');
        print('AuthWrapper - User: ${snapshot.data?.email ?? 'null'}');

        // Show loading spinner while waiting for auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading...'),
                ],
              ),
            ),
          );
        }

        // If user is logged in, show main navigation screen
        if (snapshot.hasData && snapshot.data != null) {
          print(
            'AuthWrapper - Showing MainNavigationScreen for user: ${snapshot.data!.email}',
          );
          return const MainNavigationScreen();
        }

        // If user is not logged in, show login screen
        print('AuthWrapper - Showing LoginScreen');
        return const LoginScreen();
      },
    );
  }
}
