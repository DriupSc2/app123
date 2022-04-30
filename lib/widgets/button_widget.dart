import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Widget icon;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.icon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(300,80),

    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: icon,
        ),
        const Padding(padding: EdgeInsets.all(16.0)),
        Text(text,
            style: const TextStyle(
              fontSize: 20,
            )
        ),
        const SizedBox()
      ],
    ),
    onPressed: onClicked,
  );
}
