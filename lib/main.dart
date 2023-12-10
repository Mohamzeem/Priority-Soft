import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:priority_soft/Core/App/app.dart';
import 'package:priority_soft/Core/App/app_info.dart';
import 'package:priority_soft/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MyApp.setSystemUi();
  runApp(const AppView());
}
