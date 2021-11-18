import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/keys/item_selector_widget.dart';

class KeySelectorPage extends StatefulWidget {
  const KeySelectorPage({Key? key}) : super(key: key);

  @override
  _KeySelectorPageState createState() => _KeySelectorPageState();
}

class _KeySelectorPageState extends State<KeySelectorPage> {
  final List<String> items = ["gato", "perro", "pollo", "baca"];

  late final List<GlobalKey<ItemSelectorWidgetState>> _itemKeyList;

  late bool _available;

  bool get available => _available;

  set available(bool value) {
    setState(() {
      _available = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _itemKeyList = List.generate(
        items.length, (index) => GlobalKey<ItemSelectorWidgetState>());
    _available = false;
  }

  void _changeStateSelector() {
    available = !available;
  }

  void _submit() {
    print('estos son los items seleccionados');
    _itemKeyList.forEach((item) {
      if (item.currentState!.selected) print(item.currentState!.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ItemSelectorWidget(
            key: _itemKeyList[index],
            item: items[index],
            onLongPress: _changeStateSelector,
            available: _available,
            //onTap: _select,
          );
        },
        itemCount: items.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("submit"),
        onPressed: _submit,
      ),
    );
  }
}
