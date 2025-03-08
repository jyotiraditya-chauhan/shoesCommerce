import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/features/cart/cart_screen.dart';
import 'package:shoes_app/features/home/home_screen.dart';
import 'package:shoes_app/features/home/provider/home_provider.dart';
import 'package:shoes_app/features/notification/notification.dart';
import 'package:shoes_app/features/profile/profile_screen.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({super.key});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const CartScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  final List<IconData> iconList = [
    IconlyLight.home,
    IconlyLight.bag,
    IconlyLight.notification,
    IconlyLight.profile,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: pages[currentIndex]),
          Positioned(
            bottom: -2,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.08,
              margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: iconList.length,
                itemBuilder: (context, index) {
                  var data = iconList[index];
                  return CupertinoButton(
                    sizeStyle: CupertinoButtonSize.large,
                    minSize: 100,
                    // color: Colors.red,
                    onPressed: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: index == 1
                        ? Provider.of<HomeProvider>(context)
                                .seletecdShoes
                                .isNotEmpty
                            ? Stack(
                                children: [
                                  Positioned(
                                      child: Icon(data,
                                          color: Colors.black, size: 28)),
                                  Positioned(
                                    right: 0,
                                    top: -0,
                                    child: Hero(
                                      tag: int.parse(Provider.of<HomeProvider>(
                                                  context,
                                                  listen: false)
                                              .seletecdShoes
                                              .last
                                              .id) +
                                          1,
                                      // tag: Provider.of<HomeProvider>(context)
                                      // .seletecdShoes
                                      // .last
                                      // .id,
                                      child: Container(
                                        height: 16,
                                        width: 16,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                        child: Center(
                                          child: Text(
                                            Provider.of<HomeProvider>(context)
                                                .seletecdShoes
                                                .length
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Icon(
                                data,
                                color: Colors.black,
                                size: 28,
                              )
                        : Icon(
                            data,
                            color: Colors.black,
                            size: 28,
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ), // Display the current screen
    );
  }
}
