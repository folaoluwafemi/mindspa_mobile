import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/core/theme.dart';

import 'package:mindspa_mobile/src/services/snackbar_service.dart';

import 'package:stacked_services/stacked_services.dart';

import '../src/UI/startup/startup_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.mindSpa,
      theme: AppTheme.lightTheme,
      home: const StartupView(),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      scaffoldMessengerKey: SnackbarServices.scaffoldMessengerKey,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
