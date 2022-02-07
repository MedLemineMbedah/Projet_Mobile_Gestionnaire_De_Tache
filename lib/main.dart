import 'package:flutter/material.dart';

import 'src/app.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.,
  runApp(MyApp());
}


