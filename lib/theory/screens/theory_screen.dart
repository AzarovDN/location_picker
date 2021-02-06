import 'dart:io';
// import 'package:Tornado/auth/controllers/auth_controller.dart';
// import 'package:Tornado/auth/controllers/profile_controller.dart';
// import 'package:Tornado/for_developed/state_screen.dart';
import 'package:flutter/material.dart';
import 'package:Tornado/theory/widgets/theory_item.dart';
import 'package:get/get.dart';
import '../helpers/about_us-data.dart';
import '../helpers/principles_data.dart';
import '../helpers/history_data.dart';
import 'package:flutter_places/flutter_places.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TheoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ТЕОРИЯ'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TheoryItem('О тхэквондо', 'assets/images/theory_screen/logotip.png',
              aboutUsData),
          TheoryItem('Принципы боевых искусств',
              'assets/images/theory_screen/FTR.png', principlesData),
          TheoryItem('История боевых искусств',
              'assets/images/theory_screen/GTF.png', historyData)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.map),
          onPressed: () async {
            final apiKey = 'API_KEY';

            LocationResult result = await showLocationPicker(context, apiKey);
            print(result.toString());
          }),
    );
  }
}
