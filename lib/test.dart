
    class Test {
      void method() {
        Person p1 = Person();

        Person p = Person();
        p.write();
      }
    }

    mixin Write {
      String word = 'hello world';

      void write() {
        print("a person can write : $word");
      }
    }

    mixin Read {
      bool word = false;

      void read() {

      }
    }
    class Person with Write /*,Read*/ {
      @override
      String get word => 'hello world + ';
    }


    class A {
      late String string;

      void run() {

      }
    }

    class B {
      late String string;

      void go() {

      }
    }

    class C implements A, B {
      @override
      String string = "";

      @override
      void go() {
        // TODO: implement go
      }

      @override
      void run() {
        // TODO: implement run
      }
    }

    mixin D {
      String d = "hello world! D";

      void run(){
        print("mixin keyword --- ${d}");
        int x = 65;
        print(x.toRadixString(2));

        List<int> codes = [65, 66];
        for (var element in codes) {
          print(String.fromCharCode(element));
        }
      }
    }

    abstract class F {
      void method1();
    }

    mixin E on F {

      // @override
      // set(String value) {
      //   // d = "hello world! E";
      // }

    }

    extension StringUtil on String{

      bool isNullOrEmpty(String? str) {
        print(str?.length);

        String a = str ?? '';

        str = "hello world";

        str!.length;
        return str == null || str.isEmpty;
        G g = G();
        print(g.getA);
      }

    }

    class G {
      int _a = 0;
      int get getA => _a;

      set setA(int value) {
        _a = value;
      }
    }

    typedef Operate = int Function(int, int);

class Test1 {

   void method() {
     Operate add = (a, b) {
       return a + b;
     };

     add.call(10, 20);
   }

   void method1({required int a, int b = 0}) {

   }
}
