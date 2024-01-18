import 'package:flutter/material.dart';

class NotifDialog extends StatelessWidget {
  const NotifDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
            left: 10.0,
            right: 5.0,
          ),
          child: Column(
            children: [
              Text(
                'More contents coming soon! >_- ',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
