import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/utils/null_helper.dart';
import 'package:picture_learning/widgets/appbar/appbar_light.dart';
import 'cubit/settings_cubit.dart';
import 'widgets/index.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SettingsCubit>().state;
    final read = context.read<SettingsCubit>();
    Size size = MediaQuery.of(context).size;

    final user = watch.user;

    return Scaffold(
      appBar: const AppBarLight(title: 'Configuraciones'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
              ),
              children: [
                // Account
                SettingsSection(
                  title: 'Cuenta',
                  options: [
                    SettingsTile(
                      title: 'Correo electrónico',
                      subtitle: getString(user?.email),
                    ),
                    SettingsTile(
                      title: 'Nombre de usuario',
                      subtitle: getString(user?.username),
                      action: const SettingsTileEdit(),
                      onPressed: () {
                        showDialogEditUserName(context);
                      },
                    ),
                    SettingsTile(
                      title: 'Contraseña',
                      subtitle: '********',
                      action: const SettingsTileEdit(),
                      onPressed: () {
                        showDialogEditPassword(context);
                      },
                    ),
                  ],
                ),

                // Music
                SettingsSection(
                  title: 'Audio',
                  options: [
                    SettingsTileSwitch(
                      title: 'Música de fondo',
                      subtitle: 'Habilitar/Deshbilitar música de fondo',
                      value: watch.music,
                      onChange: (value) => read.putMusic(value),
                    ),
                    SettingsTileSwitch(
                      title: 'Efectos de sonido',
                      subtitle: 'Habilitar/Deshbilitar efectos de sonido',
                      value: watch.effects,
                      onChange: (value) => read.putEffects(value),
                    ),
                  ],
                ),

                // About us
                SettingsSection(
                  title: 'Acerca de nosotros',
                  options: [
                    SettingsTile(
                      title: 'Créditos',
                      subtitle: 'Mas iformación acerca del equipo de desarollo',
                      onPressed: () => Navigator.pushNamed(
                        context,
                        Routes.credits,
                      ),
                    ),
                  ],
                ),

                // Close
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Style.danger,
                      side: BorderSide(color: Style.danger),
                    ),
                    onPressed: () => read.logout(),
                    child: const Text('Cerrar Sesión'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

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
                      return (!(text!.length > 5))
                          ? "*Campo obligatorio"
                          : null;
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
}
