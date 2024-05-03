import 'package:flutter/material.dart';

import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_provider.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => CharacterProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: primaryTheme,
      home: const Home(),
    ),
  ));
}
