

import 'package:final_year_project/providers/recipes.dart';
import 'package:final_year_project/providers/schedule.dart';
import 'package:final_year_project/providers/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'providers/userprv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => UserProvider(
          message: '',
            address: '',
            age: '',
            email: '',
            name: '',
            phone: '',
            usertype: '',
            id: 0),
      ),
      ChangeNotifierProvider<Themechanger>(
          create: (_) => Themechanger(ThemeData.light(),),),
      ChangeNotifierProvider(
        create: (_) => Schedule([
          {'titleinfo': '', 'detailinfo': '', 'dateinfo': ''}
        ]),
      ),

      ChangeNotifierProvider(create: (_) => Recipes(),),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<Themechanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme.getTheme(),
      home: const SplashScreen(),
    );
  }
}
