import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_code_pro/home_page.dart';

AppOpenAd? appOpenAd;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration = RequestConfiguration(
    testDeviceIds: [
      '8a09f539-d050-4764-b0fd-440290bcb731',
      'c46fddd8-2889-43f0-87a2-831e73915722',
      'd524e7cf-107d-46d0-bf4b-7fad9be5b421',
    ],
  );
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);

  loadAd();
  runApp(const MyApp());
}

loadAd() {
  AppOpenAd.load(
    adUnitId: 'ca-app-pub-2916192174944019/4152648441',
    request: AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        appOpenAd = ad;
        appOpenAd!.show();
      },
      onAdFailedToLoad: (error) {
        debugPrint('Error: $error');
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Pro',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
