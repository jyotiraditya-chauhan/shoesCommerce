
// Sample notification data
import 'package:shoes_app/core/models/notification_model.dart';

List<NotificationModel> getSampleNotifications() {
  return [
    NotificationModel(
      id: '1',
      title: 'New Nike Air Jordans Arrived!',
      message: 'Check out the latest Air Jordan collection now available for purchase.',
      imageUrl: 'assets/images/1.png',
      time: DateTime.now().subtract(Duration(minutes: 5)),
      type: NotificationType.newArrival,
      isRead: false,
    ),
    NotificationModel(
      id: '2',
      title: 'Price Drop Alert',
      message: 'Nike Air Max is now 30% off! Limited time offer.',
      imageUrl: 'assets/images/2.png',
      time: DateTime.now().subtract(Duration(hours: 2)),
      type: NotificationType.priceDropped,
      isRead: false,
    ),
    NotificationModel(
      id: '3',
      title: 'Your Order is Delivered',
      message: 'Your order #NKE10254 has been delivered. Rate your experience!',
      imageUrl: 'assets/images/3.png',
      time: DateTime.now().subtract(Duration(days: 1)),
      type: NotificationType.orderUpdate,
      isRead: true,
    ),
    NotificationModel(
      id: '4',
      title: 'Back in Stock',
      message: 'The Adidas Ultraboost is now back in stock. Get it before it sells out again!',
      imageUrl: 'assets/images/4.png',
      time: DateTime.now().subtract(Duration(days: 2)),
      type: NotificationType.backInStock,
      isRead: true,
    ),
    NotificationModel(
      id: '5',
      title: 'Flash Sale Weekend',
      message: 'Get up to 50% off on selected items this weekend only!',
      imageUrl: 'assets/images/5.png',
      time: DateTime.now().subtract(Duration(days: 3)),
      type: NotificationType.promotion,
      isRead: true,
    ),
  ];
}