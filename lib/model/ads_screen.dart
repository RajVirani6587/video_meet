import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:video_meet/const/conts.dart';

BannerAd? bannerAd;
InterstitialAd? interstitialAd;
InterstitialAd? interstitialVideoAd;
RewardedAd? rewardedAd;
AppOpenAd? appOpenAd;

void bannerAds(){
  bannerAd = BannerAd(
    size:AdSize.banner,
    adUnitId: "$ba",
    listener: BannerAdListener(),
    request: AdRequest(),
  );
  bannerAd!.load();

}

void interAds(){
  InterstitialAd.load(
      adUnitId: "$ia",
      request: AdRequest(),
      adLoadCallback:  InterstitialAdLoadCallback(onAdLoaded: (ad){
        interstitialAd = ad;
        interstitialAd!.show();
      },
          onAdFailedToLoad:(error){
            interAds();
          }
      )
  );
}

void interVideoAds(){
  InterstitialAd.load(
      adUnitId: "$iva",
      request: AdRequest(),
      adLoadCallback:  InterstitialAdLoadCallback(onAdLoaded: (ad){
        interstitialVideoAd = ad;
        interstitialVideoAd!.show();
      },
          onAdFailedToLoad:(error){
            interVideoAds();
          }
      )
  );
}

void rewardAds(){
  RewardedAd.load(
      adUnitId: "$ra",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad){
        rewardedAd = ad;
        rewardedAd!.show(onUserEarnedReward: (ad, reward) {

        },);
      },
          onAdFailedToLoad:(error){
            rewardAds();
          }
      )
  );
}

void openAds(){
  AppOpenAd.load(adUnitId: "$ao", request: AdRequest(), adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad){
    appOpenAd=ad;
    appOpenAd!.show();
  }, onAdFailedToLoad: (error){
    openAds();
  }), orientation: AppOpenAd.orientationPortrait);
}
