import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/widgets/app_bar/notif_dialog.dart';

// Home app bar
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          const Text(
            'What are you\ncooking today?',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          const Spacer(),
          // Notif button
          IconButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const NotifDialog();
                  });
            },
            style: IconButton.styleFrom(
              foregroundColor: Colors.yellow.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: Colors.white,
              fixedSize: const Size(55.0, 55.0),
            ),
            icon: const Icon(Iconsax.notification),
          ),
        ],
      ),
    );
  }
}
