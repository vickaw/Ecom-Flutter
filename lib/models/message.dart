class Message {
  int unread;
  String name, time, content;
  Message({this.name, this.time, this.unread, this.content});
}

List<Message> messages = [
  Message(
    name: "Smiley Store",
    time: "9:20 AM",
    unread: 5,
    content: "Hello, please come and pick up your order. It is long overdue 😅."
  ),
  Message(
    name: "Beauty Store",
    time: "8:10 AM",
    unread: 0,
    content: "I did mention that i preferred the blue lipstick."
  ),
  Message(
    name: "LoveLee Bees",
    time: "Yesterday",
    unread: 0,
    content: "Deliver the item to the location i sent to you last time. Thank you."
  ),
  Message(
    name: "FNHS Boutique",
    time: "15 Sept",
    unread: 0,
    content: "Did you get the gift basket i sent you?"
  ),
  Message(
    name: "Anna's Corner",
    time: "11 Aug",
    unread: 0,
    content: "Thanks for the bag. I ❤️ it"
  ),
];
