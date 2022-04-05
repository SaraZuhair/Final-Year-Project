import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'providers/userprv.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(address: '', age: '', email: '', name: '', phone: ''),
        ),
      ],
      child:const MyApp()
    ),
    
    );
    }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
