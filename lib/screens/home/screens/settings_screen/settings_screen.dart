import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/appbar/appbar_light.dart';
import 'widgets/index.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        // Appbar dark
        const AppBarLight(title: 'Comentarios'),

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
                  const SettingsTile(
                    title: 'Correo electrónico',
                    subtitle: 'hiram@gmail.com',
                  ),
                  SettingsTile(
                    title: 'Nombre de usuario',
                    subtitle: 'hiram',
                    action: const SettingsTileEdit(),
                    onPressed: () {
                      showDialogEditUserName(
                        context,
                        () {},
                      );
                    },
                  ),
                  SettingsTile(
                    title: 'Contraseña',
                    subtitle: '********',
                    action: const SettingsTileEdit(),
                    onPressed: () {
                      showDialogEditPassword(
                        context,
                        () {},
                      );
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
                    value: true,
                    onChange: (value) {},
                  ),
                  SettingsTileSwitch(
                    title: 'Efectos de sonido',
                    subtitle: 'Habilitar/Deshbilitar efectos de sonido',
                    value: true,
                    onChange: (value) {},
                  ),
                ],
              ),

              // About us
              // SettingsSection(
              //   title: 'Acerca de nosotros',
              //   options: [
              //     SettingsTile(
              //       title: 'Créditos',
              //       subtitle: 'Mas iformación acerca del equipo de desarollo',
              //       onPressed: () {
              //         Navigator.pushNamed(context, Routes.credits);
              //       },
              //     ),
              //   ],
              // ),

              // Close
              Padding(
                padding: const EdgeInsets.all(20),
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Style.danger,
                    side: BorderSide(color: Style.danger),
                  ),
                  onPressed: () {},
                  child: const Text('Cerrar Sesión'),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<dynamic> showDialogEditUserName(
    BuildContext context,
    Function() onPressed,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
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
                onPressed();
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> showDialogEditPassword(
    BuildContext context,
    Function() onPressed,
  ) {
    final _form = GlobalKey<FormState>();

    final TextEditingController password1 = TextEditingController();
    final TextEditingController password2 = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
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
                  const Text('Cambiar contaseña'),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: password1,
                    obscureText: true,
                    validator: (text) {
                      return (!(text!.length > 8))
                          ? "*Mínimo 8 caracteres"
                          : null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Contraseña nueva',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: password2,
                    obscureText: true,
                    validator: (text) {
                      return (password1.text != text)
                          ? "*Las contraseñas no coinciden"
                          : null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Confirmar contraseña',
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
                onPressed();
              },
            ),
          ],
        );
      },
    );
  }
}
