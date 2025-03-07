import 'package:flutter/material.dart';

class ShoesBannerComponentsView extends StatefulWidget {
  String image;
  bool? isSelected;
  VoidCallback? onTap;
  ShoesBannerComponentsView(
      {super.key, required this.image, this.isSelected, this.onTap});

  @override
  State<ShoesBannerComponentsView> createState() =>
      _ShoesBannerComponentsViewState();
}

class _ShoesBannerComponentsViewState extends State<ShoesBannerComponentsView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 90,
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
            color:
                widget.isSelected ?? false ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          widget.image,
          color: widget.isSelected ?? false ? Colors.white : Colors.black,
          // width: getImageWidth(),
          // width: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
