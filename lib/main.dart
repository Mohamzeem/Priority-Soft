import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft/Core/App/app_view.dart';
import 'package:priority_soft/Core/App/app_info.dart';
import 'package:priority_soft/Core/App/app_injector.dart';
import 'package:priority_soft/Core/App/bloc_observer.dart';
import 'package:priority_soft/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppInjector().setInjector();
  Bloc.observer = AppBlocObserver();
  MyApp.setSystemUi();
  runApp(const AppView());
}
