import 'package:flutter/material.dart';

class ItemSelectorWidget extends StatefulWidget {
  final VoidCallback? onLongPress;
  //final VoidCallback? onTap;
  final bool available;
  final String item;
  const ItemSelectorWidget(
      {Key? key, required this.item, required this.available, this.onLongPress})
      : super(key: key);

  @override
  ItemSelectorWidgetState createState() => ItemSelectorWidgetState();
}

class ItemSelectorWidgetState extends State<ItemSelectorWidget> {
  //late bool _available;

  late bool _selected;

  /* bool get available => _available;

  set available(bool value) {
    setState(() {
      _available = value;
    });
  } */

  String get value => widget.item;

  bool get selected => _selected;

  set selected(bool value) {
    if (widget.available) {
      setState(() {
        _selected = value;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_available = false;
    _selected = false;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: widget.onLongPress,
      /* onTap: widget.onTap, */
      title: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(widget.item)),
          ),
          if (widget.available)
            Expanded(
              flex: 1,
              child: Checkbox(
                  value: _selected,
                  onChanged: (val) {
                    selected = val!;
                  }),
            )
        ],
      ),
    );
  }
}
