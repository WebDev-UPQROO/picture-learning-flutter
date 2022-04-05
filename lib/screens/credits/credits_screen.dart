import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/appbar/appbar_light.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<Names> names = [
      Names(
        name: 'Erick Espinoza Canche',
        email: 'erickesp2077@gmail.com',
      ),
      Names(
        name: 'Hiram Ordoñez Olvera',
        email: 'hiram8012@gmail.com',
      ),
      Names(
        name: 'Katherine Sarahid González Ramírez',
        email: 'kathigonzales@hotmail.com',
      ),
      Names(
        name: 'Luis Fernando López Romo',
        email: 'lopezromo.fer43@gmail.com',
      ),
      Names(
        name: 'Miguel Oswaldo Moo Ake',
        email: 'moswaldomoo@gmail.com',
      ),
    ];

    return Scaffold(
      appBar: const AppBarLight(title: 'Sobre Nosotros'),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.04,
          horizontal: size.width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img/logo.png', width: 100),
            const Text('© Picture Learning 2022'),
            SizedBox(height: size.height * 0.04),
            ListView.builder(
              itemCount: names.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTileCredits(
                  title: names[index].name,
                  subtitle: names[index].email,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileCredits extends StatelessWidget {
  const ListTileCredits({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Style.grey600,
          fontSize: Style.textsm,
        ),
      ),
    );
  }
}

class Names {
  String name;
  String email;

  Names({required this.name, required this.email});
}
