import 'package:riverpod/riverpod.dart';
import 'package:todoapi/api/todo_apiservices.dart';
import 'package:todoapi/models/todo_apimodel.dart';

final apiserviceprvdr = Provider<Apiservice>((ref) {
  return Apiservice();
});

final getpostprovider = FutureProvider<List<Welcome>?>((ref) async {
  return ref.watch(apiserviceprvdr).getpost();
});
