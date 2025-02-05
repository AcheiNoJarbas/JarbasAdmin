import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/more_button/more_button_widget.dart';
import '/pages/crud_contrato/components/pop_up_edit_delete_contratacoes/pop_up_edit_delete_contratacoes_widget.dart';
import 'dart:ui';
import 'card_contrato_widget.dart' show CardContratoWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardContratoModel extends FlutterFlowModel<CardContratoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for moreButton component.
  late MoreButtonModel moreButtonModel;

  @override
  void initState(BuildContext context) {
    moreButtonModel = createModel(context, () => MoreButtonModel());
  }

  @override
  void dispose() {
    moreButtonModel.dispose();
  }
}
