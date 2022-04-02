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
                    onPressed: () {},
                  ),
                  SettingsTile(
                    title: 'Contraseña',
                    subtitle: '********',
                    action: const SettingsTileEdit(),
                    onPressed: () {},
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
              SettingsSection(
                title: 'Acerca de nosotros',
                options: [
                  SettingsTile(
                    title: 'Créditos',
                    subtitle: 'Mas iformación acerca del equipo de desarollo',
                    onPressed: () {},
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
}
