import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_components/buttons/back_button/back_button_widget.dart';
import '/global_components/buttons/pop_ups/jarbas_add_image_banner/jarbas_add_image_banner_widget.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/buttons/pop_ups/title/title_widget.dart';
import '/global_components/inputs/input_multiline/input_multiline_widget.dart';
import '/global_components/inputs/input_normal/input_normal_widget.dart';
import '/global_components/inputs/input_selection/input_selection_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'crud_edit_and_create_contrato_widget.dart'
    show CrudEditAndCreateContratoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CrudEditAndCreateContratoModel
    extends FlutterFlowModel<CrudEditAndCreateContratoWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  List<String> tipoDaVaga = ['Home Office', 'Presencial'];
  void addToTipoDaVaga(String item) => tipoDaVaga.add(item);
  void removeFromTipoDaVaga(String item) => tipoDaVaga.remove(item);
  void removeAtIndexFromTipoDaVaga(int index) => tipoDaVaga.removeAt(index);
  void insertAtIndexInTipoDaVaga(int index, String item) =>
      tipoDaVaga.insert(index, item);
  void updateTipoDaVagaAtIndex(int index, Function(String) updateFn) =>
      tipoDaVaga[index] = updateFn(tipoDaVaga[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in CrudEditAndCreateContrato widget.
  ContratacoesRecord? resultQueryContratoByID;
  // Model for backButton component.
  late BackButtonModel backButtonModel;
  // Model for Title component.
  late TitleModel titleModel;
  // Model for JarbasAddImageBanner component.
  late JarbasAddImageBannerModel jarbasAddImageBannerModel;
  // Model for nomeDaVaga.
  late InputNormalModel nomeDaVagaModel;
  // Model for descricaoDaVaga.
  late InputMultilineModel descricaoDaVagaModel;
  // Model for empresaID.
  late InputSelectionModel empresaIDModel;
  // Model for cidadeDaVaga.
  late InputSelectionModel cidadeDaVagaModel;
  // Model for tipoDaVaga.
  late InputSelectionModel tipoDaVagaModel;
  // Model for normalButton component.
  late NormalButtonModel normalButtonModel1;
  // Stores action output result for [Action Block - uploadFileToSupabaseBlock] action in normalButton widget.
  String? bannerUpdate;
  // Stores action output result for [Firestore Query - Query a collection] action in normalButton widget.
  EmpresasRecord? resultQueryEmpresaByIdUpdate;
  // Model for normalButton component.
  late NormalButtonModel normalButtonModel2;
  // Stores action output result for [Action Block - uploadFileToSupabaseBlock] action in normalButton widget.
  String? bannerCreate;
  // Stores action output result for [Firestore Query - Query a collection] action in normalButton widget.
  EmpresasRecord? resultQueryEmpresaById;
  // Stores action output result for [Backend Call - Create Document] action in normalButton widget.
  ContratacoesRecord? resultQueryCreateContrato;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    titleModel = createModel(context, () => TitleModel());
    jarbasAddImageBannerModel =
        createModel(context, () => JarbasAddImageBannerModel());
    nomeDaVagaModel = createModel(context, () => InputNormalModel());
    descricaoDaVagaModel = createModel(context, () => InputMultilineModel());
    empresaIDModel = createModel(context, () => InputSelectionModel());
    cidadeDaVagaModel = createModel(context, () => InputSelectionModel());
    tipoDaVagaModel = createModel(context, () => InputSelectionModel());
    normalButtonModel1 = createModel(context, () => NormalButtonModel());
    normalButtonModel2 = createModel(context, () => NormalButtonModel());
    nomeDaVagaModel.textControllerValidator = _formTextFieldValidator1;
    descricaoDaVagaModel.textControllerValidator = _formTextFieldValidator2;
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    titleModel.dispose();
    jarbasAddImageBannerModel.dispose();
    nomeDaVagaModel.dispose();
    descricaoDaVagaModel.dispose();
    empresaIDModel.dispose();
    cidadeDaVagaModel.dispose();
    tipoDaVagaModel.dispose();
    normalButtonModel1.dispose();
    normalButtonModel2.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cy5iq189' /* O nome da vaga é obrigatorio! */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '27najjpm' /* A descrição da vaga é obrigató... */,
      );
    }

    return null;
  }
}
