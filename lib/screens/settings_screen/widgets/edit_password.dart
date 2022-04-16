import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';

import '../cubit/settings_cubit.dart';

Future<dynamic> showDialogEditPassword(BuildContext context) {
  final _form = GlobalKey<FormState>();

  final TextEditingController password = TextEditingController();
  final TextEditingController newPassword = TextEditingController();

  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        titleTextStyle: TextStyle(
          color: Style.grey800,
          fontSize: Style.h4,
        ),
        contentTextStyle: TextStyle(color: Style.grey600),
        title: const Text('Contraseña'),
        content: SingleChildScrollView(
          child: Form(
            key: _form,
            child: ListBody(
              children: <Widget>[
                const Text('Contaseña'),
                const SizedBox(height: 20),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  validator: (text) {
                    return (!(text!.length >= 8))
                        ? "*Mínimo 8 caracteres"
                        : null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Contraseña antigua',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: newPassword,
                  obscureText: true,
                  validator: (text) {
                    return (!(text!.length >= 8))
                        ? "*Mínimo 8 caracteres"
                        : null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Contraseña nueva',
                  ),
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
              context.read<SettingsCubit>().putPassword(
                    password.text,
                    newPassword.text,
                  );
            },
          ),
        ],
      );
    },
  );
}
