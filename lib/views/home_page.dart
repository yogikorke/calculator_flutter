import 'package:calculator/controllers/calculator_controller.dart';
import 'package:calculator/widgets/body_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../widgets/switchThemeButton.dart';
import '../widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CalculatorController _controller = Get.put(CalculatorController());
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();

    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        )).then((value) => {
          _interstitialAd?.fullScreenContentCallback =
              FullScreenContentCallback(
            onAdShowedFullScreenContent: (InterstitialAd ad) =>
                debugPrint('%ad onAdShowedFullScreenContent.'),
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              debugPrint('$ad onAdDismissedFullScreenContent.');
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent:
                (InterstitialAd ad, AdError error) {
              debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
              ad.dispose();
            },
            onAdImpression: (InterstitialAd ad) =>
                debugPrint('$ad impression occurred.'),
            onAdClicked: (ad) => debugPrint('$ad ad clicked.'),
          )
        });

    Future.delayed(const Duration(seconds: 60), () {
      debugPrint('showing ad');
      _interstitialAd?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SwitchThemeButton(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(() {
                    final userInput = _controller.input.value;
                    final result = _controller.result.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(userInput, style: kTextStyle(30)),
                        Text(result, style: kTextStyle(50)),
                      ],
                    );
                  }),
                ],
              ),
            ),
            BodyContainer(),
          ],
        ),
      ),
    );
  }
}
