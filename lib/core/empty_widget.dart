// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class EmptyWidget extends StatefulWidget {
  String svgImage;
  String message;
  String? description;
  EmptyWidget({
    super.key,
    required this.svgImage,
    required this.message,
    this.description,
  });

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.svgImage,
              width: 120,
              height: 120,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.message,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            if (widget.description != null)
              Text(
                widget.description ?? '',
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.withAlpha(120),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
