import 'package:firebase_core/firebase_core.dart';
import 'package:fit_track/app/app.dart';
import 'package:fit_track/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
