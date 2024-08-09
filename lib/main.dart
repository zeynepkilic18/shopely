import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter_application_1/pages/anasayfa.dart';
import 'package:flutter_application_1/widgets/drawer_widget.dart';
import 'package:flutter_application_1/widgets/bottom_navigation_bar.dart';
import 'firebase_options.dart'; // Firebase seçeneklerinizi içeren dosya

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase'i başlat
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: AppDrawer(), // Drawer widget'i ekleyin
        bottomNavigationBar: BottomNavigationBarWidget(),
        body: const Anasayfa(),
      ),
    );
  }
}
