import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/screens/comments_screen/cubit/comments_cubit.dart';
import 'package:picture_learning/widgets/appbar/appbar_light.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.04,
            ),
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
            ),
            child: TextFormField(
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
          ),
          const Spacer(),
          Gap04(
            child: ElevatedButton(
              onPressed: () {
                context.read<CommentsCubit>().submitReview(
                      widget.controller.text,
                    );
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}
