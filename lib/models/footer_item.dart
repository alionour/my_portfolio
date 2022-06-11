import 'package:flutter/material.dart';

class FooterItem {
  final String iconPath;
  final String title;
  final List<ClickableText> clickables;

  FooterItem(
      {required this.iconPath, required this.title, required this.clickables});
}

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  ClickableText(this.text, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
      onTap: onTap,
    );
  }
}
