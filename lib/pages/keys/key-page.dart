import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/keys/container_widget.dart';

class KeyPage extends StatelessWidget {
  KeyPage({Key? key}) : super(key: key);

  /* @override
  State<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> { */
  final _container1key =
      GlobalKey<ContainerWidgetState>(debugLabel: "container1");
  final _container2key =
      GlobalKey<ContainerWidgetState>(debugLabel: "container2");

  final _containerKeyList =
      List.generate(5, (index) => GlobalKey<ContainerWidgetState>());

  void _submit() {
    //Color _colorContainer1 = _container1key.currentState!.color;

    //Color _colorContainer2 = _container2key.currentState!.color;
    for (final item in _containerKeyList) {
      Color itemColor = item.currentState!.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
            child: /* Column(
            children: [
              ContainerWidget(key: _container1key, initialColor: Colors.red),
              ContainerWidget(key: _container2key, initialColor: Colors.blue),
              RawMaterialButton(
                onPressed: _submit,
                child: Text("SUBMIT"),
              )
            ],
          ), */
                Column(
          children: [
            Container(
              height: 600,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return ContainerWidget(
                      key: _containerKeyList[index], initialColor: Colors.red);
                },
                itemCount: 5,
              ),
            ),
            RawMaterialButton(
              onPressed: _submit,
              child: Text("SUBMIT"),
            )
          ],
        )),
      ),
    );
  }
}
