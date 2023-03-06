
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class HitTestBlocker extends SingleChildRenderObjectWidget {
  const HitTestBlocker(
      {Key? key,
      this.up = true,
      this.down = false,
      this.self = false,
      Widget? child})
      : super(key: key, child: child);

  /// up 为 true 时 , `hitTest()` 将会一直返回 false.
  final bool up;

  /// down 为 true 时, 将不会调用 `hitTestChildren()`.
  final bool down;

  /// `hitTestSelf` 的返回值
  final bool self;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderHitTestBlocker(up: up, down: down, self: self);
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderHitTestBlocker renderObject) {
    // TODO: implement updateRenderObject
    renderObject
      ..up = up
      ..down = down
      ..self = self;
  }
}

class RenderHitTestBlocker extends RenderProxyBox {
  RenderHitTestBlocker({this.up = true, this.down = true, this.self = true});

  bool up;
  bool down;
  bool self;

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
      bool hitTextDownResult = false;

      if(!down) {
        hitTextDownResult = hitTestChildren(result, position: position);
      }

      bool pass = hitTestSelf(position);

      if(pass) {
        result.add(BoxHitTestEntry(this, position));
      }
      return !up && pass;
  }
  bool hitTestSelf(Offset position) => self;
}
