import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableSizeView extends StatelessWidget {
  String size;
  bool isSelected;
  VoidCallback? onTap;
  AvailableSizeView(
      {super.key, required this.size, required this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        duration: Duration(milliseconds: 300),
        child: Center(
          child: Text(
            size,
            style: GoogleFonts.poppins(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
