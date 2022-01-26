import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindspa_mobile/src/UI/home/home_viewmodel.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/core/constant/dimensions.dart';
import 'package:mindspa_mobile/src/widgets/smart_reusable_card.dart';
import 'package:mindspa_mobile/src/widgets/spacing.dart';
import 'package:mindspa_mobile/src/widgets/statusbar.dart';

import 'package:stacked/stacked.dart';

class HomeView extends HookWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final searchFieldController = useTextEditingController();
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        // final width = MediaQuery.of(context).size.width;
        return Statusbar(
          child: Scaffold(
            body: CustomScrollView(
              controller: scrollController,
              shrinkWrap: true,
              slivers: [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  snap: false,
                  toolbarHeight: 100,
                  centerTitle: false,
                  title: ListTile(
                    isThreeLine: true,
                    title: Text(
                      '${AppStrings.welcome} ${model.currentUserdisplayname}',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    subtitle: Text(
                      AppStrings.canWeHelp,
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 12,
                          ),
                    ),
                  ),
                  bottom: AppBar(
                    title: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(10),
                          )),
                      width: double.infinity,
                      height: 40,
                      child: Center(
                        child: SearchTextField(
                          controller: searchFieldController,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SearchTextField(controller: searchFieldController),
                        Text(
                          AppStrings.categories,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 25),
                        ),
                        const Spacing.smallHeight(),
                        SmartResuableCard(
                          text: AppStrings.sleepRelaxation,
                          imagePath: AppImages.homeAvatar1,
                          color: Theme.of(context).colorScheme.primary,
                          onTap: () => model.navigateToSleepRelaxation(),
                        ),
                        const Spacing.smallHeight(),
                        SmartResuableCard(
                          text: AppStrings.nutritionGuide,
                          imagePath: AppImages.homeAvatar2,
                          color: Theme.of(context).colorScheme.secondary,
                          onTap: () => model.navigateToNutrition(),
                        ),
                        const Spacing.smallHeight(),
                        SmartResuableCard(
                          text: AppStrings.exercise,
                          imagePath: AppImages.homeAvatar,
                          color: Theme.of(context).colorScheme.primary,
                          onTap: () => model.navigateToExercise(),
                        ),
                        const Spacing.mediumHeight(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.explore,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(fontSize: 19),
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  label: Text(
                                    AppStrings.seeAll,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0; i < 8; i++)
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child:
                                      SvgPicture.asset(AppImages.homeAvatar1),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
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
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [AppColors.defaultShadow],
      ),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            bottom: 16,
            right: Dimensions.medium,
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
      ),
    );
  }
}
