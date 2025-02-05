import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'input_number_widget.dart' show InputNumberWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputNumberModel extends FlutterFlowModel<InputNumberWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for InputNumberValue widget.
  FocusNode? inputNumberValueFocusNode;
  TextEditingController? inputNumberValueTextController;
  String? Function(BuildContext, String?)?
      inputNumberValueTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputNumberValueFocusNode?.dispose();
    inputNumberValueTextController?.dispose();
  }
}
