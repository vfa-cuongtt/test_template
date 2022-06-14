import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_template/src/common/configs/dependency_injection/injection.dart';
import 'package:test_template/src/common/widgets/modal_progress_hud/modal_progress_hud.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/entities/event_entity.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/presentation/exhibition_bottom_sheet/exhibition_bottom_sheet_view.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/presentation/pages/bloc/event_bloc.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ExhibitionBottomSheetController extends StatelessWidget {
  const ExhibitionBottomSheetController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      buildWhen: (previous, current) => previous != current,
      builder: (_, state) {
        var _inAsyncCall = true;
        List<EventEntity>? _events;
        if (state is EventInitial) {
          _inAsyncCall = true;
        } else if (state is EventLoading) {
          _inAsyncCall = true;
        } else if (state is EventLoadSuccessful) {
          _inAsyncCall = false;
          _events = state.events;
        } else if (state is EventLoadFailed) {
          _inAsyncCall = false;
          _events = <EventEntity>[];
        }
        return ModalProgressHUD(
          inAsyncCall: _inAsyncCall,
          child: ExhibitionBottomSheetView(
            this,
            events: _events,
            percentMaxHeight: ResponsiveValue<double>(
              context,
              defaultValue: 0.85,
              valueWhen: const [
                Condition.smallerThan(
                  name: MOBILE,
                  value: 1,
                )
              ],
            ).value!,
          ),
        );
      },
    );
  }

  //////////////////////////////////////////////////////////
  // UI binding event handlers, init code, etc goes here
  //////////////////////////////////////////////////////////

  void toggle() {
    getIt<Logger>().d('put logic in here when have event toggle');
  }

  void onVerticalDragUpdate() {
    getIt<Logger>().d('put logic in here when have event onDragUpdate');
  }

  void onVerticalDragEnd() {
    getIt<Logger>().d('put logic in here when have event onDragEnd');
  }
}
