import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_components/buttons/back_button/back_button_widget.dart';
import '/global_components/buttons/pop_ups/jarbas_add_image_banner/jarbas_add_image_banner_widget.dart';
import '/global_components/buttons/pop_ups/jarbas_add_image_perfil/jarbas_add_image_perfil_widget.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/buttons/pop_ups/title/title_widget.dart';
import '/global_components/inputs/input_celular/input_celular_widget.dart';
import '/global_components/inputs/input_multi_selection/input_multi_selection_widget.dart';
import '/global_components/inputs/input_multiline/input_multiline_widget.dart';
import '/global_components/inputs/input_normal/input_normal_widget.dart';
import '/global_components/inputs/input_number/input_number_widget.dart';
import '/global_components/inputs/input_selection/input_selection_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_and_create_crud_empresas_widget.dart'
    show EditAndCreateCrudEmpresasWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAndCreateCrudEmpresasModel
    extends FlutterFlowModel<EditAndCreateCrudEmpresasWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  DocumentReference? municipioID;

  List<String> list = [];
  void addToList(String item) => list.add(item);
  void removeFromList(String item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, String item) => list.insert(index, item);
  void updateListAtIndex(int index, Function(String) updateFn) =>
      list[index] = updateFn(list[index]);

  bool saveDatas = false;

  List<String> labels = ['Sim', 'Não'];
  void addToLabels(String item) => labels.add(item);
  void removeFromLabels(String item) => labels.remove(item);
  void removeAtIndexFromLabels(int index) => labels.removeAt(index);
  void insertAtIndexInLabels(int index, String item) =>
      labels.insert(index, item);
  void updateLabelsAtIndex(int index, Function(String) updateFn) =>
      labels[index] = updateFn(labels[index]);

  List<String> values = ['DESTAQUE', 'NODESTAQUE'];
  void addToValues(String item) => values.add(item);
  void removeFromValues(String item) => values.remove(item);
  void removeAtIndexFromValues(int index) => values.removeAt(index);
  void insertAtIndexInValues(int index, String item) =>
      values.insert(index, item);
  void updateValuesAtIndex(int index, Function(String) updateFn) =>
      values[index] = updateFn(values[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in EditAndCreateCrudEmpresas widget.
  EmpresasRecord? callResultEmpresaById;
  // Model for backButton component.
  late BackButtonModel backButtonModel;
  // Model for Title component.
  late TitleModel titleModel;
  // Model for Nome.
  late InputNormalModel nomeModel;
  // Model for Descricao.
  late InputMultilineModel descricaoModel;
  // Model for inputCelular component.
  late InputCelularModel inputCelularModel;
  // Model for Email.
  late InputNormalModel emailModel;
  // Model for Categorias.
  late InputMultiSelectionModel categoriasModel;
  // Model for Endereco.
  late InputNormalModel enderecoModel;
  // Model for Muncipios.
  late InputMultiSelectionModel muncipiosModel;
  // Model for Bairros.
  late InputMultiSelectionModel bairrosModel;
  // State field(s) for IdentidadeVisual widget.
  late ExpandableController identidadeVisualExpandableController;

  // Model for JarbasAddImagePerfil component.
  late JarbasAddImagePerfilModel jarbasAddImagePerfilModel;
  // Model for JarbasAddImageBanner component.
  late JarbasAddImageBannerModel jarbasAddImageBannerModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Model for inputSelection component.
  late InputSelectionModel inputSelectionModel;
  // Model for inputNumber component.
  late InputNumberModel inputNumberModel;
  // Model for TaxaDeExistencia.
  late InputNumberModel taxaDeExistenciaModel;
  // Model for TaxaDeExistenciaSemDestaque.
  late InputNumberModel taxaDeExistenciaSemDestaqueModel;
  // Model for Salvar.
  late NormalButtonModel salvarModel;
  // Stores action output result for [Validate Form] action in Salvar widget.
  bool? indentificaoResult;
  // Stores action output result for [Action Block - teste] action in Salvar widget.
  bool? isAllSelectedUpdate;
  // Stores action output result for [Action Block - uploadFileToSupabaseBlock] action in Salvar widget.
  String? fotoUrlUpdate;
  // Stores action output result for [Action Block - uploadFileToSupabaseBlock] action in Salvar widget.
  String? bannerUrlUpdate;
  // Model for Adicionar.
  late NormalButtonModel adicionarModel;
  // Stores action output result for [Validate Form] action in Adicionar widget.
  bool? validationIndentificaoResult;
  // Stores action output result for [Action Block - teste] action in Adicionar widget.
  bool? isAllSelectedCreate;
  // Stores action output result for [Action Block - uploadFileToSupabaseBlock] action in Adicionar widget.
  String? fotoUrl;
  // Stores action output result for [Action Block - uploadFileToSupabaseBlock] action in Adicionar widget.
  String? bannerUrl;
  // Stores action output result for [Backend Call - Create Document] action in Adicionar widget.
  EmpresasRecord? resultCreateEmpresa;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    titleModel = createModel(context, () => TitleModel());
    nomeModel = createModel(context, () => InputNormalModel());
    descricaoModel = createModel(context, () => InputMultilineModel());
    inputCelularModel = createModel(context, () => InputCelularModel());
    emailModel = createModel(context, () => InputNormalModel());
    categoriasModel = createModel(context, () => InputMultiSelectionModel());
    enderecoModel = createModel(context, () => InputNormalModel());
    muncipiosModel = createModel(context, () => InputMultiSelectionModel());
    bairrosModel = createModel(context, () => InputMultiSelectionModel());
    jarbasAddImagePerfilModel =
        createModel(context, () => JarbasAddImagePerfilModel());
    jarbasAddImageBannerModel =
        createModel(context, () => JarbasAddImageBannerModel());
    inputSelectionModel = createModel(context, () => InputSelectionModel());
    inputNumberModel = createModel(context, () => InputNumberModel());
    taxaDeExistenciaModel = createModel(context, () => InputNumberModel());
    taxaDeExistenciaSemDestaqueModel =
        createModel(context, () => InputNumberModel());
    salvarModel = createModel(context, () => NormalButtonModel());
    adicionarModel = createModel(context, () => NormalButtonModel());
    nomeModel.textControllerValidator = _formTextFieldValidator1;
    descricaoModel.textControllerValidator = _formTextFieldValidator2;
    inputCelularModel.telefoneTextControllerValidator =
        _formTextFieldValidator3;
    emailModel.textControllerValidator = _formTextFieldValidator4;
    enderecoModel.textControllerValidator = _formTextFieldValidator5;
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    titleModel.dispose();
    nomeModel.dispose();
    descricaoModel.dispose();
    inputCelularModel.dispose();
    emailModel.dispose();
    categoriasModel.dispose();
    enderecoModel.dispose();
    muncipiosModel.dispose();
    bairrosModel.dispose();
    identidadeVisualExpandableController.dispose();
    jarbasAddImagePerfilModel.dispose();
    jarbasAddImageBannerModel.dispose();
    expandableExpandableController.dispose();
    inputSelectionModel.dispose();
    inputNumberModel.dispose();
    taxaDeExistenciaModel.dispose();
    taxaDeExistenciaSemDestaqueModel.dispose();
    salvarModel.dispose();
    adicionarModel.dispose();
  }

  /// Action blocks.
  Future<bool?> teste(BuildContext context) async {
    if (categoriasModel.listIsEmptyTrueValue?.length == 0) {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Categoria não selecionada!'),
            content: Text('Selecione ao menos um categoria!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      return false;
    }
    if (muncipiosModel.listIsEmptyTrueValue?.length == 0) {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Municipio não selecionado!'),
            content: Text('Selecione ao menos um municipio!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      return false;
    }
    if (bairrosModel.listIsEmptyTrueValue?.length == 0) {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Bairro não selecionado!'),
            content: Text('Selecione ao menos um um bairro!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      return false;
    }
    return true;
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'faskzbu2' /* Campo obrigatório! */,
      );
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'npomzf4y' /* Campo obrigatório! */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2cyphxyd' /* Campo obrigatório! */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator4(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2cyphxyd' /* Campo obrigatório! */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator5(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p8g3fz6v' /* Campo é obrigatório! */,
      );
    }

    return null;
  }
}
