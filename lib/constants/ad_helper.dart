import 'dart:io';

class AdHelper {

  static void get doit {
    print('m');
}
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5130588222669135/8493349569';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5130588222669135/4554104553';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return '<YOUR_ANDROID_INTERSTITIAL_AD_UNIT_ID>';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return '<YOUR_ANDROID_REWARDED_AD_UNIT_ID>';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_REWARDED_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}