import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/routes/routes_home.dart';
import 'package:picture_learning/utils/nullable.dart';
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
                        RoutesHome.credits,
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
}
