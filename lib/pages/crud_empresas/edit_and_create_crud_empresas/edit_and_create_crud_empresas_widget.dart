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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_and_create_crud_empresas_model.dart';
export 'edit_and_create_crud_empresas_model.dart';

class EditAndCreateCrudEmpresasWidget extends StatefulWidget {
  const EditAndCreateCrudEmpresasWidget({
    super.key,
    this.objectID,
  });

  final DocumentReference? objectID;

  @override
  State<EditAndCreateCrudEmpresasWidget> createState() =>
      _EditAndCreateCrudEmpresasWidgetState();
}

class _EditAndCreateCrudEmpresasWidgetState
    extends State<EditAndCreateCrudEmpresasWidget> {
  late EditAndCreateCrudEmpresasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool expandableListenerRegistered = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditAndCreateCrudEmpresasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.objectID != null) {
        _model.callResultEmpresaById =
            await EmpresasRecord.getDocumentOnce(widget!.objectID!);
        // SetNome
        safeSetState(() {
          _model.nomeModel.textController?.text =
              _model.callResultEmpresaById!.nome;
        });
        // SetDescricao
        safeSetState(() {
          _model.descricaoModel.textController?.text =
              _model.callResultEmpresaById!.descricao;
        });
        safeSetState(() {
          _model.inputCelularModel.telefoneTextController?.text =
              _model.callResultEmpresaById!.telefone;
          _model.inputCelularModel.telefoneMask.updateMask(
            newValue: TextEditingValue(
              text: _model.inputCelularModel.telefoneTextController!.text,
            ),
          );
        });
        // SetEmail
        safeSetState(() {
          _model.emailModel.textController?.text =
              _model.callResultEmpresaById!.email;
        });
        // SetEndereco
        safeSetState(() {
          _model.enderecoModel.textController?.text =
              _model.callResultEmpresaById!.endereco;
        });
        safeSetState(() {
          _model.inputNumberModel.inputNumberValueTextController?.text =
              _model.callResultEmpresaById!.taxaDestaque;
        });
        safeSetState(() {
          _model.taxaDeExistenciaModel.inputNumberValueTextController?.text =
              _model.callResultEmpresaById!.taxaExistencia;
        });
        safeSetState(() {
          _model.taxaDeExistenciaSemDestaqueModel.inputNumberValueTextController
              ?.text = _model.callResultEmpresaById!.taxaExistencia;
        });
        _model.reload = true;
        safeSetState(() {});
      } else {
        _model.reload = true;
        safeSetState(() {});
      }
    });

    _model.identidadeVisualExpandableController =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.backButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BackButtonWidget(
                      backFunction: () async {
                        context.safePop();
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.titleModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TitleWidget(
                      title: widget!.objectID != null
                          ? 'Editar Empresa'
                          : 'Adicionar Empresa',
                    ),
                  ),
                ].divide(SizedBox(width: 20.0)),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.nomeModel,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: InputNormalWidget(
                                        value: 'Nome da Empresa',
                                        maxChar: 25,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.descricaoModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InputMultilineWidget(
                                        value: 'Descrição da empresa',
                                        maxCharaters: 400,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.inputCelularModel,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: InputCelularWidget(
                                        value: 'Telefone da empresa',
                                        action: () async {
                                          safeSetState(() {
                                            _model
                                                    .inputCelularModel
                                                    .telefoneTextController
                                                    ?.text =
                                                functions.formatToPhoneNumber(
                                                    _model
                                                        .inputCelularModel
                                                        .telefoneTextController
                                                        .text);
                                            _model
                                                .inputCelularModel.telefoneMask
                                                .updateMask(
                                              newValue: TextEditingValue(
                                                text: _model
                                                    .inputCelularModel
                                                    .telefoneTextController!
                                                    .text,
                                              ),
                                            );
                                          });
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.emailModel,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: InputNormalWidget(
                                        value: 'Email da Empresa',
                                      ),
                                    ),
                                    if (_model.reload)
                                      StreamBuilder<List<CategoriasRecord>>(
                                        stream: queryCategoriasRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CategoriasRecord>
                                              categoriasCategoriasRecordList =
                                              snapshot.data!;

                                          return wrapWithModel(
                                            model: _model.categoriasModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child: InputMultiSelectionWidget(
                                              label: 'Categorias',
                                              labelsList:
                                                  categoriasCategoriasRecordList
                                                      .map((e) => e.nome)
                                                      .toList(),
                                              valueList:
                                                  categoriasCategoriasRecordList
                                                      .map((e) => e.nome)
                                                      .toList(),
                                              itensSelected: widget!.objectID !=
                                                      null
                                                  ? _model
                                                      .callResultEmpresaById!
                                                      .categorias
                                                  : _model.list,
                                            ),
                                          );
                                        },
                                      ),
                                    wrapWithModel(
                                      model: _model.enderecoModel,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: InputNormalWidget(
                                        value: 'Endereço da Empresa',
                                      ),
                                    ),
                                    if (_model.reload)
                                      StreamBuilder<List<MunicipiosRecord>>(
                                        stream: queryMunicipiosRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<MunicipiosRecord>
                                              muncipiosMunicipiosRecordList =
                                              snapshot.data!;

                                          return wrapWithModel(
                                            model: _model.muncipiosModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child: InputMultiSelectionWidget(
                                              label: 'Municipios',
                                              labelsList:
                                                  muncipiosMunicipiosRecordList
                                                      .map((e) => e.nome)
                                                      .toList(),
                                              valueList:
                                                  muncipiosMunicipiosRecordList
                                                      .map((e) => e.municipioID)
                                                      .toList(),
                                              itensSelected: widget!.objectID !=
                                                      null
                                                  ? _model
                                                      .callResultEmpresaById!
                                                      .municipios
                                                  : _model.list,
                                            ),
                                          );
                                        },
                                      ),
                                    if (_model.reload)
                                      StreamBuilder<List<BairrosRecord>>(
                                        stream: queryBairrosRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<BairrosRecord>
                                              bairrosBairrosRecordList =
                                              snapshot.data!;

                                          return wrapWithModel(
                                            model: _model.bairrosModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child: InputMultiSelectionWidget(
                                              label: 'Bairros',
                                              labelsList:
                                                  bairrosBairrosRecordList
                                                      .map((e) => e.nome)
                                                      .toList(),
                                              valueList:
                                                  bairrosBairrosRecordList
                                                      .map(
                                                          (e) => e.reference.id)
                                                      .toList(),
                                              itensSelected: widget!.objectID !=
                                                      null
                                                  ? _model
                                                      .callResultEmpresaById!
                                                      .bairros
                                                  : _model.list,
                                            ),
                                          );
                                        },
                                      ),
                                  ]
                                      .divide(SizedBox(height: 15.0))
                                      .addToStart(SizedBox(height: 15.0))
                                      .addToEnd(SizedBox(height: 15.0)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                color: Color(0x00000000),
                                child: ExpandableNotifier(
                                  controller: _model
                                      .identidadeVisualExpandableController,
                                  child: ExpandablePanel(
                                    header: Text(
                                      FFLocalizations.of(context).getText(
                                        'gfi8kjj7' /* Indentidade visual */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    collapsed: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'mrlj0co7' /* Click aqui para adicionar/alte... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color: Color(0x8A000000),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    expanded: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'cdklucw7' /* Foto de perfil da empresa */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        wrapWithModel(
                                          model:
                                              _model.jarbasAddImagePerfilModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: JarbasAddImagePerfilWidget(
                                            imageUrl: _model
                                                .callResultEmpresaById?.fotoUrl,
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'vj2r2bjd' /* Banner da empresa */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        wrapWithModel(
                                          model:
                                              _model.jarbasAddImageBannerModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: JarbasAddImageBannerWidget(
                                            imageUrl: _model
                                                .callResultEmpresaById
                                                ?.bannerUrl,
                                          ),
                                        ),
                                      ],
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: true,
                                      tapBodyToCollapse: true,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                    ),
                                  ),
                                ),
                              ),
                              if (_model.reload)
                                Builder(builder: (_) {
                                  if (!expandableListenerRegistered) {
                                    expandableListenerRegistered = true;
                                    _model.expandableExpandableController
                                        .addListener(
                                      () async {
                                        if (widget!.objectID?.id != null &&
                                            widget!.objectID?.id != '') {
                                          safeSetState(() {
                                            _model
                                                    .inputNumberModel
                                                    .inputNumberValueTextController
                                                    ?.text =
                                                _model.callResultEmpresaById!
                                                    .taxaDestaque;
                                          });
                                          safeSetState(() {
                                            _model
                                                    .taxaDeExistenciaModel
                                                    .inputNumberValueTextController
                                                    ?.text =
                                                _model.callResultEmpresaById!
                                                    .taxaExistencia;
                                          });
                                          safeSetState(() {
                                            _model
                                                    .taxaDeExistenciaSemDestaqueModel
                                                    .inputNumberValueTextController
                                                    ?.text =
                                                _model.callResultEmpresaById!
                                                    .taxaExistencia;
                                          });
                                        }
                                      },
                                    );
                                  }
                                  return Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller:
                                          _model.expandableExpandableController,
                                      child: ExpandablePanel(
                                        header: Text(
                                          FFLocalizations.of(context).getText(
                                            '8dcc38hp' /* Taxas de usabilidade */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        collapsed: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7bzxv34p' /* Click para adicionar /alterar ... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            Color(0x8A000000),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            wrapWithModel(
                                              model: _model.inputSelectionModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: InputSelectionWidget(
                                                label: 'Em destaque',
                                                itemSelected: widget!
                                                            .objectID !=
                                                        null
                                                    ? (_model
                                                            .callResultEmpresaById!
                                                            .inDestaque
                                                        ? 'DESTAQUE'
                                                        : 'NODESTAQUE')
                                                    : 'NODESTAQUE',
                                                labelsList: _model.labels,
                                                valueList: _model.values,
                                                functionOnselected: () async {},
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                if (_model.inputSelectionModel
                                                        .listIsEmptyTrueValue ==
                                                    'DESTAQUE') {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .inputNumberModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              InputNumberWidget(
                                                            value:
                                                                'Taxa de destaque',
                                                            action: () async {
                                                              safeSetState(() {
                                                                _model
                                                                        .inputNumberModel
                                                                        .inputNumberValueTextController
                                                                        ?.text =
                                                                    functions.formatToBRLCurrency(_model
                                                                        .inputNumberModel
                                                                        .inputNumberValueTextController
                                                                        .text);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .taxaDeExistenciaModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            InputNumberWidget(
                                                          value: 'Mensal',
                                                          action: () async {
                                                            safeSetState(() {
                                                              _model
                                                                      .taxaDeExistenciaModel
                                                                      .inputNumberValueTextController
                                                                      ?.text =
                                                                  functions.formatToBRLCurrency(_model
                                                                      .taxaDeExistenciaModel
                                                                      .inputNumberValueTextController
                                                                      .text);
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 15.0)),
                                                  );
                                                } else {
                                                  return wrapWithModel(
                                                    model: _model
                                                        .taxaDeExistenciaSemDestaqueModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child: InputNumberWidget(
                                                      value: 'Mensal',
                                                      action: () async {
                                                        safeSetState(() {
                                                          _model
                                                                  .taxaDeExistenciaSemDestaqueModel
                                                                  .inputNumberValueTextController
                                                                  ?.text =
                                                              functions.formatToBRLCurrency(_model
                                                                  .taxaDeExistenciaSemDestaqueModel
                                                                  .inputNumberValueTextController
                                                                  .text);
                                                        });
                                                      },
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ]
                                              .divide(SizedBox(height: 15.0))
                                              .addToStart(
                                                  SizedBox(height: 20.0))
                                              .addToEnd(SizedBox(height: 20.0)),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            ]
                                .divide(SizedBox(height: 5.0))
                                .addToEnd(SizedBox(height: 20.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  if (widget!.objectID != null) {
                    return Builder(
                      builder: (context) => wrapWithModel(
                        model: _model.salvarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NormalButtonWidget(
                          text: 'Salvar Alterações',
                          function: () async {
                            _model.indentificaoResult = true;
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              _model.indentificaoResult = false;
                            }
                            if (_model.categoriasModel.listIsEmptyTrueValue ==
                                null) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Categorias não selecionadas!'),
                                    content: Text(
                                        'Selecione ao menos uma categoria!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              _model.indentificaoResult = false;
                            }
                            _model.isAllSelectedUpdate =
                                await _model.teste(context);
                            if (_model.isAllSelectedUpdate!) {
                              _model.fotoUrlUpdate =
                                  await action_blocks.uploadFileToSupabaseBlock(
                                context,
                                bucketName: 'PerfilEmpresas',
                                folderName: 'imagePerfil',
                                uploadFile:
                                    _model.jarbasAddImagePerfilModel.uploadFile,
                                hasUpload: _model.jarbasAddImagePerfilModel
                                            .uploadFile !=
                                        null &&
                                    (_model.jarbasAddImagePerfilModel.uploadFile
                                            ?.bytes?.isNotEmpty ??
                                        false),
                              );
                              _model.bannerUrlUpdate =
                                  await action_blocks.uploadFileToSupabaseBlock(
                                context,
                                bucketName: 'PerfilEmpresas',
                                folderName: 'bannerPerfil',
                                uploadFile:
                                    _model.jarbasAddImageBannerModel.uploadFile,
                                hasUpload: _model.jarbasAddImageBannerModel
                                            .uploadFile !=
                                        null &&
                                    (_model.jarbasAddImageBannerModel.uploadFile
                                            ?.bytes?.isNotEmpty ??
                                        false),
                              );

                              await widget!.objectID!.update({
                                ...createEmpresasRecordData(
                                  nome: _model.nomeModel.textController.text !=
                                              null &&
                                          _model.nomeModel.textController
                                                  .text !=
                                              ''
                                      ? _model.nomeModel.textController.text
                                      : _model.resultCreateEmpresa?.nome,
                                  descricao: _model.descricaoModel
                                                  .textController.text !=
                                              null &&
                                          _model.descricaoModel.textController
                                                  .text !=
                                              ''
                                      ? _model.nomeModel.textController.text
                                      : _model.resultCreateEmpresa?.descricao,
                                  telefone: _model.inputCelularModel
                                      .telefoneTextController.text,
                                  email: _model.emailModel.textController
                                                  .text !=
                                              null &&
                                          _model.emailModel.textController
                                                  .text !=
                                              ''
                                      ? _model.emailModel.textController.text
                                      : _model.resultCreateEmpresa?.email,
                                  endereco: _model.enderecoModel.textController
                                                  .text !=
                                              null &&
                                          _model.enderecoModel.textController
                                                  .text !=
                                              ''
                                      ? _model.enderecoModel.textController.text
                                      : _model.resultCreateEmpresa?.endereco,
                                  fotoUrl: _model.fotoUrlUpdate != null &&
                                          _model.fotoUrlUpdate != ''
                                      ? _model.fotoUrlUpdate
                                      : _model.callResultEmpresaById?.fotoUrl,
                                  bannerUrl: _model.bannerUrlUpdate != null &&
                                          _model.bannerUrlUpdate != ''
                                      ? _model.bannerUrlUpdate
                                      : _model.callResultEmpresaById?.bannerUrl,
                                  taxaExistencia: _model.inputSelectionModel
                                              .listIsEmptyTrueValue ==
                                          'DESTAQUE'
                                      ? _model.taxaDeExistenciaModel
                                          .inputNumberValueTextController.text
                                      : _model.taxaDeExistenciaSemDestaqueModel
                                          .inputNumberValueTextController.text,
                                  taxaDestaque: _model.inputNumberModel
                                      .inputNumberValueTextController.text,
                                  inDestaque: _model.inputSelectionModel
                                          .listIsEmptyTrueValue ==
                                      'DESTAQUE',
                                ),
                                ...mapToFirestore(
                                  {
                                    'bairros': _model.bairrosModel
                                                    .listIsEmptyTrueValue !=
                                                null &&
                                            (_model.bairrosModel
                                                    .listIsEmptyTrueValue)!
                                                .isNotEmpty
                                        ? _model
                                            .bairrosModel.listIsEmptyTrueValue
                                        : _model.callResultEmpresaById?.bairros,
                                    'municipios': _model.muncipiosModel
                                                    .listIsEmptyTrueValue !=
                                                null &&
                                            (_model.muncipiosModel
                                                    .listIsEmptyTrueValue)!
                                                .isNotEmpty
                                        ? _model
                                            .muncipiosModel.listIsEmptyTrueValue
                                        : _model
                                            .callResultEmpresaById?.municipios,
                                    'categorias': _model.categoriasModel
                                                    .listIsEmptyTrueValue !=
                                                null &&
                                            (_model.categoriasModel
                                                    .listIsEmptyTrueValue)!
                                                .isNotEmpty
                                        ? _model.categoriasModel
                                            .listIsEmptyTrueValue
                                        : _model
                                            .callResultEmpresaById?.categorias,
                                  },
                                ),
                              });
                              _model.reload = true;
                              _model.saveDatas = true;
                              safeSetState(() {});
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: SucessPopUpWidget(
                                        message:
                                            'As alterações foram salvas com sucesso',
                                        functionPopUp: () async {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            }

                            safeSetState(() {});
                          },
                        ),
                      ),
                    );
                  } else {
                    return Builder(
                      builder: (context) => wrapWithModel(
                        model: _model.adicionarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NormalButtonWidget(
                          text: 'Adicionar Empresa',
                          function: () async {
                            _model.validationIndentificaoResult = true;
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              safeSetState(() =>
                                  _model.validationIndentificaoResult = false);
                              return;
                            }
                            if (_model.categoriasModel.listIsEmptyTrueValue ==
                                null) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Categorias não selecionadas!'),
                                    content: Text(
                                        'Selecione ao menos uma categoria!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              _model.validationIndentificaoResult = false;
                              safeSetState(() {});
                              return;
                            }
                            _model.isAllSelectedCreate =
                                await _model.teste(context);
                            if (_model.isAllSelectedCreate!) {
                              _model.fotoUrl =
                                  await action_blocks.uploadFileToSupabaseBlock(
                                context,
                                bucketName: 'PerfilEmpresas',
                                folderName: 'imagePerfil',
                                uploadFile:
                                    _model.jarbasAddImagePerfilModel.uploadFile,
                                hasUpload: _model.jarbasAddImagePerfilModel
                                            .uploadFile !=
                                        null &&
                                    (_model.jarbasAddImagePerfilModel.uploadFile
                                            ?.bytes?.isNotEmpty ??
                                        false),
                              );
                              _model.bannerUrl =
                                  await action_blocks.uploadFileToSupabaseBlock(
                                context,
                                bucketName: 'PerfilEmpresas',
                                folderName: 'bannerPerfil',
                                uploadFile:
                                    _model.jarbasAddImageBannerModel.uploadFile,
                                hasUpload: _model.jarbasAddImageBannerModel
                                            .uploadFile !=
                                        null &&
                                    (_model.jarbasAddImageBannerModel.uploadFile
                                            ?.bytes?.isNotEmpty ??
                                        false),
                              );

                              var empresasRecordReference =
                                  EmpresasRecord.collection.doc();
                              await empresasRecordReference.set({
                                ...createEmpresasRecordData(
                                  nome: _model.nomeModel.textController.text,
                                  descricao:
                                      _model.descricaoModel.textController.text,
                                  telefone: _model.inputCelularModel
                                      .telefoneTextController.text,
                                  email: _model.emailModel.textController.text,
                                  endereco:
                                      _model.enderecoModel.textController.text,
                                  fotoUrl: _model.fotoUrl,
                                  bannerUrl: _model.bannerUrl,
                                  empresaID: '',
                                  taxaExistencia: _model.inputSelectionModel
                                              .listIsEmptyTrueValue ==
                                          'DESTAQUE'
                                      ? _model.taxaDeExistenciaModel
                                          .inputNumberValueTextController.text
                                      : _model.taxaDeExistenciaSemDestaqueModel
                                          .inputNumberValueTextController.text,
                                  taxaDestaque: _model.inputNumberModel
                                      .inputNumberValueTextController.text,
                                  inDestaque: _model.inputSelectionModel
                                          .listIsEmptyTrueValue ==
                                      'DESTAQUE',
                                ),
                                ...mapToFirestore(
                                  {
                                    'bairros': _model
                                        .bairrosModel.listIsEmptyTrueValue,
                                    'municipios': _model
                                        .muncipiosModel.listIsEmptyTrueValue,
                                    'categorias': _model
                                        .categoriasModel.listIsEmptyTrueValue,
                                  },
                                ),
                              });
                              _model.resultCreateEmpresa =
                                  EmpresasRecord.getDocumentFromData({
                                ...createEmpresasRecordData(
                                  nome: _model.nomeModel.textController.text,
                                  descricao:
                                      _model.descricaoModel.textController.text,
                                  telefone: _model.inputCelularModel
                                      .telefoneTextController.text,
                                  email: _model.emailModel.textController.text,
                                  endereco:
                                      _model.enderecoModel.textController.text,
                                  fotoUrl: _model.fotoUrl,
                                  bannerUrl: _model.bannerUrl,
                                  empresaID: '',
                                  taxaExistencia: _model.inputSelectionModel
                                              .listIsEmptyTrueValue ==
                                          'DESTAQUE'
                                      ? _model.taxaDeExistenciaModel
                                          .inputNumberValueTextController.text
                                      : _model.taxaDeExistenciaSemDestaqueModel
                                          .inputNumberValueTextController.text,
                                  taxaDestaque: _model.inputNumberModel
                                      .inputNumberValueTextController.text,
                                  inDestaque: _model.inputSelectionModel
                                          .listIsEmptyTrueValue ==
                                      'DESTAQUE',
                                ),
                                ...mapToFirestore(
                                  {
                                    'bairros': _model
                                        .bairrosModel.listIsEmptyTrueValue,
                                    'municipios': _model
                                        .muncipiosModel.listIsEmptyTrueValue,
                                    'categorias': _model
                                        .categoriasModel.listIsEmptyTrueValue,
                                  },
                                ),
                              }, empresasRecordReference);

                              await _model.resultCreateEmpresa!.reference
                                  .update(createEmpresasRecordData(
                                empresaID:
                                    _model.resultCreateEmpresa?.reference.id,
                              ));
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: SucessPopUpWidget(
                                        message: 'Empresa criada com sucesso',
                                        functionPopUp: () async {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );

                              context.pushNamed('empresasLisCrud');
                            }

                            safeSetState(() {});
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
