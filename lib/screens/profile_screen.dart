import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_module/profile_module.dart';

// import '../blocs/blocs.dart';
import '../commons/commons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        profileRepository: context.read<BaseProfileRepository>(),
      )..getData(),
      child: const ProfileScreenContent(),
    );
  }
}

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        // onRefresh: () async => context.read<ProfileCubit>()..getData(),
        onRefresh: () async => print("On Refresh"),
        child: BlocBuilder<ProfileCubit, BaseStateProfile>(
          builder: (context, state) {
            print("===> state is: $state");
            UserApp? _result;

            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Palette.finnHubSecondary,
                ),
              );
            }

            if (state is EmptyState) {
              return const Center(
                child: Text("Whoops, something wrong"),
              );
            }

            if (state is ErrorState) {
              return const Center(
                child: Text("Whoops, something wrong"),
              );
            }

            if (state is LoadedState) {
              _result = state.data;
            }

            return Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Name: ${_result?.name}",
                      style: FontHelper.h5Bold(),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Email: ${_result?.email}",
                      style: FontHelper.h5Bold(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
