import 'package:flutter/material.dart';

// Model to display any errors or alerts in the UI
abstract class MessageUI {
  String title;
  String description;
  IconData icon;

  MessageUI(
    this.title,
    this.description,
    this.icon,
  );
}

class MessageDefault extends MessageUI {
  MessageDefault({
    String title = '',
    required String message,
    IconData icon = Icons.info_outline,
  }) : super(
          title,
          message,
          icon,
        );
}

class MessageSuccess extends MessageUI {
  MessageSuccess({
    String title = '',
    required String message,
  }) : super(
          title,
          message,
          Icons.done,
        );
}
