import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var dioProvider = StateProvider(
  (ref) => Dio()
);

final localeProvider = StateProvider((ref) => 'pt');