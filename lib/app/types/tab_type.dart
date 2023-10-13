import 'package:flutter/cupertino.dart';

enum TabType { list, individual }

extension TabItem on TabType {
  Icon get icon {
    switch (this) {
      case TabType.list:
        return const Icon(CupertinoIcons.home, size: 25);
      case TabType.individual:
        return const Icon(CupertinoIcons.arrow_down, size: 25);
    }
  }

  String get title {
    switch (this) {
      case TabType.list:
        return "List";
      case TabType.individual:
        return "Individual";
    }
  }
}
