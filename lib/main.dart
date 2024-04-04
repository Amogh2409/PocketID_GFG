import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pocketid_gfg/SplashScreen/checkPin.dart';
import 'package:provider/provider.dart';
import 'SplashScreen/SplashScreen.dart';
import 'utils/themeChanger.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that the binding is initialized before calling the runApp() function.
  runApp(ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(),
    child: const MyApp(),
  ));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: "PocketID",
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const SplashScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
