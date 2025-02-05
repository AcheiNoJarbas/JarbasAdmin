import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/medium_button/medium_button_widget.dart';
import 'dart:ui';
import 'sucess_pop_up_widget.dart' show SucessPopUpWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SucessPopUpModel extends FlutterFlowModel<SucessPopUpWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for mediumButton component.
  late MediumButtonModel mediumButtonModel;

  @override
  void initState(BuildContext context) {
    mediumButtonModel = createModel(context, () => MediumButtonModel());
  }

  @override
  void dispose() {
    mediumButtonModel.dispose();
  }
}
