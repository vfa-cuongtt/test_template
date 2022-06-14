import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_template/src/common/configs/dependency_injection/injection.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/usecase/fetch_events_usecase.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/presentation/exhibition_bottom_sheet/exhibition_bottom_sheet_controller.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/presentation/pages/bloc/event_bloc.dart';
import 'package:test_template/src/routers/e_page.dart';

class TicketChallengePage extends EPage {
  const TicketChallengePage({required Map<String, dynamic> args})
      : super(args: args);

  @override
  Widget build(BuildContext context) {
    return const TicketChallengeScreenController();
  }

  @override
  Route createRoute(BuildContext context) {
    return super.transitionCupertino();
  }
}

class TicketChallengeScreenController extends StatelessWidget {
  const TicketChallengeScreenController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventBloc>(
      create: (BuildContext context) => EventBloc(
        fetchUseCase: getIt<FetchEventsUseCase>(),
      )..add(
          const EventFetchedData(),
        ),
      child: const TicketChallengeScreenView(),
    );
  }
}

class TicketChallengeScreenView extends StatelessWidget {
  const TicketChallengeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const <Widget>[
          ExhibitionBottomSheetController(),
        ],
      ),
    );
  }
}
