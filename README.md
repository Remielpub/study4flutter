# study for flutter
《Flutter实战》第二版学习记录
https://book.flutterchina.club/

# Dart语法学习

---
theme: scrolls-light
highlight: arta
---
# 前言

最近学习Flutter，发现其使用的Dart语言，有些方面很像Java，有些方面又很像Kotlin，所以整理下目前发现的区别点，一方面方便自己记忆，另一方面也希望可以给尚未接触过Flutter小伙伴们提供一些帮助。（本文仅从Dart语言使用角度对比Java & Kotlin。）

# 1. 基本数据类型

Dart中，只有三种基本数据类型，数字型（`num`），布尔型（`bool`），字符串类型（`String`）。容器类型如List ，Map，是否属于基本数据类型，这里暂不讨论，毕竟使用也很简单。


|  类型   |        Dart        |          Java           |       Kotlin       |
|:-----:|:------------------:|:-----------------------:|:------------------:|
|  布尔   |        bool        |         boolean         |      Boolean       |
|  数字   | num (int / double) | int / double / long / char /byte ... | Int / Double /Long / Char / Byte... |
|  字符串  |       String       |         String          |       String       |

## 1.1 数字类型
- `num` 在Dart 中为抽象类，具有`int`及`double`两个实现类，使用`num` 为类型定义变量时,会进行变量类型推断，推断为对应的实现类（`int`/ `double`）。

    ```
        ///其中需要注意，Dart中num 同样可以作为数据类型使用，如:
        num a = 10; (整数型)
        num b = 10.0; （浮点型）  
    
        int c = 10; (整数型)
        double d = 10.00; （浮点型）
    ```
- int 类型不仅可以表示整形数字，还代表byte 及 char类型数据，具体使用方式如下：

    ```
        ///byte 类型
        int x = 65;
        print(x.toRadixString(2));// 输出 1000001
        
        ///char 类型
        List<int> codes = [65, 66];
        for(var element in codes) {
            print(String.fromCharCode(element); //输出 AB
        }
    ```
## 1.2 字符串类型

* 先看下Dart中字符串的定义，大概与Java 和 Kotlin相同：

        字符串定义:
        ///单引号定义字符串
        String e = 'hello world';
        String g = '''hello world''';
    
        ///双引号定义字符串
        String f = "hello world";
        String h = """hello world""";


* 其中使用三引号`'''`与`"""`时，会跟随文本换行，而双引号与单引号`""`与`''`不会，单引号主动换行需要借助`\n`换行符。单引号定义的字符串中可以包含双引号，双引号定义的字符串中可以包含单引号，
  同类引号中无法包含同类引号，如：

    ```    
        错误使用：
        String a = "----"hello world"----";
        String b = '----'hello world'----';
        
        正确使用：
        String a = '----"hello world"----';
        String b = "----'hello world'----";
    ```

* Dart 支持 Kotlin 字符串拼接方式：

    ```
        String name = "Child";
        String s = "$name, hello world, ${name}"
    ```

# 2.语法区别

Dart的语法与Java基本是相同的，只不过在细节上有些差异，Dart在Java基础上，进行了优化。Dart在Java基础上，进行了优化，使其更加简洁，方便。

## 2.1 构造函数

* Dart中类构造函数写法有很多种，既可以使用与Java完全一样的写法，也可以使用Dart特有写法，具体写入如下：

    ```
        Class TestA {
            int a = 0;
            int b = 0;
            ///与Java相同的基本写法
            TestA(int a, int b) {
                this.a = a;
                this.b = b;
            }
        
            ///Dart 特有构造写法，
            ///方式1:
            TestA(this.a, this.b);

            ///方式2:
            TestA(int x, int y)
                : this.a = x,
                  this.b = y;

            ///方式3:命名构造，与Kotlin中的扩展函数类似，但功能完全不同。
            TestA.instance(this.a, this.b);
       } 
    ```
  个人感觉，为了方便与Java区分，不建议使用与Java相同的构造写法，而且Dart特有的构造写法，更加简洁。

## 2.2 对象操作
* 对象创建：

    ```
        ///Dart中，可以和Java一样相同，使用new关键字创新对象
        TestA a = new TestA();
        
        ///同样也可以使用Kotlin方式一样，创建对象
        TestA b = TestA();
        var c = TestA();
    ```

* 对象属性赋值：

    ```
        ///通用赋值方式：
        TestA object = TestA();
        object.x = 10;
        object.y = 20;
        
        ///Dart特有赋值方式：
        TestA object = TestA()
            ..x = 10
            ..y = 20;
    ```
  Dart特有的赋值方式看起来有些奇怪，但是多看看也就习惯了，注意分号（`；`）在赋值结束后添加，赋值过程中不需要加。

## 2.3 空安全

* Dart 中拥有与Kotlin 相同的变量空安全机制。在定义可为空的变量时，需要在变量后加 ？，示例如下：

    ```
        class Test {
            String? x = null;
            
            void method() {
               ///当变量可能为null时，添加问号，检查对象是否为null，不为null时，才会实行
               print(x?.length);
               ///类似Java 三元表达式，Kotlin变量判断是否为null,若为null，则赋予对应值。
               String y = x ?? 'hello word';
               ///当非常非常非常确定，变量不为null时，可以使用！，强制声明变量肯定不为null
               print(x!.length);
            }
        }
    ```

## 2.4 可变参数
* Dart具有与Kotlin相同的可变参数的功能，只是实现方式有些许不同，示例如下：

    ```
        class Test() {
            ///命名参数，required修饰的参数都为必填
            void method1({required int a, required int b}) {
                print('add = ${a + b}');
            }
            
            ///默认参数，可以为参数赋予默认值，使用时，可以不传入该参数
            void method2({required int a, int b = 0}) {
                print('add = ${a + b}');
            }
            
            /// 位置参数，其特点是必须按顺序依次进行指定若干入参
            void method3(int a, [int b = 1, int c = 0]) {
               print('param: a = ${a}, b = ${b}, c = ${c}');
            }
            
            void test() {
                method1(a: 10, b 10);
                method2(a: 10);
                method3(10);
                method3(10, 20);
                method3(10, 20, 30);
            }
            
        }
    ```

# 3.关键字区别
这里将从Dart与Java不同的关键字，讲述不同的关键字对功能及编码方面的影响。

## 3.1 可见范围关键字
* Dart的类，方法，变量只有两种访问类型，可访问/不可访问：
* 在类名，方法名，变量名前添加 `_` (下划线)，即为外部类不可访问；没有 `_` (下划线)为可访问。
* 没有访问范围控制关键字，public, private, protect。

    ```
        class TestB {
            ///公共变量
           int a = 10;
           ///私有变量，仅能在本类中调用
           int _b = 20;
           ///常量定义， 与Kotlin中定义相同
           const c = 30; 
           ///相当于Kotlin的 lateinit,延迟初始化变量
           late String d;
           
           ///公共方法，可以供内部/外部类调用
           void method1() {
           
           }
           
           ///私有方法，只能在本类调用
           void _method2() {
               var object = _TestC();
           }
           
           //静态方法，与Java使用方式一致，TestB.method3() 调用
           static void method3() {
           }
        }
        
        ///私有类，访问范围在本.dart文件中(在TestB类中可以访问)，其他文件中无法访问
        class _TestC {
            
        }
    ```
## 3.2 interface & implement 使用区别：
* Dart中, 没有`interface` 接口关键字的定义，但是有`implement`。
* `implement` 关键字使用，可以实现所有类：抽象类及普通类，需要实现类中所有定义的变量及方法,如下图所示：
     ```
        implement 实现普通类:
        
        class BaseA {
            int x = 10;

            void method1() {
            }
        }

        class ImplementA implements BaseA {
            @override
            int x = 0;

            @override
            void method1() {
                //TODO
            }
        }
    ```

    ```
        implement 实现抽象类：
        
        abstract class BaseB {
            final int a = 0;
            
            void method1();
            
            void method2() {
            }
        }
        
        class ImplementB implement BaseB {
            @override
            //TODO
            int get a => 0;
            
            @overide
            void method1() {
                //TODO
            }
            
            @override
            void method2() {
                //TODO
            }
        }
    ```
* 与Java & Kotlin相同，一个类可以实现多个（接口）类。
* 接口二义性问题解决：当 C 类实现 A 、B 接口，会强制重写所有方法，成员变量提供 `get` 方法；即在当前类，方法只具有一种实现，变量值需重新赋值，这样就解决了二义性问题。示例如下：

    ```
        class C implement A, B {
            @override
            String str = 'hello world';
            
            @override
            void go() {
                //TODO
            }
        }
    ```

## 3.3 with & mixin 混入
* 含义：`with` & `mixin` 为Dart实现混入（mixins）的关键字，混入是指将一个类的代码插入到另一个类中，以增强该类的功能，而不需要创建一个新的子类。
* 作用：实现类功能扩展（可以同时混入多个）。比如Java & Kotlin 可以通过内部类的形式，来扩展类功能。
* 与普通类区别：混入类，没有构造方法，无法实例化。
* 与接口区别：接口只定义一类功能接口，没有完整功能实现；混入类需具备完整功能实现。


    ```
        ///混入类定义
        mixin Write {
            final String word = 'hello world';
            
            void write() {
                print('person can write: $word');
            }
        }
        
        ///一般类接入混入类，引入混入类实现功能
        class Person with Write {
            @override
            String get word => 'hello word! ++';
        }
        
        class Test {
            void method() {
                Person p = Person();
                p.write();
            }
        }
    ```

混入类功能与接口类似，所以同样存在二义性问题，那么混入类是如何解决二义性问题的呢？
* 如C 以先A ，后B顺序混入两个类，A, B 中都含有一个变量名name的字符串，混入C后，打印字符串name，显示的为后混入B类中name的值。
  即混入多个类时，若定义的相同类型&相同名称的变量，值为最后混入的类的值。
* 若变量名相同，但变量类型不同，同时混入会报错。


## 3.4 extension 拓展/扩展方法
* 这个功能与Kotlin的扩展方法是类似的，都可以在不修改类文件的前提下，扩展类方法。
* Kotlin不仅可以添加扩展方法，同时可以添加扩展变量。Dart只可以添加拓展方法。

    ```
        extension StringUtil on String {
            bool isNullorEmpty(String? str) {
                return str == null || str.isEmpty;
            }
        }
    ```

## 3.5 on 关键字。
* `on` 关键字用于混入类间，实现类似 `extends` 的关系。即混入类可以通过 `on` 关键字引入其他类的功能。需要注意的是，混入类不仅可以引入混入类，也可以引入普通类与抽象类。例如：

    ```
        mixin D {
            String d = 'hello word! D';
            
            void run() {
                print('on keyword --- ${d}')
            }
        }
        
        mixin E on D {
           @override
           set(String value) {
               d = value;
           }
           
           @override
           void run() {
               super.run();
           }
        }
    ```
* `on` 与 `extension` 配合使用，表示对哪个类进行扩展。

## 3.6 switch 关键字
* `switch` 关键字与Java中的功能相同，即判断执行分支。其中有一个需要注意的细节，Dart中，对象类型也可以作为分支判断条件。

    ```
        class Test {
            void method1() {
                Person p1 = Person();
                Person p2 = Person();
                Person p3 = Person();
                
                Person p = p1;
                switch(p) {
                    case p1:
                    //TODO
                    break;
                    case p2:
                    //TODO
                    break;
                    case p3:
                    //TODO
                    break;
                }
            }
        }
    ```
* Java中，判断对象只能为基本数据类型，如下图所示。

![20230316164610.jpg](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/44315ba102974918acf8c4bb7b8a4749~tplv-k3u1fbpfcp-watermark.image?)

## 3.7 set & get 关键字

* 与Kotlin类似，Dart提供了 `set` & `get`关键字，实现变量的 `setter` & `getter` 功能。示例如下：

    ```
        class Test {
            void method() {
                A a = A();
                print(' get value : ${a.getValue}');
                
                a.setValue(10);
                print(' get value : ${a.getValue}');
            }
        }
        
        class A {
            int _value = 0;
            
            int get getValue => _value;
            /// => 是Dart中的省略写法，完整方法如下：
            int get getValue {
                return _value;
            }
            
            set setValue(int value) {
                _value = value;
            }
        }
    ```

## 3.8 Function 函数对象
* 定义：函数对象与Kotlin的高阶函数类似，可以理解为函数对象类型的关键字；指定传入参数,执行对应代码块后，返回指定类型的返回值。这也是Dart 比 Java 更靠近万物皆对象的体现。
* 作用：与Kotlin的高阶函数功能一致，定义一类功能的实现规则。示例如下：

    ```
        typedef Operate = int Function(int, int);
        
        class Test {
            void method() {
                Operate add = (a, b) {
                    return a + b;
                }
                
                add.call(10, 20)
            }
        }
    ```

# 总结

总的来说，Dart语言与Java&Kotlin很多相似的地方，在最开始学习时，记住不同点，编码方面就不会有太多的阻碍。但是从语言设计层面看，Dart与Java&Kotlin还是有很大的区别，等我悟道之后，再和大家细说。
如果有需要完善，或者不认同的地方，欢迎大家留言评论。
  
  












    











    

