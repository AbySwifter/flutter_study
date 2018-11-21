import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimatedListSample extends StatefulWidget {
  @override
  _AnimatedListSampleState createState() => new _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectedItem;
  int _nextItem; // The next item inserted when the user presses the '+' button.
  
  @override
  void initState() {
    super.initState();
    _list = new ListModel(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }
  
  Widget _buildRemovedItem(int item, BuildContext context, Animation<double> animation) {
    return new CardItem(animation: animation, item: item, selected: false);
  }
  
  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }
  
  void _insert() {
    final int index = _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }
  
  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }
  
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("AnimatedList"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.add_circle), onPressed: _insert, tooltip: 'insert a new item',),
          new IconButton(icon: const Icon(Icons.remove_circle), onPressed: _remove, tooltip: 'remove the selected item'),
        ],
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new AnimatedList(
          itemBuilder: _buildItem,
          key: _listKey,
          initialItemCount: _list.length,
        ),
      ),
    );
  }
}

class ListModel<E> {
  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initialItems,
  }) : assert(listKey != null),
       assert(removedItemBuilder != null),
       _items = new List<E>.from(initialItems ?? <E>[]);
  
  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;
  
  AnimatedListState get _animatedList => listKey.currentState;
  
  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }
  
  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }
  
  int get length => _items.length;
  E operator [](int index) => _items[index]; // 操作符重置
  int indexOf(E item) => _items.indexOf(item);
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    @required this.animation,
    this.onTap,
    @required this.item,
    this.selected: false,
  }) : assert(animation != null),
       assert(item != null && item >= 0),
       assert(selected != null),
       super(key: key);
  
  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;
  
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return new Padding(
      padding: const EdgeInsets.all(2.0),
      child: new SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: new SizedBox(
            height: 128.0,
            child: new Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: new Center(
                child:  new Text('Item $item', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}