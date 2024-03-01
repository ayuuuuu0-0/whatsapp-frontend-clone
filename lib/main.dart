import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_frontend_clone/screens/homeScreen.dart';
import 'package:whatsapp_frontend_clone/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger(),
        child: Builder(
            builder: (BuildContext context) {
              final themeChanger = Provider.of<ThemeChanger>(context);
              return  MaterialApp(
                title: 'Flutter Demo',
                home:  HomeScreen(),
                themeMode: themeChanger.themeMode,
                theme: ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.teal,
                  textTheme: const TextTheme(
                    displaySmall: TextStyle(fontFamily: 'Bold', fontSize: 20.0,color: Colors.black ),
                    headlineMedium: TextStyle(fontFamily: 'Bold', fontSize: 18.0,color: Color(0xff25292B) ),
                    headlineSmall: TextStyle(fontFamily: 'Bold',fontSize: 16.0,color: Color(0xff25292B) ),
                    titleLarge: TextStyle(fontFamily: 'Bold', fontSize: 14.0,color: Color(0xff25292B)),
                    bodyLarge: TextStyle(fontFamily: 'Regular', fontSize: 12.0, color: Color(0xff25292B)),
                    bodyMedium: TextStyle(fontFamily: 'Regular', fontSize: 10.0, color:Color(0xff25292B)),
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.grey.shade600
                  ),
                ),
                debugShowCheckedModeBanner: false,
              );

            })
    );
  }
}
