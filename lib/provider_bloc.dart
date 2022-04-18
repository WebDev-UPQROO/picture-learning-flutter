import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:picture_learning/global/music/music_cubit.dart';
import 'package:picture_learning/models/services/index.dart';

class ProviderBloc extends StatelessWidget {
  const ProviderBloc({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MusicCubit(
            context.read<LocalService>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
