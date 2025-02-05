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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crud_edit_and_create_contrato_model.dart';
export 'crud_edit_and_create_contrato_model.dart';

class CrudEditAndCreateContratoWidget extends StatefulWidget {
  const CrudEditAndCreateContratoWidget({
    super.key,
    this.contratoID,
  });

  final DocumentReference? contratoID;

  @override
  State<CrudEditAndCreateContratoWidget> createState() =>
      _CrudEditAndCreateContratoWidgetState();
}

class _CrudEditAndCreateContratoWidgetState
    extends State<CrudEditAndCreateContratoWidget> {
  late CrudEditAndCreateContratoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrudEditAndCreateContratoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.contratoID != null) {
        _model.resultQueryContratoByID =
            await ContratacoesRecord.getDocumentOnce(widget!.contratoID!);
        safeSetState(() {
          _model.nomeDaVagaModel.textController?.text =
              _model.resultQueryContratoByID!.nomeDaVaga;
        });
        safeSetState(() {
          _model.descricaoDaVagaModel.textController?.text =
              _model.resultQueryContratoByID!.descricaoDaVaga;
        });
        _model.reload = true;
        safeSetState(() {});
      } else {
        _model.reload = true;
        safeSetState(() {});
      }
    });

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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.backButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: BackButtonWidget(
                        backFunction: () async {
                          context.goNamed('listCrudContratos');
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.titleModel,
                      updateCallback: () => safeSetState(() {}),
                      child: TitleWidget(
                        title: widget!.contratoID != null
                            ? 'Editar contratação'
                            : 'Adicionar contratação',
                      ),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              wrapWithModel(
                                model: _model.jarbasAddImageBannerModel,
                                updateCallback: () => safeSetState(() {}),
                                child: JarbasAddImageBannerWidget(
                                  imageUrl:
                                      _model.resultQueryContratoByID?.bannerUrl,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.nomeDaVagaModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InputNormalWidget(
                                  value: 'Nome da vaga',
                                  maxChar: 15,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.descricaoDaVagaModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InputMultilineWidget(
                                  value: 'Descrição da vaga',
                                  maxCharaters: 300,
                                ),
                              ),
                              if (_model.reload)
                                StreamBuilder<List<EmpresasRecord>>(
                                  stream: queryEmpresasRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: SpinKitFadingCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 40.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<EmpresasRecord>
                                        empresaIDEmpresasRecordList =
                                        snapshot.data!;

                                    return wrapWithModel(
                                      model: _model.empresaIDModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InputSelectionWidget(
                                        label:
                                            'Adicionar empresa responsável pela vaga',
                                        itemSelected: widget!.contratoID != null
                                            ? _model.resultQueryContratoByID!
                                                .empresaID
                                            : '',
                                        labelsList: empresaIDEmpresasRecordList
                                            .map((e) => e.nome)
                                            .toList(),
                                        valueList: empresaIDEmpresasRecordList
                                            .map((e) => e.empresaID)
                                            .toList(),
                                        functionOnselected: () async {},
                                      ),
                                    );
                                  },
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
                                          child: SpinKitFadingCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 40.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MunicipiosRecord>
                                        cidadeDaVagaMunicipiosRecordList =
                                        snapshot.data!;

                                    return wrapWithModel(
                                      model: _model.cidadeDaVagaModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InputSelectionWidget(
                                        label: 'Adicionar cidade da vaga',
                                        itemSelected: widget!.contratoID != null
                                            ? _model.resultQueryContratoByID!
                                                .cidadeDaVaga
                                            : '',
                                        labelsList:
                                            cidadeDaVagaMunicipiosRecordList
                                                .map((e) => e.nome)
                                                .toList(),
                                        valueList:
                                            cidadeDaVagaMunicipiosRecordList
                                                .map((e) => e.municipioID)
                                                .toList(),
                                        functionOnselected: () async {},
                                      ),
                                    );
                                  },
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
                                          child: SpinKitFadingCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 40.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MunicipiosRecord>
                                        tipoDaVagaMunicipiosRecordList =
                                        snapshot.data!;

                                    return wrapWithModel(
                                      model: _model.tipoDaVagaModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InputSelectionWidget(
                                        label: 'Defina o tipo da vaga',
                                        itemSelected: widget!.contratoID != null
                                            ? _model.resultQueryContratoByID!
                                                .tipoDaVaga
                                            : '',
                                        labelsList: _model.tipoDaVaga,
                                        valueList: _model.tipoDaVaga,
                                        functionOnselected: () async {},
                                      ),
                                    );
                                  },
                                ),
                            ].divide(SizedBox(height: 15.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (widget!.contratoID != null) {
                      return Builder(
                        builder: (context) => wrapWithModel(
                          model: _model.normalButtonModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: NormalButtonWidget(
                            text: 'Salvar alterações',
                            function: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.empresaIDModel.listIsEmptyTrueValue ==
                                  null) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Empresa não selecionada!'),
                                      content: Text(
                                          'Selecione a empresa responsavel!'),
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
                                return;
                              }
                              if (_model
                                      .cidadeDaVagaModel.listIsEmptyTrueValue ==
                                  null) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Cidade não selecionada'),
                                      content:
                                          Text('Selecione a cidade da vaga!'),
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
                                return;
                              }
                              if (_model.tipoDaVagaModel.listIsEmptyTrueValue ==
                                  null) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title:
                                          Text('Tipo da vaga não selecionado!'),
                                      content: Text(
                                          'Selecione o tipo da vaga para poder executar essa ação!'),
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
                                return;
                              }
                              _model.bannerUpdate =
                                  await action_blocks.uploadFileToSupabaseBlock(
                                context,
                                bucketName: 'contratacaoPerfil',
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
                              _model.resultQueryEmpresaByIdUpdate =
                                  await queryEmpresasRecordOnce(
                                queryBuilder: (empresasRecord) =>
                                    empresasRecord.where(
                                  'empresaID',
                                  isEqualTo: _model
                                      .empresaIDModel.listIsEmptyTrueValue,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await widget!.contratoID!
                                  .update(createContratacoesRecordData(
                                nomeDaVaga:
                                    _model.nomeDaVagaModel.textController.text,
                                descricaoDaVaga: _model
                                    .descricaoDaVagaModel.textController.text,
                                cidadeDaVaga: _model
                                    .cidadeDaVagaModel.listIsEmptyTrueValue,
                                empresaID:
                                    _model.empresaIDModel.listIsEmptyTrueValue,
                                tipoDaVaga:
                                    _model.tipoDaVagaModel.listIsEmptyTrueValue,
                                fotoUrl: _model
                                    .resultQueryEmpresaByIdUpdate?.fotoUrl,
                                bannerUrl: _model.bannerUpdate != null &&
                                        _model.bannerUpdate != ''
                                    ? _model.bannerUpdate
                                    : _model.resultQueryContratoByID?.bannerUrl,
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
                                        message:
                                            'Contrato atualizado com sucesso!',
                                        functionPopUp: () async {
                                          context
                                              .pushNamed('listCrudContratos');
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );

                              safeSetState(() {});
                            },
                          ),
                        ),
                      );
                    } else {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Builder(
                          builder: (context) => wrapWithModel(
                            model: _model.normalButtonModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: NormalButtonWidget(
                              text: 'Adicionar contratação',
                              function: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (_model
                                        .empresaIDModel.listIsEmptyTrueValue ==
                                    null) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Empresa não selecionada!'),
                                        content: Text(
                                            'Selecione a empresa responsavel!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                                if (_model.cidadeDaVagaModel
                                        .listIsEmptyTrueValue ==
                                    null) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Cidade não selecionada'),
                                        content:
                                            Text('Selecione a cidade da vaga!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                                if (_model
                                        .tipoDaVagaModel.listIsEmptyTrueValue ==
                                    null) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(
                                            'Tipo da vaga não selecionado!'),
                                        content: Text(
                                            'Selecione o tipo da vaga para poder executar essa ação!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                                _model.bannerCreate = await action_blocks
                                    .uploadFileToSupabaseBlock(
                                  context,
                                  bucketName: 'contratacaoPerfil',
                                  folderName: 'bannerPerfil',
                                  uploadFile: _model
                                      .jarbasAddImageBannerModel.uploadFile,
                                  hasUpload: _model.jarbasAddImageBannerModel
                                              .uploadFile !=
                                          null &&
                                      (_model.jarbasAddImageBannerModel
                                              .uploadFile?.bytes?.isNotEmpty ??
                                          false),
                                );
                                _model.resultQueryEmpresaById =
                                    await queryEmpresasRecordOnce(
                                  queryBuilder: (empresasRecord) =>
                                      empresasRecord.where(
                                    'empresaID',
                                    isEqualTo: _model
                                        .empresaIDModel.listIsEmptyTrueValue,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);

                                var contratacoesRecordReference =
                                    ContratacoesRecord.collection.doc();
                                await contratacoesRecordReference
                                    .set(createContratacoesRecordData(
                                  nomeDaVaga: _model
                                      .nomeDaVagaModel.textController.text,
                                  empresaID: _model
                                      .empresaIDModel.listIsEmptyTrueValue,
                                  descricaoDaVaga: _model
                                      .descricaoDaVagaModel.textController.text,
                                  cidadeDaVaga: _model
                                      .cidadeDaVagaModel.listIsEmptyTrueValue,
                                  tipoDaVaga: _model
                                      .tipoDaVagaModel.listIsEmptyTrueValue,
                                  fotoUrl:
                                      _model.resultQueryEmpresaById?.fotoUrl,
                                  bannerUrl: _model.bannerCreate,
                                ));
                                _model.resultQueryCreateContrato =
                                    ContratacoesRecord.getDocumentFromData(
                                        createContratacoesRecordData(
                                          nomeDaVaga: _model.nomeDaVagaModel
                                              .textController.text,
                                          empresaID: _model.empresaIDModel
                                              .listIsEmptyTrueValue,
                                          descricaoDaVaga: _model
                                              .descricaoDaVagaModel
                                              .textController
                                              .text,
                                          cidadeDaVaga: _model.cidadeDaVagaModel
                                              .listIsEmptyTrueValue,
                                          tipoDaVaga: _model.tipoDaVagaModel
                                              .listIsEmptyTrueValue,
                                          fotoUrl: _model
                                              .resultQueryEmpresaById?.fotoUrl,
                                          bannerUrl: _model.bannerCreate,
                                        ),
                                        contratacoesRecordReference);

                                await _model
                                    .resultQueryCreateContrato!.reference
                                    .update(createContratacoesRecordData(
                                  contratacaoID: _model
                                      .resultQueryCreateContrato?.reference.id,
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
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: SucessPopUpWidget(
                                          message:
                                              'Contratação criada com sucessso!',
                                          functionPopUp: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );

                                context.pushNamed(
                                  'CrudEditAndCreateContrato',
                                  queryParameters: {
                                    'contratoID': serializeParam(
                                      _model
                                          .resultQueryCreateContrato?.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );

                                safeSetState(() {});
                              },
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
