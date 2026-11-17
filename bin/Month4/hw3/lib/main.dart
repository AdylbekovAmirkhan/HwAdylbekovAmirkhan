import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cat_bloc.dart';
import 'bloc/cat_event.dart';
import 'bloc/cat_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CatBloc(),
        child: const CatPage(),
      ),
    );
  }
}

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cats API')),
      body: Center(
        child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            if (state is CatLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is CatLoadedState) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.catList.length,
                separatorBuilder: (context, index) => const Divider(height: 20),
                itemBuilder: (context, index) {
                  return Image.network(
                    state.catList[index].url,
                    height: 250,
                    fit: BoxFit.cover,
                  );
                },
              );
            } else if (state is CatErrorState) {
              return Text(
                state.errorText,
                style: const TextStyle(color: Colors.red),
              );
            } else {
              return ElevatedButton(
                onPressed: () {
                  context.read<CatBloc>().add(GetCatListEvent());
                },
                child: const Text('Загрузить кошек'),
              );
            }
          },
        ),
      ),
    );
  }
}
