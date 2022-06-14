import 'dart:math' as math;
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/entities/event_entity.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/presentation/exhibition_bottom_sheet/expanded_item_event_view.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/presentation/widgets/atoms/sheet_header.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const double minHeight = 120;
const double paddingContainer = 32;
const double doublePaddingContainer = 32 * 2;
const double iconStartSize = 44;
const double iconEndSize = 120;
const double iconStartMarginTop = 36;
const double iconEndMarginTop = 48;
const double iconsVerticalSpacing = 24;
const double iconsHorizontalSpacing = 16;
const Duration transitionBottomSheet = Duration(milliseconds: 600);

const double minRangeHeaderTopMargin = 20;

const double minRangeHeaderFontSize = 14;
const double maxRangeHeaderFontSize = 24;

const double minRangeBorderRadius = 8;
const double maxRangeBorderRadius = 24;

const double textNotFoundMarginTop = iconStartMarginTop + iconStartSize * 0.5;

class ExhibitionBottomSheet extends HookWidget {
  const ExhibitionBottomSheet({
    Key? key,
    this.duration = transitionBottomSheet,
    required this.percentMaxHeight,
    this.events,
    this.onToggle,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
  }) : super(key: key);

  final Duration duration;
  final List<EventEntity>? events;

  final double percentMaxHeight;

  final VoidCallback? onToggle;
  final VoidCallback? onVerticalDragUpdate;
  final VoidCallback? onVerticalDragEnd;

  Widget _buildItem(
    EventEntity event, {
    required double imageSize,
    required double top,
    required double left,
    required double imageLeftRadius,
    required double imageRightRadius,
    required Alignment alignment,
    required bool isVisible,
    required double widthContainer,
    required double contentLeftRadius,
    required double contentRightRadius,
    required int index,
  }) {
    return ExpandedItemEventView(
      imageSize: imageSize,
      top: top,
      left: left,
      imageLeftRadius: imageLeftRadius,
      imageRightRadius: imageRightRadius,
      event: event,
      alignment: alignment,
      isVisible: isVisible,
      widthContainer: widthContainer,
      contentLeftRadius: contentLeftRadius,
      contentRightRadius: contentRightRadius,
      index: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    //////////////////////////////////////////////////////////
    // Define variable
    //////////////////////////////////////////////////////////
    final controller = useAnimationController(duration: duration);
    final maxHeight = MediaQuery.of(context).size.height * percentMaxHeight;
    final paddingTop = MediaQuery.of(context).padding.top;
    final widthItem =
        MediaQuery.of(context).size.width - doublePaddingContainer;
    //////////////////////////////////////////////////////////
    // Handle event animation
    //////////////////////////////////////////////////////////
    void _toggle() {
      onToggle?.call();
      final isOpen = controller.status == AnimationStatus.completed;
      controller.fling(velocity: isOpen ? -2 : 2);
    }

    void _onVerticalDragUpdate(DragUpdateDetails details) {
      onVerticalDragUpdate?.call();
      controller.value -= details.primaryDelta! / maxHeight;
    }

    void _onVerticalDragEnd(DragEndDetails details) {
      onVerticalDragEnd?.call();
      if (controller.isAnimating ||
          controller.status == AnimationStatus.completed) return;

      final flingVelocity = details.velocity.pixelsPerSecond.dy /
          maxHeight; //<-- calculate the velocity of the gesture
      if (flingVelocity < 0.0) {
        controller.fling(velocity: math.max(2, -flingVelocity));
      } else if (flingVelocity > 0.0) {
        controller.fling(velocity: math.min(-2, -flingVelocity));
      } else {
        controller.fling(velocity: controller.value < 0.5 ? -2.0 : 2.0);
      }
    }

    double lerp(double min, double max) =>
        lerpDouble(min, max, controller.value)!;

    double height() => lerp(minHeight, maxHeight);

    double headerTopMargin() =>
        lerp(minRangeHeaderTopMargin, minRangeHeaderTopMargin + paddingTop);

    double headerFontSize() =>
        lerp(minRangeHeaderFontSize, maxRangeHeaderFontSize);

    double itemBorderRadius() =>
        lerp(minRangeBorderRadius, maxRangeBorderRadius);

    double iconLeftBorderRadius() => itemBorderRadius();
    double iconRightBorderRadius() {
      if (controller.value == 1) {
        return 0;
      }
      return itemBorderRadius();
    }

    double contentLeftBorderRadius() => lerp(minRangeBorderRadius, 0);
    itemBorderRadius();
    double contentRightBorderRadius() => itemBorderRadius();

    double iconSize() => lerp(iconStartSize, iconEndSize);

    double iconLeftMargin(int index) =>
        lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);
    double iconTopMargin(int index) =>
        lerp(
          iconStartMarginTop,
          iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize),
        ) +
        headerTopMargin();

    double widthItemContainer() => lerp(iconStartSize, widthItem);

    //////////////////////////////////////////////////////////
    // Widget tree goes here.
    //////////////////////////////////////////////////////////
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Positioned(
          height: height(),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragUpdate: _onVerticalDragUpdate,
            onVerticalDragEnd: _onVerticalDragEnd,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: paddingContainer),
              decoration: const BoxDecoration(
                color: Color(0xFF162A49),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Stack(
                children: <Widget>[
                  SheetHeader(
                    fontSize: headerFontSize(),
                    topMargin: headerTopMargin(),
                  ),
                  if (events != null && events!.isNotEmpty)
                    ...events!
                        .mapIndexed(
                          (index, element) => _buildItem(
                            element,
                            imageSize: iconSize(),
                            top: iconTopMargin(index),
                            left: iconLeftMargin(index),
                            imageLeftRadius: iconLeftBorderRadius(),
                            imageRightRadius: iconRightBorderRadius(),
                            alignment: Alignment(lerp(1, 0), 0),
                            isVisible:
                                controller.status == AnimationStatus.completed,
                            widthContainer: widthItemContainer(),
                            contentLeftRadius: contentLeftBorderRadius(),
                            contentRightRadius: contentRightBorderRadius(),
                            index: index,
                          ),
                        )
                        .toList(),
                  if (events != null && events!.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: textNotFoundMarginTop),
                      child: Text(
                        'Not found events',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  if (events == null) const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
