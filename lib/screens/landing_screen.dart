import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../commons/commons.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, AppTab>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Palette.transparent,
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Palette.finnHubBackgroundDark,
            selectedItemColor: Palette.finnHubPrimary,
            unselectedItemColor: Palette.grey,
            selectedLabelStyle: FontHelper.h9Regular(
              color: Palette.finnHubPrimary,
            ),
            unselectedLabelStyle: FontHelper.h9Regular(
              color: Palette.grey,
            ),
            showUnselectedLabels: true,
            onTap: (index) => context.read<TabCubit>().changeTab(
                  tab: AppTab.values[index],
                ),
            currentIndex: AppTab.values.indexOf(state),
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.home_outlined,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.home_filled,
                      color: Palette.finnHubPrimary,
                    ),
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.person_outline_rounded,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.person,
                      color: Palette.finnHubPrimary,
                    ),
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
          body: _buildContent(
            state,
          ),
        );
      },
    );
  }

  Widget _buildContent(
    AppTab state,
  ) {
    if (state == AppTab.home) {
      return const SafeArea(
        child: HomeScreen(),
      );
    }
    if (state == AppTab.profile) {
      return const SafeArea(
        child: ProfileScreen(),
      );
    }

    return Container();
  }
}
