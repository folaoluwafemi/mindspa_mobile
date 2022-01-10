import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';

import '../src/core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Implement ThemeData
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      title: AppStrings.mindSpa,
      initialRoute: Routes
          .onBoarding, //TODO: Use SharedPreferences to store first time user, and show login screen on second time user
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
