import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modularization/blocs/blocs.dart';
import 'package:flutter_modularization/widgets/widgets.dart';

import '../commons/commons.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;

    return Scaffold(
      body: BlocListener<SignInCubit, BaseState>(
        listener: (context, state) {
          UserApp? user;

          if (state is ErrorState) {
            if (state.error.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error,
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Whoops. Something went wrong, try again later",
                  ),
                ),
              );
            }
          }

          if (state is SuccessState) {
            user = state.data;

            Navigator.pushNamed(
              context,
              RouteName.landingScreen,
              arguments: ScreenArgument(
                data: UserApp(
                  email: user?.email,
                  name: user?.name,
                ),
              ),
            );
          }
        },
        child: BlocBuilder<SignInCubit, BaseState>(
          builder: (context, buildState) {
            if (buildState is LoadingState) {
              _isLoading = true;
            }

            if (buildState is SuccessState || buildState is ErrorState) {
              _isLoading = false;
            }

            return SafeArea(
              child: Container(
                width: double.maxFinite,
                color: Palette.finnHubBackgroundDark,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      Image.asset(
                        Images.iconFinnhub,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 100.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Text(
                          "See what's happening\nin the world right now.",
                          style: FontHelper.h4Bold(
                            color: Palette.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 100.0,
                      ),
                      if (_isLoading) ...[
                        const Center(
                          child: CircularProgressIndicator(
                            color: Palette.finnHubPrimary,
                          ),
                        ),
                      ] else ...[
                        _sectionSocialMedia(context),
                      ],
                      const SizedBox(
                        height: 10.0,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _sectionTermsPolicy(context),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _sectionSocialMedia(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          SocialMediaButton(
            title: 'Continue with Google',
            action: () async => context.read<SignInCubit>().signInWithGoogle(),
          ),
        ],
      ),
    );
  }

  Widget _sectionDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1.0,
            width: MediaQuery.of(context).size.width / 2.9,
            color: Palette.white,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            "Or",
            style: FontHelper.h7Regular(
              color: Palette.white,
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Container(
            height: 1.0,
            width: MediaQuery.of(context).size.width / 2.9,
            color: Palette.white,
          ),
        ],
      ),
    );
  }

  Widget _sectionTermsPolicy(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'By signing up, you agree to our',
              style: FontHelper.h7Regular(
                color: Palette.greyLighten1,
              ),
            ),
            TextSpan(
              text: ' Terms, Privacy, Policy',
              style: FontHelper.h7Regular(
                color: Palette.finnHubSecondary,
              ),
            ),
            TextSpan(
              text: ' and',
              style: FontHelper.h7Regular(
                color: Palette.greyLighten1,
              ),
            ),
            TextSpan(
              text: ' Cookies Use.',
              style: FontHelper.h7Regular(
                color: Palette.finnHubSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
