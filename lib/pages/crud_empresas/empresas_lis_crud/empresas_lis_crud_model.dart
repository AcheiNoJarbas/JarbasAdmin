import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_components/buttons/back_button/back_button_widget.dart';
import '/global_components/buttons/more_button/more_button_widget.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/title/title_widget.dart';
import '/pages/crud_empresas/components/pop_up_edit_delete_empresa/pop_up_edit_delete_empresa_widget.dart';
import 'dart:ui';
import 'empresas_lis_crud_widget.dart' show EmpresasLisCrudWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmpresasLisCrudModel extends FlutterFlowModel<EmpresasLisCrudWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for backButton component.
  late BackButtonModel backButtonModel;
  // Model for Title component.
  late TitleModel titleModel;
  // Model for normalButton component.
  late NormalButtonModel normalButtonModel;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    titleModel = createModel(context, () => TitleModel());
    normalButtonModel = createModel(context, () => NormalButtonModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    titleModel.dispose();
    normalButtonModel.dispose();
  }
}
