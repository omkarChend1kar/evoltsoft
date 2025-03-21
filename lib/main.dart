import 'package:evoltsoft/firebase_options.dart';
import 'package:evoltsoft/src/app.dart';
import 'package:evoltsoft/src/core/common/services/service_locator.dart';
import 'package:evoltsoft/src/core/common/settings/settings_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Used to bind the widgets
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Configure the resource locator
  await configureDependencies();
  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await getIt<Settings>().loadSettings();
  // Run the app
  runApp(const EvoltSoftApp());
}
