
import 'package:flutter/cupertino.dart';

class ExtraInfoBoxConstraints<T> extends BoxConstraints {
  ExtraInfoBoxConstraints(this.extra, BoxConstraints constraints)
      : super(
            minWidth: constraints.minWidth,
            minHeight: constraints.minHeight,
            maxWidth: constraints.maxWidth,
            maxHeight: constraints.maxHeight);

  final T extra;

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is ExtraInfoBoxConstraints &&
        super == other &&
        other.extra == extra;
  }

  @override
  int get hashCode {
    return hashValues(super.hashCode, extra);
  }
}
