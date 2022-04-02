import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/UI/onboarding/page_1/page_1_view.dart';
import 'package:mindspa_mobile/src/UI/onboarding/page_2/page_2_view.dart';
import 'package:mindspa_mobile/src/UI/onboarding/page_3/page_3_view.dart';

import 'package:stacked/stacked.dart';

class OnboardingViewModel extends IndexTrackingViewModel {
  List<Widget> screens = const [
    Page1View(),
    Page2View(),
    Page3View(),
  ];
}
