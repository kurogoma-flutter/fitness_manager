import 'package:flutter/material.dart';

import '../../component/color/color_theme.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    required this.label,
    required this.onTap,
    super.key,
  });

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: ColorTheme.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorTheme.primaryIcon,
                )
              ],
            ),
            Divider(
              color: ColorTheme.primaryIcon,
            ),
          ],
        ),
      ),
    );
  }
}
