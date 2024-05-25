import 'package:flutter/material.dart';

class MyCategory extends StatelessWidget {
  final String IconPath;
  final void Function()? onTap;
 final String title;

  const MyCategory(
      {super.key,
      required this.IconPath,
      required this.onTap,
      required this.title
      });

final double VerticalPadding=25;
final double HorizontalGap=20;
final double IconSize = 22;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: VerticalPadding,
      horizontalTitleGap: HorizontalGap,
      contentPadding: EdgeInsets.only(left: 40),
      onTap: onTap,
      title: Text(title),
      leading: SizedBox(
        height: IconSize,
        child: Image.asset(IconPath),
      ),
    );
  }
}
