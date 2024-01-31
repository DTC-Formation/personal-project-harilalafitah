import 'package:flutter/material.dart';

// App bar widget
class AppBarCustom extends StatefulWidget {
  final String titre;
  final Icon icon1;
  final Function onPressed1;
  final Icon icon2;
  final Function onPressed2;
  const AppBarCustom({
    super.key,
    required this.titre,
    required this.icon2,
    required this.icon1,
    required this.onPressed1,
    required this.onPressed2,
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
            widget.onPressed1();
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: const Size(55.0, 55.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(15),
            ),
          ),
          icon: widget.icon1,
        ),
        const Spacer(),
        Text(
          widget.titre,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            widget.onPressed2();
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: const Size(55.0, 55.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(15),
            ),
          ),
          icon: widget.icon2,
        ),
      ],
    );
  }
}
