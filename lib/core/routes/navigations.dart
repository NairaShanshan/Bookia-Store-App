import 'package:flutter/material.dart';


pushTo (context , Widget widgetName) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widgetName)) ;
}

pushReplacementTo (BuildContext context , Widget widgetName ){
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widgetName));
}


pop(context) {

  Navigator.pop(context) ;
}