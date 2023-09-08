import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/app/data/models/banner_intro_model.dart';

class BannerNotifier extends StateNotifier<BannerIntro> {
  BannerNotifier() : super(BannerIntro());

  void setBanner(BannerIntro banner) {
    state = banner;
  }
}

final bannerProvider = StateNotifierProvider<BannerNotifier, BannerIntro>((ref) {
  return BannerNotifier();
});
