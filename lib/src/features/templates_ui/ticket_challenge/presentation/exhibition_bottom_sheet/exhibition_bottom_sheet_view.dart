import 'package:flutter/cupertino.dart';
import 'package:test_template/src/features/core/presentation/widget_functional_controller.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/entities/event_entity.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/presentation/exhibition_bottom_sheet/exhibition_bottom_sheet.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/presentation/exhibition_bottom_sheet/exhibition_bottom_sheet_controller.dart';

class ExhibitionBottomSheetView
    extends WidgetFunctionalController<ExhibitionBottomSheetController> {
  const ExhibitionBottomSheetView(
    ExhibitionBottomSheetController state, {
    this.events,
    required this.percentMaxHeight,
    Key? key,
  }) : super(state, key: key);

  final List<EventEntity>? events;

  final double percentMaxHeight;
  @override
  Widget build(BuildContext context) {
    //////////////////////////////////////////////////////////
    // Widget tree goes here.
    //////////////////////////////////////////////////////////
    return ExhibitionBottomSheet(
      events: events,
      onToggle: state.toggle,
      onVerticalDragUpdate: state.onVerticalDragUpdate,
      onVerticalDragEnd: state.onVerticalDragEnd,
      percentMaxHeight: percentMaxHeight,
    );
  }
}
