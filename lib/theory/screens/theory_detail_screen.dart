import 'package:flutter/material.dart';

import 'package:Tornado/theory/widgets/theory_detail_item.dart';
import 'package:get/get.dart';

class TheoryDetailScreen extends StatelessWidget {
  static const routeName = '/theory_detail_screen';
  final String title = Get.arguments['title'];
  final List<TheoryDetailItem> dataArray = Get.arguments['dataArray'];

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final String title = routeArg['title'];
    final List<TheoryDetailItem> dataArray = routeArg['dataArray'];
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(fit: BoxFit.fitWidth, child: Text(title)),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            children: dataArray,
          ),
        ),
      ),
    );
  }
}
