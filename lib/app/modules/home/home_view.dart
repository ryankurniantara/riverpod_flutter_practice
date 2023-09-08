import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazyui/lazyui.dart';
import 'package:riverpod_example/app/modules/home/widgets/dashboard_view.dart';
import 'package:riverpod_example/app/modules/home/widgets/task_view.dart';
import 'package:riverpod_example/app/providers/home_provider/home_provider.dart';

import 'widgets/contact_view.dart';
import 'widgets/event_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(homeProvider.notifier);

    List<Widget> homes = [DashBoardView(), ContactView(), EventView(), TaskView()];
    List<IconData> icon = [Ti.home, Ti.addressBook, Ti.calendar, Ti.clipboard];

    return Scaffold(body: SafeArea(
      child: notifier.watch(
        (state) {
          return Stack(
            children: List<Widget>.generate(homes.length, (i) {
              bool isActive = state.activeIndex == i;

              logg(isActive);

              return IgnorePointer(
                ignoring: !isActive,
                child: AnimatedOpacity(
                  duration: 250.ms,
                  opacity: isActive ? 1 : 0,
                  child: Navigator(
                    onGenerateRoute: (RouteSettings settings) {
                      return MaterialPageRoute(
                        builder: (_) => homes[state.activeIndex],
                        settings: settings,
                      );
                    },
                  ),
                ),
              );
            }),
          );
        },
      ),
    ), bottomNavigationBar: notifier.watch(
      (state) {
        return Stack(
          children: [
            Intrinsic(
              children: List.generate(homes.length, (i) {
                return Expanded(
                  child: InkTouch(
                    onTap: () {
                      state.setNavigation(i);
                      logg(notifier.activeIndex);
                    },
                    padding: Ei.all(20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Icon(
                          icon[i],
                          size: 30,
                          color: state.activeIndex == i ? Colors.black87 : Colors.black45,
                        ),
                        Text(
                          'Home',
                          style: Gfont.fs(12).copyWith(
                            color: state.activeIndex == i ? Colors.black87 : Colors.black45,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    ));
  }
}
