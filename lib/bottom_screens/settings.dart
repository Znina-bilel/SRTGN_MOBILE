// settings.dart
import 'package:app/bottom_screens/forgot_pss.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/signin_screen.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:
            const Color.fromARGB(255, 246, 245, 245), // Custom white background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(
              255, 4, 65, 150), // Black background for the AppBar
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.blue), // Icons in blue
          titleTextStyle: TextStyle(color: Colors.white), // Title text in white
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Default black text
          labelLarge: TextStyle(color: Colors.blue), // Blue text for buttons
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Blue background for buttons
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 65,
                width: 65,
              ),
              const SizedBox(
                  width:
                      10), // Spacing between the logo and the text (optional)
              const Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the sign-in screen when the "Login" button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0), // Spacing between the buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the sign-in screen when the "Login" button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                      );
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0), // Spacing between the buttons
                TextButton(
                  onPressed: () {
                    // Navigate to the Forgot Password screen when the "Forgot Password?" link is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
