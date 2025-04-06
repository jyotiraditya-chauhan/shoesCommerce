import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shoes_app/core/data/notification_sampleData.dart';
import 'package:shoes_app/core/empty_widget.dart';
import 'package:shoes_app/core/models/notification_model.dart';
import 'package:shoes_app/features/notification/widget.dart';
// Import the notification card - make sure to create this file

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool notificationEnable = false;
  late List<NotificationModel> notifications;

  @override
  void initState() {
    super.initState();
    // Initialize with sample notifications
    notifications = getSampleNotifications();
  }

  void _markAsRead(String notificationId) {
    setState(() {
      final index = notifications.indexWhere((n) => n.id == notificationId);
      if (index != -1) {
        final updatedNotification = NotificationModel(
          id: notifications[index].id,
          title: notifications[index].title,
          message: notifications[index].message,
          imageUrl: notifications[index].imageUrl,
          time: notifications[index].time,
          type: notifications[index].type,
          isRead: true,
        );
        notifications[index] = updatedNotification;
      }
    });
  }

  void _clearNotifications() {
    setState(() {
      notifications.clear();
    });
  }

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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: _clearNotifications,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            "Enable Notification",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "Get notified when new\nshoes are available",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
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
                          setState(() {
                            notificationEnable = value;
                          });
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
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: MediaQuery.sizeOf(context).height * 0.65,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: notifications.isEmpty
                ? EmptyWidget(
                    svgImage: "assets/icons/empty_bell.svg",
                    message: "No Notifications",
                    description: "You don't have any notifications yet",
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    scrollDirection: Axis.vertical,
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        notification: notifications[index],
                        onTap: () {
                          _markAsRead(notifications[index].id);
                          // Navigate to relevant screen based on notification type
                          // For example:
                          // if (notifications[index].type == NotificationType.newArrival) {
                          //   Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) => ProductDetailsScreen(model: relatedShoe),
                          //   ));
                          // }
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
