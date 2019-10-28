enum NotifyType { shipment, arrival, discount, deal }

class AppNotification {
  String content, date;
  bool isRead;
  NotifyType notifyType;

  AppNotification({this.content, this.date, this.isRead, this.notifyType});
}

List<AppNotification> notifications = [
  AppNotification(
    content: "Super Store marked your order #6363653 as shipped",
    date: "9:20 AM",
    isRead: false,
    notifyType: NotifyType.shipment,
  ),
  AppNotification(
    content: "Package from your order #637553553 arrived at the destination country",
    date: "Yesterday",
    isRead: true,
    notifyType: NotifyType.arrival,
  ),
  AppNotification(
    content: "50% OFF of everything at the Best Store",
    date: "15 Oct",
    isRead: true,
    notifyType: NotifyType.discount,
  ),
  AppNotification(
    content: "BOGO Sale Starting tomorrow, do not forget to check it out for great deals",
    date: "20 Sept",
    isRead: true,
    notifyType: NotifyType.deal,
  ),
];
