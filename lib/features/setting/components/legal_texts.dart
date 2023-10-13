import 'package:flutter/material.dart';

import '../../component/color/color_theme.dart';

class PrimaryLegalText extends StatelessWidget {
  const PrimaryLegalText({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 16,
        right: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: ColorTheme.primaryText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SecondaryLegalText extends StatelessWidget {
  const SecondaryLegalText({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 32,
        right: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: ColorTheme.primaryText,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class TertiaryLegalText extends StatelessWidget {
  const TertiaryLegalText({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 48,
        right: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: ColorTheme.primaryText,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
