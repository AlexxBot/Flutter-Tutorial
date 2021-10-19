import 'package:flutter/material.dart';
import 'dart:math';

class ContainerWidget extends StatefulWidget {
  //final VoidCallback? onTap;
  final Color initialColor;
  final double height;
  final double width;
  final isSelected;
  const ContainerWidget(
      {Key? key /* , this.onTap */,
      required this.initialColor,
      this.height = 100,
      this.width = 100,
      this.isSelected = false})
      : super(key: key);

  @override
  ContainerWidgetState createState() => ContainerWidgetState();
}

class ContainerWidgetState extends State<ContainerWidget> {
  late Color _color;

  late bool _isSelected;

  Color get color => _color;

  set color(Color newColor) {
    setState(() {
      _color = newColor;
    });
  }

  bool get isSelected => _isSelected;

  set isSelected(bool _value) {
    setState(() {
      _isSelected = _value;
    });
  }

  Random _random = new Random();

  @override
  void initState() {
    super.initState();
    _color = widget.initialColor;
    _isSelected = widget.isSelected;
  }

  void _changeColor() {
    color = Color((_random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    isSelected = !_isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _changeColor,
      selectedTileColor: Colors.blue,
      selected: _isSelected,
      title: Text("hola "),
    );
    /* return InkWell(
      onTap: _changeColor,
      child: AnimatedContainer(
        margin: EdgeInsets.all(8),
        height: _isSelected ? widget.height * 1.5 : widget.height,
        width: _isSelected ? widget.width * 1.5 : widget.width,
        color: _color,
        curve: Curves.easeInOut,
        duration: Duration(seconds: 1),
      ),
    ); */
  }
}
