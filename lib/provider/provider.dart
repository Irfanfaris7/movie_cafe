import 'package:flutter_riverpod/flutter_riverpod.dart';

final visibleProvider = StateProvider<bool>((ref) {
  return true;
});

final changeListProvider = StateProvider<bool>((ref) {
  return true;
});

final bottomProvider = StateProvider<int>((ref) => 0);

final colorProvider = StateProvider<bool>((ref) {
  return false;
});

final readProvider = StateProvider<bool>((ref) {
  return false;
});

final smoothCurveProvider = StateProvider<int>((ref) {
  return 0;
});
