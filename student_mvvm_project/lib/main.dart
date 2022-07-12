import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mvvm_project/provider/CategoryProvider.dart';
import 'package:student_mvvm_project/resources/style_resources.dart';
import 'package:student_mvvm_project/ui/AddCategory.dart';

import 'UI/Display_category.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: Display_category(),
  //     routes: {
  //       "DisplayStudent": (BuildContext context) => DisplayStudent(),
  //       // "Update": (BuildContext context) => UpdateForm(),
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Go Local',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: StyleResources.white),
          scaffoldBackgroundColor: StyleResources.scaffoldBackgroundColor,
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AddCategory(""),
        routes: {
          "DisplayCategory": (BuildContext context) => Display_category(),
          "AddCategory": (BuildContext context) => AddCategory(""),
        },
      ),
    );
  }
}

