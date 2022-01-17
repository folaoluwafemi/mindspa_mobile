import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/core/utilities/app_functions.dart';
import 'package:mindspa_mobile/src/core/utilities/base_change_notifier.dart';
import 'package:mindspa_mobile/src/services/navigation_service.dart';
import 'package:mindspa_mobile/src/services/snackbar_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/core/theme.dart';

import '../src/core/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SnackbarService>(
          create: (context) => SnackbarService(),
        ),
        ChangeNotifierProvider<BaseChangeNotifier>(
          create: (context) => BaseChangeNotifier(),
        ),
        Provider<NavigationService>(
          create: (context) => NavigationService(),
        ),
        ChangeNotifierProvider<AppFunctions>(
          create: (context) => AppFunctions(),
        )
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.mindSpa,
        theme: AppTheme.lightTheme,
        initialRoute: loggedIn ? Routes.homeView : Routes.onBoarding,
        onGenerateRoute: Routes.generateRoute,
        scaffoldMessengerKey:
            context.read<SnackbarService>().scaffoldMessengerKey,
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            loggedIn = true;
            return Placeholder();
          } else {
            loggedIn = false;
            return Placeholder();
          }
        },
      ),
    );
  }
}

var loggedIn = false;
