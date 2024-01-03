import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/widgets/notif_dialog.dart';

class AppBarCustom extends StatefulWidget {
  final String titre;
  const AppBarCustom({
    super.key,
    required this.titre,
  });

  @override
  State<AppBarCustom> createState() => _QuickScreenAppBarState();
}

class _QuickScreenAppBarState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: Size(55.0, 55.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(15),
            ),
          ),
          color: Colors.black,
          icon: Icon(CupertinoIcons.chevron_back),
        ),
        Spacer(),
        Text(
          widget.titre,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return NotifDialog();
                });
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: Size(55.0, 55.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(15),
            ),
          ),
          color: Colors.black,
          icon: Icon(Iconsax.notification),
        ),
      ],
    );
  }
}
