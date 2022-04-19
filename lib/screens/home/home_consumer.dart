import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/global/music/music_cubit.dart';
import 'package:picture_learning/main.dart';
import 'package:picture_learning/routes/routes_auth.dart';
import 'package:picture_learning/screens/home/cubit/home_cubit.dart';
import 'package:picture_learning/utils/dialog.dart';
import 'package:picture_learning/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

class HomeConsumer extends StatefulWidget {
  const HomeConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<HomeConsumer> createState() => _HomeConsumerState();
}

class _HomeConsumerState extends State<HomeConsumer> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.loading:
            dialogLoading(context);
            break;

          case Status.loaded:
            Navigator.pop(context);
            break;

          case Status.validated:
            Future.delayed(const Duration(milliseconds: 400)).then((_) {
              Navigator.pop(context);

              if (state.isUser == false) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutesAuth.loginOAuth,
                  (route) => false,
                );
              } else {
                context.read<HomeCubit>().getHome();
                final music = context.read<HomeCubit>().state.music;
                context.read<MusicCubit>().playMusic(music);
              }
            });
            break;

          case Status.error:
            Navigator.of(context).pushNamedAndRemoveUntil(
              RoutesAuth.loginOAuth,
              (route) => false,
            );
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
      context.read<HomeCubit>().getIsUser();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPushNext() {
    context.read<MusicCubit>().stopMusic();
  }

  @override
  void didPopNext() {
    final music = context.read<HomeCubit>().state.music;
    context.read<MusicCubit>().playMusic(music);
  }
}
