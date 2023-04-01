import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talawa_demo/firebase_options.dart';
import 'package:talawa_demo/home_page.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Uri? _link;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseDynamicLinks.instance.getInitialLink().then((value) {
    if (value != null) {
      _link = value.link;
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talawa Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
