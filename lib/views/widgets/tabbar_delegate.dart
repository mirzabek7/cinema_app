import 'package:cinema_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: CustomColors.primaryBackground, child: tabBar);
  }

  @override
  bool shouldRebuild(TabBarDelegate oldDelegate) {
    return false;
  }
}
