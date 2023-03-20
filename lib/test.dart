
    class Test {
      void method() {
        Person p = new Person();
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
      }
    }

    mixin E on D {

      @override
      set(String value) {
        d = "hello world! E";
      }

      @override
      void run() {
        super.run();
      }
    }

    extension StringUtil on String{

      bool isNullOrEmpty(String? str) {
        return str == null || str.isEmpty;
      }

    }


