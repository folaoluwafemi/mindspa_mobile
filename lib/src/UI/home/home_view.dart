// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/UI/home/home_viewmodel.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/core/constant/app_ui_helpers.dart';
import 'package:mindspa_mobile/src/UI/shared/smartwidgets/statusbar.dart';

import 'package:stacked/stacked.dart';

import '../shared/dumb_widgets/scaffold_decorator.dart';
import '../shared/dumb_widgets/spacing.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var searchFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.getUserDetails(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Statusbar(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primaryVariant,
            body: ScaffoldBackgroundDecorator(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FittedBox(
                          child: Text(
                            '${AppStrings.welcome} ${model.currentUserdisplayname ?? ''}',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        const Spacing.smallHeight(),
                        Text(
                          AppStrings.canWeHelp,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const Spacing.mediumHeight(),
                        SearchTextField(controller: searchFieldController),
                        const Spacing.bigHeight(),
                        Text(
                          'Recommended',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const Spacing.smallHeight(),
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  AppImages.recommended,
                                ),
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high),
                          ),
                        ),
                        const Spacing.bigHeight(),
                        Text(
                          AppStrings.categories,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const Spacing.smallHeight(),
                        Flexible(
                          child: SizedBox(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10),
                              itemCount: model.categoryImage.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.bottomCenter,
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  model.categoryImage[index]))),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          width: 130,
                                          height: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Center(
                                              child: FittedBox(
                                                child: Text(
                                                  model.categoryText[index],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;

  const SearchTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          bottom: 16,
          right: UiHelper.medium,
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search_sharp),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 64,
        ),
      ),
    );
  }
}
