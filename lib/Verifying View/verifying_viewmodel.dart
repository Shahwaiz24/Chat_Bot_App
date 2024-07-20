import 'package:stacked/stacked.dart';

class VerifyingViewmodel extends BaseViewModel {
  int loading = 0;
  String loadingLevel = 'Phone Verified';
  verification() async {
    for (var i = 0; i < 100; i++) {
      loading++;
      if (loading == 25) {
        loadingLevel = 'Phone Verified';
        await Future.delayed(Duration(seconds: 1));
        rebuildUi();
      } else if (loading == 50) {
        loadingLevel = 'Activation Started';
        await Future.delayed(Duration(seconds: 2));
        rebuildUi();
      } else if (loading == 75) {
        loadingLevel = 'Atom Core Initialization';
        await Future.delayed(Duration(seconds: 2));
        rebuildUi();
      } else if (loading == 100) {
        loadingLevel = 'Activated';
        rebuildUi();
      }
    }
  }
}
