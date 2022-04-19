import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/screens/comments_screen/cubit/comments_cubit.dart';
import 'package:picture_learning/widgets/appbar/appbar_light.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/text/index.dart';

class CommentsScreen extends StatefulWidget {
  CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();

  final TextEditingController controller = TextEditingController();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final watch = context.watch<CommentsCubit>().state;

    return Scaffold(
      appBar: const AppBarLight(title: 'Opina sobre la app'),
      body: Gap04(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextH3BoldPrimary(
              '¿Que te parece la app?',
              textAlign: TextAlign.center,
            ),

            Container(
              alignment: Alignment.center,
              height: 150,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: size.width * 0.04),
                itemBuilder: (_, index) {
                  return IconButton(
                    onPressed: () {
                      context.read<CommentsCubit>().changeStars(index);
                    },
                    icon: Icon(
                      watch.stars > index
                          ? Icons.star_rate_rounded
                          : Icons.star_border_rounded,
                      size: size.width * 0.08,
                      color: Style.primary,
                    ),
                  );
                },
              ),
            ),

            // Opition Box
            TextFormField(
              controller: widget.controller,
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
            const Spacer(),
            const TextMdGrey600(
              'Compartenos tu opinión, nos ayudara a mejorar en versiones futuras',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                context.read<CommentsCubit>().submitReview(
                      widget.controller.text,
                    );
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
