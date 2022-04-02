import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/screens/home/home_provider.dart';
import 'package:picture_learning/utils/null_helper.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = context.watch<HomeProvider>().user;

    return SafeArea(
      child: Column(
        children: [
          // Home Appbar
          AppBar(
            backgroundColor: Style.white,
            foregroundColor: Style.grey600,
            toolbarHeight: 70,
            elevation: 1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/diamond.png'),
                      SizedBox(width: 10),
                      Text(getString(user?.perfectFields?.length)),
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
                      Text(getString(user?.perfectLevels?.length)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Container
          SizedBox(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
        ],
      ),
    );
  }
}
