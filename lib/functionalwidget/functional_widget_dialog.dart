import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_element/dialog_element.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class FunctionalWidgetDialog extends StatelessWidget {
  static const String route = "functional_widget_dialog";

  const FunctionalWidgetDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("对话框详解"),
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
                        alignment: Alignment.centerLeft,
                        child: const Text("使用对话框", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("对话框本质上也是UI布局，通常一个对话框会包含标题、内容，以及一些操作按钮，为此，Material库中提供了一些现成的对话框组件来用于快速的构建出一个完整的对话框。"),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("1.AlertDialog", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("下面我们主要介绍一下Material库中的AlertDialog组件，它的构造函数定义如下："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""const AlertDialog({
  Key? key,
  this.title, //对话框标题组件
  this.titlePadding, // 标题填充
  this.titleTextStyle, //标题文本样式
  this.content, // 对话框内容组件
  this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0), //内容的填充
  this.contentTextStyle,// 内容文本样式
  this.actions, // 对话框操作按钮组
  this.backgroundColor, // 对话框背景色
  this.elevation,// 对话框的阴影
  this.semanticLabel, //对话框语义化标签(用于读屏软件)
  this.shape, // 对话框外形
})"""),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("该对话框样式代码如下："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""AlertDialog(
  title: Text("提示"),
  content: Text("您确定要删除当前文件吗?"),
  actions: <Widget>[
    TextButton(
      child: Text("取消"),
      onPressed: () => Navigator.of(context).pop(), //关闭对话框
    ),
    TextButton(
      child: Text("删除"),
      onPressed: () {
        // ... 执行删除操作
        Navigator.of(context).pop(true); //关闭对话框
      },
    ),
  ],
);"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("实现代码很简单，不在赘述。唯一需要注意的是我们是通过Navigator.of(context).pop(…)方法来关闭对话框的，这和路由返回的方式是一致的，并且都可以返回一个结果数据。现在，对话框我们已经构建好了，那么如何将它弹出来呢？还有对话框返回的数据应如何被接收呢？这些问题的答案都在showDialog()方法中。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("showDialog()是Material组件库提供的一个用于弹出Material风格对话框的方法，签名如下："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""Future<T?> showDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder, // 对话框UI的builder
  bool barrierDismissible = true, //点击对话框barrier(遮罩)时是否关闭它
})"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("该方法只有两个参数，含义见注释。该方法返回一个Future，它正是用于接收对话框的返回值：如果我们是通过点击对话框遮罩关闭的，则Future的值为null，否则为我们通过Navigator.of(context).pop(result)返回的result值，下面我们看一下整个示例："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""//点击该按钮后弹出对话框
ElevatedButton(
  child: Text("对话框1"),
  onPressed: () async {
    //弹出对话框并等待其关闭
    bool? delete = await showDeleteConfirmDialog1();
    if (delete == null) {
      print("取消删除");
    } else {
      print("已确认删除");
      //... 删除文件
    }
  },
),

// 弹出对话框
Future<bool?> showDeleteConfirmDialog1() {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件吗?"),
        actions: <Widget>[
          TextButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(), // 关闭对话框
          ),
          TextButton(
            child: Text("删除"),
            onPressed: () {
              //关闭对话框并返回true
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("示例运行后，我们点击对话框“取消”按钮或遮罩，控制台就会输出[取消删除]，如果点击[删除]按钮，控制台就会输出[已确认删除]。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        child: const Text("注意：如果AlertDialog的内容过长，内容将会溢出，这在很多时候可能不是我们期望的，所以如果对话框内容过长时，可以用SingleChildScrollView将内容包裹起来。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () async {
                          bool? delete = await showDeleteDialog(context);
                          if(delete == null) {
                            print("取消删除");
                          } else {
                            print("确认删除");
                          }
                        },
                        child: textcontainer("Material dialog 显示示例"),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("2.SimpleDialog", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("SimpleDialog也是Material组件库提供的对话框，它会展示一个列表，用于列表选择的场景。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () async {
                          int? index = await changeLanguage(context);
                          if(index == null) {
                            print("取消选择");
                          } else {
                            switch(index) {
                              case 1:
                                print("选择简体中文");
                                break;
                              case 2:
                                print("选择美国英语");
                                break;
                            }
                          }
                        }, child: textcontainer("SimpleDialog示例", ),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("3.Dialog", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("实际上AlertDialog和SimpleDialog都使用了Dialog类。由于AlertDialog和SimpleDialog中使用了IntrinsicWidth来尝试通过子组件的实际尺寸来调整自身尺寸，这就导致他们的子组件不能是延迟加载模型的组件（如ListView、GridView 、 CustomScrollView等），代码运行后会报错.如果我们就是需要嵌套一个ListView应该怎么做？这时，我们可以直接使用Dialog类"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          showListDialog(context);
                        }, child: textcontainer("Dialog 示例"),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("现在，我们己经介绍完了AlertDialog、SimpleDialog以及Dialog。上面的示例中，我们在调用showDialog时，在builder中都是构建了这三个对话框组件的一种，可能有些读者会惯性的以为在builder中只能返回这三者之一，其实这不是必须的！就拿Dialog的示例来举例，我们完全可以用下面的代码来替代Dialog"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          showCustomListDialog(context);
                        }, child: textcontainer("自定义Dialog 示例"),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("上面代码运行后可以实现一样的效果。现在我们总结一下：AlertDialog、SimpleDialog以及Dialog是Material组件库提供的三种对话框，旨在帮助开发者快速构建出符合Material设计规范的对话框，但读者完全可以自定义对话框样式，因此，我们仍然可以实现各种样式的对话框，这样即带来了易用性，又有很强的扩展性。"),
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
                        alignment: Alignment.centerLeft,
                        child: const Text("对话框打开动画及遮罩", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("我们可以把对话框分为内部样式和外部样式两部分。内部样式指对话框中显示的具体内容，这部分内容我们已经在上面介绍过了；外部样式包含对话框遮罩样式、打开动画等，本节主要介绍如何自定义这些外部样式。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("我们已经介绍过了showDialog方法，它是Material组件库中提供的一个打开Material风格对话框的方法。那如何打开一个普通风格的对话框呢（非Material风格）？ Flutter 提供了一个showGeneralDialog方法，签名如下:"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""Future<T?> showGeneralDialog<T>({
  required BuildContext context,
  required RoutePageBuilder pageBuilder, //构建对话框内部UI
  bool barrierDismissible = false, //点击遮罩是否关闭对话框
  String? barrierLabel, // 语义化标签(用于读屏软件)
  Color barrierColor = const Color(0x80000000), // 遮罩颜色
  Duration transitionDuration = const Duration(milliseconds: 200), // 对话框打开/关闭的动画时长
  RouteTransitionsBuilder? transitionBuilder, // 对话框打开/关闭的动画
  ...
})"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("实际上，showDialog方法正是showGeneralDialog的一个封装，定制了Material风格对话框的遮罩颜色和动画。Material风格对话框打开/关闭动画是一个Fade（渐隐渐显）动画，如果我们想使用一个缩放动画就可以通过transitionBuilder来自定义。下面我们自己封装一个showCustomDialog方法，它定制的对话框动画为缩放动画，并同时制定遮罩颜色为Colors.black87："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: (){
                            showDialogByGeneral(context);
                        }, child: textcontainer("通过 showGeneralDialog 显示对话框")),
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
                        alignment: Alignment.centerLeft,
                        child: const Text("对话框实现原理", style: TextStyle(fontWeight: FontWeight.bold),),),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("我们以showGeneralDialog方法为例来看看它的具体实现："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""Future<T?> showGeneralDialog<T extends Object?>({
  required BuildContext context,
  required RoutePageBuilder pageBuilder,
  bool barrierDismissible = false,
  String? barrierLabel,
  Color barrierColor = const Color(0x80000000),
  Duration transitionDuration = const Duration(milliseconds: 200),
  RouteTransitionsBuilder? transitionBuilder,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
}) {
  return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(RawDialogRoute<T>(
    pageBuilder: pageBuilder,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    barrierColor: barrierColor,
    transitionDuration: transitionDuration,
    transitionBuilder: transitionBuilder,
    settings: routeSettings,
  ));
}"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("实现很简单，直接调用Navigator的push方法打开了一个新的对话框路由RawDialogRoute，然后返回了push的返回值。可见对话框实际上正是通过路由的形式实现的，这也是为什么我们可以使用Navigator的pop 方法来退出对话框的原因。关于对话框的样式定制在RawDialogRoute中，没有什么新的东西，读者可以自行查看。"),
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
                        alignment: Alignment.centerLeft,
                        child: const Text("对话框状态管理", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("我们在用户选择删除一个文件时，会询问是否删除此文件；在用户选择一个文件夹是，应该再让用户确认是否删除子文件夹。为了在用户选择了文件夹时避免二次弹窗确认是否删除子目录，我们在确认对话框底部添加一个“同时删除子目录？”的复选框。现在就有一个问题：如何管理复选框的选中状态？习惯上，我们会在路由页的State中来管理选中状态，然后，当我们运行上面的代码时我们会发现复选框根本选不中！为什么会这样呢？其实原因很简单，我们知道setState方法只会针对当前context的子树重新build，但是我们的对话框并不是在_DialogRouteState的build 方法中构建的，而是通过showDialog单独构建的，所以在_DialogRouteState的context中调用setState是无法影响通过showDialog构建的UI的。另外，我们可以从另外一个角度来理解这个现象，前面说过对话框也是通过路由的方式来实现的，那么上面的代码实际上就等同于企图在父路由中调用setState来让子路由更新，这显然是不行的！简尔言之，根本原因就是context不对。那如何让复选框可点击呢？通常有如下三种方法："),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("1.单独抽离出StatefulWidget", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("既然是context不对，那么直接的思路就是将复选框的选中逻辑单独封装成一个StatefulWidget，然后在其内部管理复选状态。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          show1(context);
                        }, child: textcontainer("方案1示例"),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("2.使用StatefulBuilder方法", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("上面的方法虽然能解决对话框状态更新的问题，但是有一个明显的缺点——对话框上所有可能会改变状态的组件都得单独封装在一个在内部管理状态的StatefulWidget中，这样不仅麻烦，而且复用性不大。因此，可以使用StatefulBuilder来简化"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          show2(context);
                        }, child: textcontainer("StatefulBuilder示例"),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("实际上，这种方法本质上就是子组件通知父组件（StatefulWidget）重新build子组件本身来实现UI更新的，读者可以对比代码理解。实际上StatefulBuilder正是Flutter SDK中提供的一个类，它和Builder的原理是一样的，在此，提醒读者一定要将StatefulBuilder和Builder理解透彻，因为它们在Flutter中是非常实用的。"),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("3.精妙的解法", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("是否还有更简单的解决方案呢？要确认这个问题，我们就得先搞清楚UI是怎么更新的，我们知道在调用setState方法后StatefulWidget就会重新build，那setState方法做了什么呢？我们能不能从中找到方法？顺着这个思路，我们就得看一下setState的核心源码："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""void setState(VoidCallback fn) {
  ... //省略无关代码
  _element.markNeedsBuild();
}"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("可以发现，setState中调用了Element的markNeedsBuild()方法，我们前面说过，Flutter是一个响应式框架，要更新UI只需改变状态后通知框架页面需要重构即可，而Element的markNeedsBuild()方法正是来实现这个功能的！markNeedsBuild()方法会将当前的Element对象标记为“dirty”（脏的），在每一个Frame，Flutter都会重新构建被标记为“dirty”Element对象。既然如此，我们有没有办法获取到对话框内部UI的Element对象，然后将其标示为为“dirty”呢？答案是肯定的！我们可以通过Context来得到Element对象，至于Element与Context的关系我们将会在后面“Flutter核心原理”一章中再深入介绍，现在只需要简单的认为：在组件树中，context实际上就是Element对象的引用。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          show3(context);
                        }, child: textcontainer("方案3示例"),),
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
                        alignment: Alignment.centerLeft,
                        child: const Text("其他类型的对话框", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("1.底部菜单列表", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          showBottomDialog(context: context);
                        },
                        child: textcontainer("底部菜单列表示例"),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("2.Loading框", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("其实Loading框可以直接通过showDialog+AlertDialog来自定义："),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          showLoadingDialog(context);
                          Future.delayed(
                              const Duration(seconds: 5), () => Navigator.of(context).pop());
                        }, child: textcontainer("Loading框示例 显示5s后取消"),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          showCustomSizeLoadingDialog(context);
                          Future.delayed(
                              const Duration(seconds: 5), () => Navigator.of(context).pop()
                          );
                        }, child: textcontainer("自定义宽度Loading框示例 显示5s后取消"),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("3.日历选择器", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          showMaterialDateSelector(context);
                        },
                          child: textcontainer("Material风格的日历选择器示例"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          showIOSDateSelector(context);
                        },
                          child: textcontainer("IOS风格的日历选择器示例"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }

  Future<bool?> showDeleteDialog(BuildContext context) {
    return showDialog<bool>(context: context, builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: const Text("您确定要删除当前文件吗？"),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("取消"),),

          TextButton(onPressed: () {
            Navigator.of(context).pop(true);
          }, child: const Text("确定"),),
        ],
      );
    });
  }

  Future<void> showDialogByGeneral(BuildContext context) async {
    bool? result = await showCustomDialog<bool>(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件夹吗？"),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("取消"),),
          TextButton(onPressed: () {
            Navigator.of(context).pop(true);
          }, child: const Text("删除"),)
        ],
      );
    },barrierDismissible: true);
    if(result != null) {
      print("确定删除");
    } else {
      print("取消删除");
    }
  }

  Future<void> show1(BuildContext context) async {
    bool _withTree = false;
    bool? result = await showDialog<bool>(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("提示"),
        content:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("您确定要删除当前文件吗？"),
            Row(
              children: [
                Text("同时删除子目录？"),
                DialogCheckbox(value: _withTree, onChanged: (bool? value) {
                  _withTree = !_withTree;
                },)
              ],
            )
          ],
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("取消"),),
          TextButton(onPressed: () {
            Navigator.of(context).pop(true);
          }, child: const Text("确定"),),
        ],
        );
    });
    if(result == null) {
      print("取消删除");
    } else {
      print("确定删除，${_withTree? "删除":"不删除"}子目录");
    }
  }

  Future<void> show2(BuildContext context) async {
    bool _withTree = false;
    bool? result = await showDialog<bool>(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("提示"),
        content:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("您确定要删除当前文件吗？"),
            Row(
              children: [
                const Text("同时删除子目录？"),
                StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
                  return Checkbox(value: _withTree, onChanged: (bool? value) {
                    setState(() {
                      _withTree = !_withTree;
                    });
                  },);
                },)
              ],
            )
          ],
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("取消"),),
          TextButton(onPressed: () {
            Navigator.of(context).pop(true);
          }, child: const Text("确定"),),
        ],
      );
    });
    if(result == null) {
      print("取消删除");
    } else {
      print("确定删除，${_withTree? "删除":"不删除"}子目录");
    }
  }

  Future<void> show3(BuildContext context) async {
    bool _withTree = false;
    bool? result = await showDialog<bool>(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("提示"),
        content:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("您确定要删除当前文件吗？"),
            Row(
              children: [
                const Text("同时删除子目录？"),
                Builder(builder: (BuildContext context) {
                  return Checkbox(value: _withTree, onChanged: (bool? value) {
                    (context as Element).markNeedsBuild();
                    _withTree = !_withTree;
                  },);
                },)
              ],
            )
          ],
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("取消"),),
          TextButton(onPressed: () {
            Navigator.of(context).pop(true);
          }, child: const Text("确定"),),
        ],
      );
    });
    if(result == null) {
      print("取消删除");
    } else {
      print("确定删除，${_withTree? "删除":"不删除"}子目录");
    }
  }

  Future<void> showBottomDialog({required BuildContext context}) async {
    int? index = await showModalBottomSheet(
      context: context, builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('$index'),
            onTap: () => Navigator.of(context).pop(index),
          );
        },);
    },);
    if (index != null) {
      print('click $index');
    }
  }

  Future<void> showLoadingDialog(BuildContext context) async {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(),
            Padding(padding: EdgeInsets.all(20), child: Text("正在加载，请稍后。。。"),),
          ],
        ),
      );
    },);
  }

  Future<void> showCustomSizeLoadingDialog(BuildContext context) async {
    showDialog(context: context, builder: (BuildContext context) {
      return UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: SizedBox(
          width: 280,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.all(20), child: Text("正在加载，请稍后。。。"),)
              ],
            ),
          ),
        ),
      );
    },);
  }

  Future<void> showMaterialDateSelector(BuildContext context) async {
    var date = DateTime.now();
    DateTime? time = await showDatePicker(context: context,
        initialDate: date,
        firstDate: date,
        lastDate: date.add(const Duration(days: 30)));

    if(time != null) {
      print(time.toString());
    }
  }

  Future<void> showIOSDateSelector(BuildContext context) async{
    DateTime time = DateTime.now();
    DateTime? date = await showCupertinoModalPopup(
      context: context, builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Container(
            color: Colors.white,
            child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            minimumDate: time,
            maximumDate: time.add(const Duration(days: 30)),
            maximumYear: time.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },),
          )
        );
    },);

    if(date != null) {
      print(date);
    }
  }
}

Future<void> showCustomListDialog(BuildContext context) async {
  int? index = await showDialog(context: context, builder: (BuildContext context) {
    var child = Column(
      children: [
        const ListTile(title: Text("请选择"),),
        Expanded(child: ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('$index'),
              onTap: () => Navigator.of(context).pop(index),
            );
          },),)
      ],
    );
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 280),
        child: Material(
          child: child,
          type: MaterialType.card,
        ),
      ),
    );
  });

  if(index != null) {
    print("点击了 ${index}");
  }}

Future<void> showListDialog(BuildContext context) async {
  int? index = await showDialog<int>(builder: (BuildContext context) {
    var child = Column(
      children: [
        const ListTile(title: Text("请选择"),),
        Expanded(child: ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('$index'),
              onTap: () => Navigator.of(context).pop(index),
            );
          },),)
      ],
    );
    return Dialog(child: child,);
  }, context: context);

  if(index != null) {
    print("点击了 ${index}");
  }
}

Future<int?> changeLanguage(BuildContext context) {
  return showDialog<int>(context: context, builder: (BuildContext context) {
    return SimpleDialog(
      title: const Text("请选择语言"),
      children: [
        SimpleDialogOption(
        onPressed: () {
          Navigator.of(context).pop(1);
        },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text("中文简体"),
          ),
    ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.of(context).pop(2);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text("美国英语"),
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text("取消选择"),
          ),
        ),
      ],
    );
  });
}

class DialogCheckbox extends StatefulWidget {
  const DialogCheckbox({Key? key, required this.value, required this.onChanged}) : super(key: key);
  final ValueChanged<bool?> onChanged;
  final bool? value;

  @override
  State<StatefulWidget> createState() {
    return _DialogCheckboxState();
  }
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool? value;
  @override
  void initState() {
    value = widget.value;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: value, onChanged: (bool? v) {
      widget.onChanged(v);
      setState(() {
        value = v;
      });
    },);
  }

}




