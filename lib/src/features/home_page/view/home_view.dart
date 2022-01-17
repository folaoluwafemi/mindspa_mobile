import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/features/home_page/notifiers/log_out_notifier.dart';
import 'package:mindspa_mobile/src/widgets/statusbar.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final firebaseUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Theme.of(context).colorScheme.primary,
          automaticallyImplyLeading: false,
        ),
        body: Statusbar(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                height: 100,
                width: double.infinity,
                child: Center(
                  child: Text(
                    '${AppStrings.welcome} ${firebaseUser.currentUser?.displayName}',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: ElevatedButton.icon(
                        onPressed: () => LogoutNotifier().signOut(context),
                        icon: const Icon(
                          Icons.logout,
                          size: 40,
                        ),
                        label: Text(
                          AppStrings.signOut,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
