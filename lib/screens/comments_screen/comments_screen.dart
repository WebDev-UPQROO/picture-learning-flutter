import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/appbar/appbar_light.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const AppBarLight(title: 'Opina sobre la app'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.04,
            ),
            alignment: Alignment.center,
            height: size.width * 0.18,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: size.width * 0.04),
              itemBuilder: (_, index) {
                return IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.star_border_rounded,
                    size: size.width * 0.08,
                    color: Style.primary,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: size.height * 0.04),

          // Opition Box
          Gap04(
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Escribe tu opinion aquí',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                alignLabelWithHint: true,
                labelStyle: TextStyle(
                  color: Style.grey400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          Spacer(),
          Gap04(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}
