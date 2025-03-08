import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_app/core/shoes_model.dart';
import 'package:shoes_app/features/productDetails/product_details.dart';

class CustomCarrView extends StatefulWidget {
  ShoesModel model;
  VoidCallback? onTap;
  CustomCarrView({super.key, required this.model, this.onTap});

  @override
  State<CustomCarrView> createState() => _CustomCarrViewState();
}

class _CustomCarrViewState extends State<CustomCarrView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                model: widget.model,
              ),
            ));
      },
      child: Container(
        height: 240,
        width: 180,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.model.id + 1.toString(),
              child: Image.asset(
                widget.model.imageUrl,
                fit: BoxFit.contain,
                height: 140,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.category,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    widget.model.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "\$${widget.model.price}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => widget.onTap!(),
                  child: Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
