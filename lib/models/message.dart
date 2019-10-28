class Message {
  int unread;
  String name, time;
  String content =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";

  Message({this.name, this.time, this.unread});
}

List<Message> messages = [
  Message(
    name: "Smiley Store",
    time: "9:20 AM",
    unread: 5,
  ),
  Message(
    name: "Beauty Supply Store",
    time: "8:10 AM",
    unread: 0,
  ),
  Message(
    name: "LoveLee Bees",
    time: "Yesterday",
    unread: 0,
  ),
  Message(
    name: "FNHS Boutique",
    time: "15 Sept",
    unread: 0,
  ),
  Message(
    name: "Anna's Corner",
    time: "11 Aug",
    unread: 0,
  ),
];
