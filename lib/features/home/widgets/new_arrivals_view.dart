import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_app/core/shoes_model.dart';
import 'package:shoes_app/features/productDetails/product_details.dart';

class NewArrivalsView extends StatefulWidget {
  ShoesModel model;

  NewArrivalsView({super.key, required this.model});

  @override
  State<NewArrivalsView> createState() => _NewArrivalsViewState();
}

class _NewArrivalsViewState extends State<NewArrivalsView> {
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
        height: 140,
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.4,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade500,
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.model.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "\$${widget.model.price}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Image.asset(
              widget.model.imageUrl,
              fit: BoxFit.contain,
              height: 100,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
