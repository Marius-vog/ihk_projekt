import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ihk_projekt/pages/app_overview_page.dart';
import 'package:ihk_projekt/pages/detect_emotions.dart';
import 'package:ihk_projekt/pages/detect_text_page.dart';
import 'package:ihk_projekt/pages/image_label_page.dart';
import 'package:ihk_projekt/pages/main_page.dart';
import 'package:ihk_projekt/pages/quickstart_information.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff457EF6),
        textSelectionColor: Color(0xff515151),
        backgroundColor: Color(0xffF9F9F9),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SingleChildScrollView(child: MainPage()),
      ),
      routes: {
        DetectTextPage.routeName: (ctx) => DetectTextPage(),
        AppOverView.routeName: (ctx) => AppOverView(),
        QuickstartInformation.routeName: (ctx) => QuickstartInformation(),
        LabelImagePage.routeName: (ctx) => LabelImagePage(),
        DetectEmotionPage.routeName: (ctx) => DetectEmotionPage(),
      },
    );
  }
}
