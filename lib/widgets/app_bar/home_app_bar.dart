import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/widgets/app_bar/notif_dialog.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'What are you\ncooking today?',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            height: 1,
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
            foregroundColor: Colors.yellow.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.white,
            fixedSize: Size(55.0, 55.0),
          ),
          icon: Icon(Iconsax.notification),
        ),
      ],
    );
  }
}
