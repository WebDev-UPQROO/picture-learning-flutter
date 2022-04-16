import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import '../cubit/settings_cubit.dart';

Future<dynamic> showDialogEditUserName(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) {
      final _form = GlobalKey<FormState>();
      final TextEditingController username = TextEditingController();

      return AlertDialog(
        titleTextStyle: TextStyle(
          color: Style.grey800,
          fontSize: Style.h4,
        ),
        contentTextStyle: TextStyle(color: Style.grey600),
        title: const Text('Nombre de usuario'),
        content: SingleChildScrollView(
          child: Form(
            key: _form,
            child: ListBody(
              children: <Widget>[
                const Text('Cambiar nombre de usuario'),
                const SizedBox(height: 20),
                TextFormField(
                  controller: username,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de usuario',
                  ),
                  validator: (text) {
                    return (!(text!.length > 5)) ? "*Campo obligatorio" : null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () {
              final isValid = _form.currentState!.validate();
              if (!isValid) {
                return;
              }
              context.read<SettingsCubit>().putUsername(username.text);
            },
          ),
        ],
      );
    },
  );
}
