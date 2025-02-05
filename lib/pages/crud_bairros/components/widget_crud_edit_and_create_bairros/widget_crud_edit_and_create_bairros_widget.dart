import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/inputs/input_normal/input_normal_widget.dart';
import '/global_components/inputs/input_selection/input_selection_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'widget_crud_edit_and_create_bairros_model.dart';
export 'widget_crud_edit_and_create_bairros_model.dart';

class WidgetCrudEditAndCreateBairrosWidget extends StatefulWidget {
  const WidgetCrudEditAndCreateBairrosWidget({
    super.key,
    this.bairroID,
  });

  final DocumentReference? bairroID;

  @override
  State<WidgetCrudEditAndCreateBairrosWidget> createState() =>
      _WidgetCrudEditAndCreateBairrosWidgetState();
}

class _WidgetCrudEditAndCreateBairrosWidgetState
    extends State<WidgetCrudEditAndCreateBairrosWidget> {
  late WidgetCrudEditAndCreateBairrosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetCrudEditAndCreateBairrosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.bairroID != null) {
        _model.resultRequestBairroByID =
            await BairrosRecord.getDocumentOnce(widget!.bairroID!);
        safeSetState(() {
          _model.cityNameModel.textController?.text =
              _model.resultRequestBairroByID!.nome;
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          border: Border.all(
            color: Color(0xFF5B00FF),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 100.0,
                    buttonSize: 50.0,
                    fillColor: Color(0x003751A6),
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    wrapWithModel(
                      model: _model.cityNameModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: InputNormalWidget(
                        value: 'Adicione o nome do bairro',
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
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<MunicipiosRecord>
                              municipioNameMunicipiosRecordList =
                              snapshot.data!;

                          return wrapWithModel(
                            model: _model.municipioNameModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: InputSelectionWidget(
                              label: 'Adicione municipio do bairro',
                              itemSelected: widget!.bairroID != null
                                  ? _model.resultRequestBairroByID!.municipio
                                  : '',
                              labelsList: municipioNameMunicipiosRecordList
                                  .map((e) => e.nome)
                                  .toList(),
                              valueList: municipioNameMunicipiosRecordList
                                  .map((e) => e.nome)
                                  .toList(),
                              hintText: '',
                              functionOnselected: () async {
                                _model.resultDropdwonRequest =
                                    await queryMunicipiosRecordOnce(
                                  queryBuilder: (municipiosRecord) =>
                                      municipiosRecord.where(
                                    'Nome',
                                    isEqualTo: _model.municipioNameModel
                                        .listIsEmptyTrueValue,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _model.municipioObject =
                                    _model.resultDropdwonRequest;
                                _model.muncipioSelected = true;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                            ),
                          );
                        },
                      ),
                    if (_model.muncipioSelected)
                      StreamBuilder<List<EstadosRecord>>(
                        stream: queryEstadosRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<EstadosRecord> stateCodeEstadosRecordList =
                              snapshot.data!;

                          return wrapWithModel(
                            model: _model.stateCodeModel,
                            updateCallback: () => safeSetState(() {}),
                            child: InputSelectionWidget(
                              label: 'Estado',
                              itemSelected: '',
                              labelsList: _model.emptyList,
                              valueList: _model.emptyList,
                              hintText: widget!.bairroID != null
                                  ? _model.resultRequestBairroByID?.stateCode
                                  : _model.municipioObject?.stateCode,
                              functionOnselected: () async {},
                            ),
                          );
                        },
                      ),
                    Builder(
                      builder: (context) {
                        if (widget!.bairroID != null) {
                          return Builder(
                            builder: (context) => wrapWithModel(
                              model: _model.normalButtonModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: NormalButtonWidget(
                                text: 'Salvar alterações',
                                function: () async {
                                  _model.reslutValidate = true;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    safeSetState(
                                        () => _model.reslutValidate = false);
                                    return;
                                  }
                                  if (_model.municipioNameModel
                                          .listIsEmptyTrueValue ==
                                      null) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Estado não selecionado'),
                                          content: Text(
                                              'O estado tem que ser selecionado para executar essa ação!'),
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
                                    _model.reslutValidate = false;
                                    safeSetState(() {});
                                    return;
                                  }

                                  await widget!.bairroID!
                                      .update(createBairrosRecordData(
                                    nome: _model
                                        .cityNameModel.textController.text,
                                    municipio: _model.municipioNameModel
                                        .listIsEmptyTrueValue,
                                    stateCode:
                                        _model.municipioObject?.stateCode,
                                  ));
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: SucessPopUpWidget(
                                          message:
                                              'Muncipio atualizado com sucesso!',
                                          functionPopUp: () async {
                                            context.goNamed('ListCrudBairros');

                                            Navigator.pop(context);
                                          },
                                        ),
                                      );
                                    },
                                  );

                                  Navigator.pop(context);

                                  safeSetState(() {});
                                },
                              ),
                            ),
                          );
                        } else {
                          return Builder(
                            builder: (context) => wrapWithModel(
                              model: _model.normalButtonModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: NormalButtonWidget(
                                text: 'Adicionar bairro',
                                function: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.municipioNameModel
                                          .listIsEmptyTrueValue ==
                                      null) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Estado não selecionado'),
                                          content: Text(
                                              'O estado tem que ser selecionado para executar essa ação!'),
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

                                  await BairrosRecord.collection
                                      .doc()
                                      .set(createBairrosRecordData(
                                        stateCode:
                                            _model.municipioObject?.stateCode,
                                        nome: _model
                                            .cityNameModel.textController.text,
                                        municipio: _model.municipioNameModel
                                            .listIsEmptyTrueValue,
                                      ));
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: SucessPopUpWidget(
                                          message:
                                              'Estado adicionado com sucesso',
                                          functionPopUp: () async {
                                            context
                                                .pushNamed('ListCrudBairros');

                                            Navigator.pop(context);
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ].divide(SizedBox(height: 15.0)),
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
