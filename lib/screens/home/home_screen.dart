import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/screens/credits/credits_screen.dart';
import 'package:picture_learning/screens/home/screens/settings_screen/cubit/settings_cubit.dart';
import 'screens/index.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  int currentNavIndex = 0;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> currentScreen = [
      const MainScreen(),
      const CommentsScreen(),
      const CreditsScreen(),

      // Settings
      BlocProvider(
        create: (context) => SettingsCubit(
          context.read<LocalService>(),
        ),
        child: const SettingsConsumer(
          child: SettingsScreen(),
        ),
      )
    ];

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          currentIndex: widget.currentNavIndex,
          onTap: (index) {
            widget.currentNavIndex = index;
            setState(() {});
          },
          selectedFontSize: Style.textsm,
          showUnselectedLabels: false,
          unselectedFontSize: Style.textxs,
          unselectedItemColor: Style.grey600,
          selectedItemColor: Style.primary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 28,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.comment,
                size: 28,
              ),
              label: 'Comentarios',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_sharp,
                size: 28,
              ),
              label: 'Sobre Nosotros',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 28,
              ),
              label: 'Configuraciones',
            ),
          ],
        ),
      ),
      body: currentScreen[widget.currentNavIndex],
    );
  }
}
