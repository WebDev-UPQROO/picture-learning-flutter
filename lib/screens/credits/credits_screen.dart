import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/appbar/appbar_light.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<Names> names = [
      Names(
        name: 'Erick Espinoza Canche',
        github: 'github.com/ErickEsp117',
      ),
      Names(
        name: 'Hiram Ordoñez Olvera',
        github: 'github.com/HiramOrd',
      ),
      Names(
        name: 'Katherine Sarahid González Ramírez',
        github: 'github.com/katleeni',
      ),
      Names(
        name: 'Luis Fernando López Romo',
        github: 'github.com/Romo43',
      ),
      Names(
        name: 'Miguel Oswaldo Moo Ake',
        github: 'github.com/Valdo227',
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
                  subtitle: names[index].github,
      
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
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: _launchURL,
    );
  }

  void _launchURL() async {
    if (!await launch('https://'+ subtitle)) throw 'Could not launch $subtitle';
  }
}

class Names {
  String name;
  String github;

  Names({required this.name, required this.github});
}
