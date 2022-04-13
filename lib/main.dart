import 'package:final_year_project/providers/theme.dart';
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
          create: (_) => UserProvider(address: '', age: '', email: '', name: '', phone: '', usertype: ''),
        ),

        ChangeNotifierProvider<Themechanger>(
          create: (_)=> Themechanger(ThemeData.dark())
          
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
    final theme=Provider.of<Themechanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: theme.getTheme(),
       
      
      home: const SplashScreen(),
    );
  }
}
