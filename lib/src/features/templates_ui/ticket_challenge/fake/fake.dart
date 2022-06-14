import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

const sizes = 3;

final events = [
  {
    'id': '0',
    'link':
        'https://images.pexels.com/photos/11796388/pexels-photo-11796388.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'title': 'Shenzhen GLOBAL DESIGN AWARD 2018',
    'date': '4.20-30',
    'location': 'Science Park 10 25A',
  },
  {
    'id': '1',
    'link':
        'https://images.pexels.com/photos/9611344/pexels-photo-9611344.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'title': 'Shenzhen GLOBAL DESIGN AWARD 2019',
    'date': '4.21-30',
    'location': 'Science Park 11 25A',
  },
  {
    'id': '2',
    'link':
        'https://images.pexels.com/photos/2743797/pexels-photo-2743797.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'title': 'Shenzhen GLOBAL DESIGN AWARD 2020',
    'date': '4.22-30',
    'location': 'Science Park 12 25A',
  }
];
Future<void> fakeFetchEvents(Dio dio) async {
  final dioAdapter = DioAdapter(dio: dio);

  const path = 'https://jsonplaceholder.typicode.com/todos';

  final dataEvents = <dynamic>[];
  for (var i = 0; i < sizes; i++) {
    final _random = Random();
    final dataRandom = events[_random.nextInt(events.length)];
    dataEvents.add(dataRandom);
  }
  final data = <String, dynamic>{
    'data': {
      'events': dataEvents,
    }
  };

  dioAdapter.onGet(
    path,
    (server) => server.reply(
      HttpStatus.ok,
      data,
      delay: const Duration(seconds: 5),
    ),
  );
}
