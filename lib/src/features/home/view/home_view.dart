import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/features/home/notifier/home_notifier.dart';
import 'package:mindspa_mobile/src/widgets/statusbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Statusbar(
        child: Scaffold(
      body: Column(
        children: [
          Flexible(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  expandedHeight: height * 0.15,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ListTile(
                      title: Text(
                        '${AppStrings.welcome} ${StartupNotifier().currentUser?.displayName}',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      subtitle: Text(
                        AppStrings.canWeHelp,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.categories,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 20),
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Theme.of(context).colorScheme.primary,
                          child: Row(
                            children: [Text(categories[index])],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
 
        ],
      ),
    ));
  }
}

final categories = [
  AppStrings.sleepRelaxation,
  AppStrings.nutritionGuide,
  AppStrings.exercise,
];
