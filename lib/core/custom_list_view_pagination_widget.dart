

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum ListAnimationType {
  Slide,
  FadeIn,
  Scale,
  Flip,
}

class SlideConfiguration {
  final double verticalOffset;
  final double horizontalOffset;
  final Duration duration;
  final Curve curve;

  SlideConfiguration({
    this.verticalOffset = 0.0,
    this.horizontalOffset = 0.0,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });
}

class FadeInConfiguration {
  final Duration duration;
  final Curve curve;

  FadeInConfiguration({
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });
}

class ScaleConfiguration {
  final double scaleFactor;
  final Duration duration;
  final Curve curve;

  ScaleConfiguration({
    this.scaleFactor = 0.8,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });
}

class FlipConfiguration {
  final Axis flipAxis;
  final Duration duration;
  final Curve curve;

  FlipConfiguration({
    this.flipAxis = Axis.horizontal,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });
}

class CustomPaginationListView extends StatefulWidget {
  final ScrollController? controller;
  final int? itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final Clip clipBehavior;
  final DragStartBehavior dragStartBehavior;
  final int? Function(Key)? findChildIndexCallback;
  final double? itemExtent;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final bool? primary;
  final Widget? prototypeItem;
  final String? restorationId;
  final bool reverse;
  final int? semanticChildCount;

  // Animation Configuration
  final ListAnimationType listAnimationType;
  final SlideConfiguration? slideConfiguration;
  final FadeInConfiguration? fadeInConfiguration;
  final ScaleConfiguration? scaleConfiguration;
  final FlipConfiguration? flipConfiguration;

  // Callbacks
  final VoidCallback? onNextPage;
  final VoidCallback? onPageScrollChange;
  final RefreshCallback? onSwipeRefresh;

  final bool disposeScrollController;
  final Widget? emptyWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final bool isFinishList;
  const CustomPaginationListView({
    super.key,
    this.controller,
    this.itemCount,
    this.padding,
    this.physics,
    this.scrollDirection = Axis.vertical,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.isFinishList = false,
    this.cacheExtent,
    this.clipBehavior = Clip.hardEdge,
    this.dragStartBehavior = DragStartBehavior.start,
    this.findChildIndexCallback,
    this.itemExtent,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.primary,
    this.prototypeItem,
    this.restorationId,
    this.reverse = false,
    this.semanticChildCount,
    required this.itemBuilder,
    this.shrinkWrap = false,
    this.listAnimationType = ListAnimationType.Slide,
    this.slideConfiguration,
    this.loadingWidget = const Center(child: CircularProgressIndicator()),
    this.errorWidget = const Center(child: Text("data")),
    this.fadeInConfiguration,
    this.scaleConfiguration,
    this.flipConfiguration,
    this.onNextPage,
    this.onPageScrollChange,
    this.onSwipeRefresh,
    this.disposeScrollController = true,
    this.emptyWidget,
  });

  @override
  State<CustomPaginationListView> createState() =>
      CustomPaginationListViewState();
}

class CustomPaginationListViewState extends State<CustomPaginationListView> {
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    scrollController = widget.controller ?? ScrollController();

    if (widget.onNextPage != null) {
      scrollController!.addListener(() {
        if (scrollController!.position.maxScrollExtent ==
            scrollController!.offset) {
          widget.onNextPage?.call();
        }
        widget.onPageScrollChange?.call();
      });
    }
  }

  @override
  void dispose() {
    if (widget.disposeScrollController) scrollController?.dispose();
    super.dispose();
  }

  Widget _buildListView() {
    if (widget.itemCount == 0 && widget.emptyWidget != null) {
      return widget.emptyWidget!;
    }

    return ListView.builder(
      controller: scrollController,
      physics: widget.physics,
      padding: widget.padding,
      itemCount: widget.itemCount! + 1,
      shrinkWrap: widget.shrinkWrap,
      scrollDirection: widget.scrollDirection,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      cacheExtent: widget.cacheExtent,
      clipBehavior: widget.clipBehavior,
      dragStartBehavior: widget.dragStartBehavior,
      findChildIndexCallback: widget.findChildIndexCallback,
      itemExtent: widget.itemExtent,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      primary: widget.primary,
      prototypeItem: widget.prototypeItem,
      restorationId: widget.restorationId,
      reverse: widget.reverse,
      semanticChildCount: widget.semanticChildCount,
      itemBuilder: (context, index) {
        if (index < widget.itemCount!) {
          return widget.itemBuilder(context, index);
        } else if (widget.isFinishList) {
          return widget.errorWidget;
        } else {
          return widget.loadingWidget;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onSwipeRefresh != null) {
      return RefreshIndicator(
        onRefresh: widget.onSwipeRefresh!,
        child: _buildListView(),
      );
    }
    return _buildListView();
  }
}
