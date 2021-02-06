// import 'package:Tornado/cabinets/screens/trainer_cabinet/add_edit_group_screen.dart';
// import 'package:Tornado/cabinets/screens/trainer_cabinet/trainer_groups_screen.dart';
// import 'package:Tornado/cabinets/screens/user_cabinet/edit_profile_screen.dart';
// import 'package:Tornado/cabinets/screens/trainer_cabinet/trainer_students_screen.dart';
// import 'package:Tornado/certification/controllers/belt_controller.dart';
// import 'package:Tornado/certification/controllers/load_video_controllers.dart';
// import 'package:Tornado/certification/screens/belt_screen.dart';
// import 'package:Tornado/certification/screens/book_view_screen.dart';
// import 'package:Tornado/certification/screens/choose_belt_screen.dart';
// import 'package:Tornado/event/providers/event_provider.dart';
// import 'package:Tornado/for_developed/loading_screen.dart';
// import 'package:Tornado/purchase/screens/purchase_screen.dart';
// import 'package:Tornado/for_developed/state_controller.dart';
import 'package:Tornado/theory/screens/theory_screen.dart';
// import 'package:Tornado/utils/authBinding.dart';
// import 'package:Tornado/utils/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

// import 'package:Tornado/tabs_screen.dart';
// import 'package:Tornado/auth/screens/auth_screen.dart';
import 'package:Tornado/theory/screens/theory_detail_screen.dart';
// import 'package:Tornado/certification/helpers/db.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:Tornado/purchase/controllers/purchase_controller.dart';

// import 'auth/controllers/profile_controller.dart';

import 'package:google_map_location_picker/generated/l10n.dart'
    as location_picker;
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // await Firebase.initializeApp();
    // Get.put(StateController());
    await GetStorage.init();
    // await DB.init();
  } catch (err) {
    print('err $err');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        location_picker.S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
      ],
      theme: ThemeData(
        accentColorBrightness: Brightness.dark,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline5: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              headline6: TextStyle(
                fontSize: 16,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          minWidth: double.infinity,
          height: 44,
          buttonColor: Colors.black,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: TheoryScreen(),
    );
  }
}
