import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/services/BlocObserver.dart';
import 'package:in_egypt_admin_panel/core/services/Shared_preferences.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/core/utils/App_router.dart';
import 'package:in_egypt_admin_panel/firebase_options.dart';
import 'package:in_egypt_admin_panel/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    Hive.initFlutter(),
    Hive_Services.init(),
  ]);
  setup_Getit();
  Bloc.observer = Custom_Blocobserver();
  runApp(const InEgyptAdminPanel());
}

class InEgyptAdminPanel extends StatelessWidget {
  const InEgyptAdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: carioFontFamily,
        scaffoldBackgroundColor: Colors.white,
      ),
      locale: Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: App_router.router,
    );
  }
}
