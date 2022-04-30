import 'package:flutter/material.dart';

class ButtonPrincipal extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final double? height;
  final double? width;
  final Widget? vectorBottom;
  final Widget? vectorTop;
  final double? borderRadius;
  final Widget? icon;
  final Function? onTap;
  const ButtonPrincipal({Key? key, this.title, this.subtitle, this.gradientStartColor, this.gradientEndColor, this.height, this.width, this.vectorBottom, this.vectorTop, this.borderRadius, this.icon, this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => onTap!(),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 75,
              width: 320,
            ),
            SizedBox(
              height: 75,
              width: 320,
              child: Padding(
                padding: EdgeInsets.only(left: 0, top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
