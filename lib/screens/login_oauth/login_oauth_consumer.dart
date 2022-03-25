import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';
import 'package:provider/provider.dart';
import 'login_oauth_provider.dart';

class LoginOAuthConsumer extends StatefulWidget {
  const LoginOAuthConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<LoginOAuthConsumer> createState() => _LoginOAuthConsumerState();
}

class _LoginOAuthConsumerState extends State<LoginOAuthConsumer> {
  late LoginOAuthProvider notifier;

  void listener() {
    // Se analiza el Status de la pantalla y se retroalimenta la UI
    switch (notifier.status) {
      case Status.loading:
        const snackBar = SnackBar(content: Text('Loading'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;

      case Status.loaded:
        showAboutDialog(context: context);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();

    // Se agrega el listener al Provider
    notifier = context.read<LoginOAuthProvider>();
    notifier.addListener(listener);

    // Se ejecutan eventos antes de cargar la pantalla
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifier.increment();
    });
  }

  @override
  void dispose() {
    // Se elimina el listener
    notifier.removeListener(listener);
    super.dispose();
  }
}
