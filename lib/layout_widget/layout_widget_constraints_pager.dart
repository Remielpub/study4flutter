import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidgetConstraintsPager extends StatefulWidget {
  const LayoutWidgetConstraintsPager({Key? key}) : super(key: key);
  static const String route = "layout_widget_constraints";

  @override
  State<StatefulWidget> createState() {
    return _LayoutWidgetConstraintsState();
  }
}

class _LayoutWidgetConstraintsState
    extends State<LayoutWidgetConstraintsPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("布局原理及约束（constraints）"),
        ),
        body: Scrollbar(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "Flutter 中有两种布局模型：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: const Text(
                        """基于 RenderBox 的盒模型布局。\n"""
                        """基于 Sliver ( RenderSliver ) 按需加载列表布局。""",
                      ),
                      margin: const EdgeInsets.only(top: 5),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "布局流程：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: const Text("""1.上层组件向下层组件传递约束（constraints）条件。\n"""
                          """2.下层组件确定自己的大小，然后告诉上层组件。注意下层组件的大小必须符合父组件的约束。\n"""
                          """3.上层组件确定下层组件相对于自身的偏移和确定自身的大小（大多数情况下会根据子组件的大小来确定自身的大小）。\n"""
                          """const BoxConstraints({
  this.minWidth = 0.0, //最小宽度
  this.maxWidth = double.infinity, //最大宽度
  this.minHeight = 0.0, //最小高度
  this.maxHeight = double.infinity //最大高度
  })"""),
                      margin: const EdgeInsets.only(top: 5),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "盒模型布局组件有两个特点：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: const Text(
                        """1.组件对应的渲染对象都继承自 RenderBox 类。在本书后面文章中如果提到某个组件是 RenderBox，则指它是基于盒模型布局的，而不是说组件是 RenderBox 类的实例。\n"""
                        """2.在布局过程中父级传递给子级的约束信息由 BoxConstraints 描述。""",
                      ),
                      margin: const EdgeInsets.only(top: 5),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "BoxConstraints：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: const Text(
                        """BoxConstraints 是盒模型布局过程中父渲染对象传递给子渲染对象的约束信息，包含最大宽高信息，子组件大小需要在约束的范围内。\n""",
                      ),
                      margin: const EdgeInsets.only(top: 5),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "BoxConstraints 快捷使用：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: const Text(
                        """BoxConstraints.tight(Size size) --- 它可以生成固定宽高的限制\n"""
                        """BoxConstraints.expand() --- 可以生成一个尽可能大的用以填充另一个容器的BoxConstraints\n""",
                      ),
                      margin: const EdgeInsets.only(top: 5),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "ConstrainedBox 使用：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: const Text(
                        """ConstrainedBox用于对子组件添加额外的约束。例如，如果你想让子组件的最小高度是80像素，你可以使用const BoxConstraints(minHeight: 80.0)作为子组件的约束""",
                      ),
                      margin: const EdgeInsets.only(top: 5),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: double.infinity,
                          minHeight: 50.0
                        ),
                        child: Container(
                          height: 5.0,
                          child: const DecoratedBox(
                            decoration: BoxDecoration(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: const Text("可以看到，我们虽然将Container的高度设置为5像素，但是最终却是50像素，这正是ConstrainedBox的最小高度限制生效了。如果将Container的高度设置为80像素，那么最终红色区域的高度也会是80像素，因为在此示例中，ConstrainedBox只限制了最小高度，并未限制最大高度"),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "多重限制：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: const Text(
                        """如果某一个组件有多个父级ConstrainedBox限制，那么最终会是哪个生效？我们看一个例子：""",
                      ),
                      margin: const EdgeInsets.only(top: 5),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                            minWidth: 60.0,
                            minHeight: 60.0
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 90.0,
                            minHeight: 20.0
                          ),
                          child: const DecoratedBox(
                            decoration: BoxDecoration(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: const Text("最终显示效果是宽90，高60，也就是说是子ConstrainedBox的minWidth生效，而minHeight是父ConstrainedBox生效。单凭这个例子，我们还总结不出什么规律，我们将上例中父子约束条件换一下："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                            minWidth: 90.0,
                            minHeight: 20.0
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                              minWidth: 60.0,
                              minHeight: 60.0
                          ),
                          child: const DecoratedBox(
                            decoration: BoxDecoration(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: const Text("最终的显示效果仍然是90，高60，效果相同，但意义不同，因为此时minWidth生效的是父ConstrainedBox，而minHeight是子ConstrainedBox生效。通过上面示例，我们发现有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。"),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "思考题：对于maxWidth和maxHeight，多重限制的策略是什么样的呢？",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                            maxWidth: 90.0,
                            maxHeight: 60.0
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: 20.0,
                              maxHeight: 160.0
                          ),
                          child: const DecoratedBox(
                            child: SizedBox(
                              width: 100,
                              height: 100,
                            ),
                            decoration: BoxDecoration(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: const Text("最终的显示效果仍然是宽20，高60，对于maxWidth和maxHeight来说，是取父子中相应数值较小的。"),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "其他约束类容器：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: const Text(
                        """AspectRatio --- 指定子组件的长宽比\n"""
                            """LimitedBox --- 用于指定最大宽高\n"""
                        """FractionallySizedBox --- 可以根据父容器宽高的百分比来设置子组件宽高\n""",

                      ),
                      margin: const EdgeInsets.only(top: 5),
                    )
                  ],
                ),
              ),

            ],
          ),
        )));
  }
}
