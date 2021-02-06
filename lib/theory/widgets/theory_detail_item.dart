import 'package:flutter/material.dart';

class TheoryDetailItem extends StatelessWidget {
  final String text;
  final String imagePath;
  final String imageDescription;

  TheoryDetailItem({
    this.text = '',
    this.imagePath = '',
    this.imageDescription = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          if (text != '') Text(text),
          if (imagePath != '')
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Image.asset(
                imagePath,
                width: double.infinity,
              ),
            ),
          if (imageDescription != '')
            Text(
              imageDescription,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
