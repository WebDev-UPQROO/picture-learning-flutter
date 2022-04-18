import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/screens/comments_screen/cubit/comments_cubit.dart';
import 'package:picture_learning/utils/dialog.dart';
import 'package:picture_learning/utils/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

class CommentsConsumer extends StatefulWidget {
  const CommentsConsumer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  State<CommentsConsumer> createState() => _CommentsConsumerState();
}

class _CommentsConsumerState extends State<CommentsConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentsCubit, CommentsState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.loading:
            dialogLoading(context);
            break;

          case Status.loaded:
            snackbarSuccess(context, state.message!.description);
            Navigator.pop(context);
            Navigator.pop(context);
            break;

          case Status.error:
            Navigator.pop(context);
            snackbarError(context, state.message!.description);
            break;

          default:
            break;
        }
      },
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Do something
    });
  }
}
