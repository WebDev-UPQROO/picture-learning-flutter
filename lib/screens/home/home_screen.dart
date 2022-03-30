import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/screens/home/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  int currentNavIndex = 0;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = context.watch<HomeProvider>().user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.white,
        foregroundColor: Style.grey600,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/diamond.png'),
                  SizedBox(width: 10),
                  Text('1'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: VerticalDivider(),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/crown.png'),
                  SizedBox(width: 10),
                  Text('2'),
                ],
              ),
            ),
          ],
        ),
      ),
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
          items: [
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
                Icons.settings,
                size: 28,
              ),
              label: 'Configuraciones',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.02,
            ),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  color: Style.primary,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Image.asset('assets/img/card_icon.png'),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 50,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Level 1',
                                      style: TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Divider(
                                        height: 12,
                                        color: Colors.white60,
                                      ),
                                    ),
                                    Text(
                                      'Begginer',
                                      style: TextStyle(
                                        color: Style.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Style.h4,
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    Image.asset(
                                      'assets/icons/diamond.png',
                                      // color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (false)
                        Positioned.fill(
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.white70,
                            child: Icon(
                              Icons.lock,
                              color: Colors.black26,
                              size: 50,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
