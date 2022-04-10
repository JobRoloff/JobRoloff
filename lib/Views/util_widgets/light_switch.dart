
import 'package:carapp/Controllers/light_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LightSwitch extends StatefulWidget {
  const LightSwitch({ Key? key }) : super(key: key);
  @override
  State<LightSwitch> createState() => _LightSwitchState();
}


class _LightSwitchState extends State<LightSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: context.watch<LightProvider>().isDark!,
      onChanged: (bool boo) => 
          context.read<LightProvider>().flipLightSwitch(boo)
    );
  } 

}