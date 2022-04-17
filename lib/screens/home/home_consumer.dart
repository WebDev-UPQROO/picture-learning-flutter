import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/global/music/music_cubit.dart';
import 'package:picture_learning/main.dart';
import 'package:picture_learning/screens/home/cubit/home_cubit.dart';
import 'package:picture_learning/utils/dialog_loading.dart';
import 'package:picture_learning/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

const String song =
    'https://t4.bcbits.com/stream/bb9dd2af04c999d34566f9009452e093/mp3-128/2332696458?p=0&ts=1650239735&t=48499c6f6834c118f38d44bcc23bfd0f37bf634a&token=1650239735_02c05dad3a6217d9adc02f38c1e1813c39ea87db';

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
      context.read<HomeCubit>().getHome();
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
    const url = song;
    context.read<MusicCubit>().playMusic(url);
  }

  @override
  void didPush() {
    const url = song;
    context.read<MusicCubit>().playMusic(url);
  }
}
