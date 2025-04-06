import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String imageUrl;
  final DateTime time;
  final NotificationType type;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.imageUrl,
    required this.time,
    required this.type,
    this.isRead = false,
  });
}

enum NotificationType {
  newArrival,
  priceDropped,
  backInStock,
  orderUpdate,
  promotion
}
