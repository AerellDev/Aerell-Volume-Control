import 'package:aerell_volume_control/src/app_config.dart';
import 'package:aerell_volume_control/src/controllers/setting_controller.dart';
import 'package:aerell_volume_control/src/pages/about_page.dart';
import 'package:aerell_volume_control/src/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import 'src/pages/setting_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  AppConfig.appName = packageInfo.appName;
  AppConfig.appVersion = packageInfo.version;
  AppConfig.appPackage = packageInfo.packageName;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SettingController(),
        )
      ],
      child: const AerellVolumeControlApp()
    )
  );
}

class AerellVolumeControlApp extends StatelessWidget {
  const AerellVolumeControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.app_name,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 189, 47, 37),
        primarySwatch: generateMaterialColor(color: const Color.fromARGB(255, 189, 47, 37)),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<SettingController>().themeMode,
      locale: context.watch<SettingController>().locale,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch(settings.name) {
              case AboutPage.routeName:
                return const AboutPage();
              case SettingPage.routeName:
                return const SettingPage();
              case MainPage.routeName:
              default:
                return const MainPage();
            }
          },
        );
      },
    );
  }
}
