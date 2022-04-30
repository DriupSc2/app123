import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:killa/icons.dart';

class SvgAsset extends StatelessWidget {
  final AssetName assetName;
  final double height;
  final double width;

  const SvgAsset(
      {Key? key, required this.assetName, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        SvgAssets().assets[assetName]!,
      ),
    );
  }
}