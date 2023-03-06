
typedef void EventCallback(arg);

class EventBus {
  //私有构造函数
  EventBus._internal();

  //保存单例
  static EventBus _singleton = EventBus._internal();

  //工厂构造函数
  factory EventBus() => _singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  final _emap = Map<Object, List<EventCallback>?>();

  //添加订阅者
  void on(eventName, EventCallback f) {
    _emap[eventName] ??= <EventCallback>[];
    _emap[eventName]!.add(f);
  }

  void off(eventName, [EventCallback? f]) {
    var list = _emap[eventName];
    if(eventName == null || list == null) return;
    if(f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if(list == null) return;

    int len = list.length;
    for(var i = len - 1; i > -1;  --i){
      list[i](arg);
    }
  }
}

var bus = EventBus();
