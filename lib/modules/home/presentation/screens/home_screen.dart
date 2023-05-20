import 'package:e_commerce_app/modules/home/presentation/controller/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Shop',
            ),
          ),
        );
      },
    );
  }
}
