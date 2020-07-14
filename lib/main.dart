import 'package:camera_streaming/src/pages/login_screen.dart';
import 'package:camera_streaming/src/stores/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Câmera Streaming',
      theme: ThemeData(
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
      ),
      home: MultiProvider(
          providers: [
            Provider<Controller>(
              create: (_) => Controller()
            )
          ],
          child: LoginScreen()),
    );
  }
}
