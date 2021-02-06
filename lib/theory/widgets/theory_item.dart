import 'package:flutter/material.dart';

import 'package:Tornado/theory/screens/theory_detail_screen.dart';
import 'package:Tornado/theory/widgets/theory_detail_item.dart';
import 'package:get/get.dart';

class TheoryItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<TheoryDetailItem> dataArray;

  TheoryItem(this.title, this.imagePath, this.dataArray);

  void _selectedItem(BuildContext ctx) {
    Get.toNamed(
      TheoryDetailScreen.routeName,
      arguments: {
        'title': title,
        'dataArray': dataArray,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () => _selectedItem(context),
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(imagePath),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
