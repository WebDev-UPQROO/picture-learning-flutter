// Model to display any errors or alerts in the UI
abstract class MessageUI {
  String description;
  MessageUI(this.description);
}

class MessageDefault extends MessageUI {
  MessageDefault(String message) : super(message);
}

class MessageSuccess extends MessageUI {
  MessageSuccess(String message) : super(message);
}
