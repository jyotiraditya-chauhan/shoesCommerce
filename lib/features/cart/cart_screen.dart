import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/core/empty_widget.dart';
import 'package:shoes_app/core/shoes_model.dart';
import 'package:shoes_app/features/cart/widget/cart_card_widget.dart';
import 'package:shoes_app/features/home/provider/home_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ShoesModel> seletecdShoes = [];
  TextEditingController searchController = TextEditingController();
  bool isShaken = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 4,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: height * 0.22,
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
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Cart",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!isShaken) {
                            isShaken = true;
                            setState(() {});
                          } else {
                            if (seletecdShoes.isNotEmpty) {
                              Provider.of<HomeProvider>(context, listen: false)
                                  .seletecdShoes
                                  .removeWhere((element) {
                                return seletecdShoes.contains(element);
                              });
                              isShaken = false;
                              setState(() {});
                            } else {
                              isShaken = !isShaken;
                            }
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                          child: Center(
                            child: Icon(
                              isShaken ? Icons.close : IconlyLight.delete,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          IconlyLight.search,
                          color: Colors.grey.shade500,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: width * 0.7,
                          child: TextFormField(
                            controller: searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search for your favorite shoes...",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 16,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                seletecdShoes = Provider.of<HomeProvider>(
                                        context,
                                        listen: false)
                                    .seletecdShoes
                                    .where((element) => element.name
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              } else {
                                // seletecdShoes.addAll(Provider.of<HomeProvider>(
                                //         context,
                                //         listen: false)
                                //     .seletecdShoes);
                              }
                              setState(() {});
                            },
                          ),
                        ),
                      ],
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
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: MediaQuery.sizeOf(context).height * 0.65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Provider.of<HomeProvider>(context, listen: false)
                    .seletecdShoes
                    .isEmpty
                ? EmptyWidget(
                    svgImage: "assets/icons/empty_shoes.svg",
                    message: "No Shoes Found",
                    description: "Please add some shoes to cart",
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.vertical,
                    itemCount: Provider.of<HomeProvider>(context, listen: false)
                        .seletecdShoes
                        .length,
                    itemBuilder: (context, index) {
                      var data =
                          Provider.of<HomeProvider>(context, listen: false)
                              .seletecdShoes[index];

                      // if (Provider.of<HomeProvider>(context, listen: false)
                      //     .seletecdShoes
                      //     .isEmpty) {
                      //   return EmptyWidget(
                      //     svgImage: "assets/icons/empty_shoes.svg",
                      //     message: "No Shoes Found",
                      //     description: "Please add some shoes to cart",
                      //   );
                      // }
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: CartCardWidget(
                          onTap: () {
                            if (!isShaken) return;
                            if (seletecdShoes.contains(data)) {
                              seletecdShoes.remove(data);
                            } else {
                              seletecdShoes.add(data);
                            }
                            setState(() {});
                          },
                          isShaken:
                              isShaken == true && seletecdShoes.contains(data),
                          model:
                              Provider.of<HomeProvider>(context, listen: false)
                                  .seletecdShoes[index],
                          isSelected: seletecdShoes.contains(data),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
