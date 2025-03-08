import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/core/empty_widget.dart';
import 'package:shoes_app/core/shoes_model.dart';
import 'package:shoes_app/features/cart/widget/cart_card_widget.dart';
import 'package:shoes_app/features/home/provider/home_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool notificationEnable = false;
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
            height: height * 0.12,
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
                        "Notifications",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "Clear",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )
                    ],
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
          TweenAnimationBuilder(
            tween: Tween<double>(
                begin: MediaQuery.of(context).size.height * 0.1, end: 0),
            duration: Duration(milliseconds: 250),
            builder: (BuildContext context, double value, Widget? child) =>
                AnimatedContainer(
              height: notificationEnable
                  ? value
                  : MediaQuery.of(context).size.height * 0.1,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              duration: Duration(milliseconds: 250),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          "Enable Notification",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          "Get notified when new\nshoes are available",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.grey.withAlpha(160),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  FittedBox(
                    child: CupertinoSwitch(
                      value: notificationEnable,
                      onChanged: (value) {
                        notificationEnable = !notificationEnable;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
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
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
