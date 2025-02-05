import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/medium_button/medium_button_widget.dart';
import '/global_components/buttons/pop_ups/title/title_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'jarbas_edit_taxas_widget.dart' show JarbasEditTaxasWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JarbasEditTaxasModel extends FlutterFlowModel<JarbasEditTaxasWidget> {
  ///  Local state fields for this component.

  bool load = false;

  ///  State fields for stateful widgets in this component.

  // Model for Title component.
  late TitleModel titleModel;
  // State field(s) for TaxaExist widget.
  FocusNode? taxaExistFocusNode;
  TextEditingController? taxaExistTextController;
  String? Function(BuildContext, String?)? taxaExistTextControllerValidator;
  // State field(s) for taxaDestaque widget.
  FocusNode? taxaDestaqueFocusNode;
  TextEditingController? taxaDestaqueTextController;
  String? Function(BuildContext, String?)? taxaDestaqueTextControllerValidator;
  // Model for mediumButton component.
  late MediumButtonModel mediumButtonModel;

  @override
  void initState(BuildContext context) {
    titleModel = createModel(context, () => TitleModel());
    mediumButtonModel = createModel(context, () => MediumButtonModel());
  }

  @override
  void dispose() {
    titleModel.dispose();
    taxaExistFocusNode?.dispose();
    taxaExistTextController?.dispose();

    taxaDestaqueFocusNode?.dispose();
    taxaDestaqueTextController?.dispose();

    mediumButtonModel.dispose();
  }
}
