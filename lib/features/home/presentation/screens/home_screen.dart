import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../widgets/home_error_view.dart';
import '../widgets/home_shimmer_view.dart';
import '../widgets/home_success_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch (state) {
                case HomeLoading():
                  return const HomeShimmerView();
                case HomeSuccess():
                  return HomeSuccessView(
                    categories: state.categories,
                    products: state.products,
                  );
                case HomeFailure():
                  return HomeErrorView(error: state.error);
              }
              return const HomeShimmerView();
            },
          ),
        ),
      ),
    );
  }
}
