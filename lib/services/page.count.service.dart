import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageCount = Provider.autoDispose<TabNotifier>((_) => TabNotifier());

class TabNotifier extends StateNotifier<int> {
  TabNotifier() : super(0);
  void changePages(int number) => state = number;
}
