import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/core/app_constants.dart';
import 'package:shoes_app/core/data.dart';
import 'package:shoes_app/core/shoes_model.dart';
import 'package:shoes_app/core/snakeBar.dart';
import 'package:shoes_app/features/bottom_app_bar/bottom_app_bar.dart';
import 'package:shoes_app/features/cart/cart_screen.dart';
import 'package:shoes_app/features/home/provider/home_provider.dart';
import 'package:shoes_app/features/productDetails/widgets/size_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  ShoesModel? model;
  ProductDetailsScreen({super.key, required this.model});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    final model = widget.model!;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 4,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.06,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                            child: Center(
                              child: Icon(
                                IconlyLight.arrow_left,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          AppConstants.appLogo,
                          height: 60,
                          width: 120,
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                          child: Center(
                            child: Icon(
                              IconlyLight.heart,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            left: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(model.category,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.25,
                                child: Image.asset(
                                  model.imageUrl,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text("Men's Shoe",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.withAlpha(700))),
                        Spacer(),
                        Icon(IconlyLight.star, color: Colors.orange, size: 20),
                        Text("(4.5)",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.withAlpha(700))),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(model.name,
                                  style: GoogleFonts.poppins(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                          Text("\$${model.price}",
                              style: GoogleFonts.poppins(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text("Available Sizes",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AvailableSizeView(
                          size: model.availableSizes[index],
                          isSelected: selectedSize == index,
                          onTap: () {
                            setState(() {
                              selectedSize = index;
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      itemCount: model.availableSizes.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  // Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // children: model.availableSizes.map(
                  //   (e) => AvailableSizeView(size: e).toList(),
                  // ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.6,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience. The shoe's upper features lightweight, layered materials for a modern aesthetic that stands out. The foam midsole feels soft and springy. The 270 Max Air unit provides unrivaled, all-day comfort. The shoe's upper features lightweight, layered no-sew materials for a modern look that's durable and comfortable. The foam midsole feels soft and springy. The 270 Max Air unit provides unrivaled, all-day comfort. The shoe's upper features lightweight, layered no-sew materials for a modern look that's durable and comfortable.",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Delivery Information",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Free Delivery",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                      TextSpan(
                          text: " by",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                      TextSpan(
                          text: " 18 March",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Or Faster delivery Tomorrow 6am - 10 pm.",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                      // TextSpan(
                      //     text: " .If you order within 2 hrs 45 mins",
                      //     style: TextStyle(
                      //         fontSize: 10,
                      //         fontWeight: FontWeight.w400,
                      //         color: Colors.black)),
                    ])),
                    Row(
                      children: [
                        Icon(IconlyLight.location,
                            color: Colors.black, size: 14),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "New Delhi, India",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(80),
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Eg. 110011",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 16,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(600),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Text(
                            "Gift for Someone Special",
                            style: TextStyle(
                                color: Colors.red,
                                shadows: [
                                  Shadow(color: Colors.red, blurRadius: 20)
                                ],
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            IconlyLight.heart,
                            color: Colors.red,
                            size: 20,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        int index = sampleShoeList
                            .indexWhere((element) => element.id == model.id);

                        if (index == -1) {
                          showSnakeBar(context, "Alreadt Added", Colors.red);
                          return;
                        }
                        Provider.of<HomeProvider>(context, listen: false)
                            .addShoes(sampleShoeList[index]);
                        sampleShoeList.removeAt(index);
                        // showSnakeBar(context, "Added to Cart", Colors.black);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            "Added to Cart",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          action: SnackBarAction(
                            label: "View Cart",
                            textColor: Colors.white,
                            backgroundColor: Colors.black,
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return CartScreen();
                                },
                              ));
                            },
                          ),
                        ));

                        setState(() {});
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(600),
                        ),
                        child: Center(
                          child: Text("Add to Cart",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
