import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/image/bloc/dog_bloc.dart';

class MyDogPage extends StatefulWidget {
  const MyDogPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyDogPageState();
}

class _MyDogPageState extends State<MyDogPage> {
  final DogBloc _dogBloc = DogBloc();

  @override
  void initState() {
    super.initState();
    _dogBloc.add(LoadDogImageEvent());
  }

  @override
  void dispose() {
    _dogBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<DogBloc, DogState>(
          bloc: _dogBloc,
          builder: (context, state) {
            if (state is ErrorImgState) {
              return const Text('oshibka');
            }
            if (state is LoadingImgState) {
              return const CircularProgressIndicator.adaptive();
            }
            if (state is LoadedImgState) {
              return Image.network(state.img);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dogBloc.add(LoadDogImageEvent()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
