// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_import, unused_import

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reminder/Ui/theme.dart';
import 'package:reminder/Ui/widgets/welcome.dart';
import 'package:reminder/db/db_helper.dart';
import 'package:reminder/easy%20contact/contact_screen.dart';
import 'package:reminder/services/theme_services.dart';
import 'package:reminder/easy%20contact/search_screen.dart';
import 'package:reminder/Ui/home_page.dart';
import 'package:reminder/easy contact/infor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeServices().theme,
        home: Welcome()); //home: Myhomepage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            HomePage(),
            Search(),
            Contact(),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            Tab(
              icon: Image.asset(
                'assets/images/reminder.png',
                width: 50,
                height: 50,
                color: _selectedIndex == 0
                    ? Color.fromARGB(255, 182, 165, 165)
                    : Color(0xFF656DB4),
              ),
            ),
            Tab(
              icon: Image.asset(
                'assets/images/search.png',
                width: 50,
                height: 50,
                color: _selectedIndex == 1
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Color(0xFF656DB4),
              ),
            ),
            Tab(
              icon: Image.asset(
                'assets/images/contact.png',
                width: 50,
                height: 50,
                color: _selectedIndex == 2
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Color(0xFF656DB4),
              ),
            ),
          ],
          indicator: BoxDecoration(
            color: Color(0xFF656DB4), // set background color
            borderRadius: BorderRadius.circular(60),
          ),
          indicatorColor: Color.fromARGB(0, 182, 43, 43),
          // remove default indicator
        ),
      ),
    );
  }
}
