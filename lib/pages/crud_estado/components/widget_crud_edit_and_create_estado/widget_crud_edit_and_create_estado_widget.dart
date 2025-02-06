import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/inputs/input_normal/input_normal_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'widget_crud_edit_and_create_estado_model.dart';
export 'widget_crud_edit_and_create_estado_model.dart';

class WidgetCrudEditAndCreateEstadoWidget extends StatefulWidget {
  const WidgetCrudEditAndCreateEstadoWidget({
    super.key,
    this.estadoID,
  });

  final DocumentReference? estadoID;

  @override
  State<WidgetCrudEditAndCreateEstadoWidget> createState() =>
      _WidgetCrudEditAndCreateEstadoWidgetState();
}

class _WidgetCrudEditAndCreateEstadoWidgetState
    extends State<WidgetCrudEditAndCreateEstadoWidget> {
  late WidgetCrudEditAndCreateEstadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetCrudEditAndCreateEstadoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.estadoID != null) {
        _model.resutlRequestEstadoById =
            await EstadosRecord.getDocumentOnce(widget!.estadoID!);
        // setStatName
        safeSetState(() {
          _model.stateNameModel.textController?.text =
              _model.resutlRequestEstadoById!.nome;
        });
        safeSetState(() {
          _model.stateCodeModel.textController?.text =
              _model.resutlRequestEstadoById!.code;
        });
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
                      model: _model.stateNameModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: InputNormalWidget(
                        value: 'Adicione o nome do estado',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.stateCodeModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: InputNormalWidget(
                        value: 'Adicione o codigo do estado',
                        maxChar: 2,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (widget!.estadoID != null) {
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

                                  await widget!.estadoID!
                                      .update(createEstadosRecordData(
                                    nome: _model
                                        .stateNameModel.textController.text,
                                    code: _model
                                        .stateCodeModel.textController.text,
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
                                              'Estado atualizado com sucesso!',
                                          functionPopUp: () async {
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed('listCrudEstado');

                                            Navigator.pop(context);
                                          },
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
                          return Builder(
                            builder: (context) => wrapWithModel(
                              model: _model.normalButtonModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: NormalButtonWidget(
                                text: 'Adicionar estado',
                                function: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }

                                  var estadosRecordReference =
                                      EstadosRecord.collection.doc();
                                  await estadosRecordReference
                                      .set(createEstadosRecordData(
                                    nome: _model
                                        .stateNameModel.textController.text,
                                    code: _model
                                        .stateCodeModel.textController.text,
                                    estadoID: '',
                                  ));
                                  _model.createEstado =
                                      EstadosRecord.getDocumentFromData(
                                          createEstadosRecordData(
                                            nome: _model.stateNameModel
                                                .textController.text,
                                            code: _model.stateCodeModel
                                                .textController.text,
                                            estadoID: '',
                                          ),
                                          estadosRecordReference);

                                  await _model.createEstado!.reference
                                      .update(createEstadosRecordData(
                                    estadoID: _model.createEstado?.reference.id,
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
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed('listCrudEstado');

                                            Navigator.pop(context);
                                          },
                                        ),
                                      );
                                    },
                                  );

                                  safeSetState(() {});
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
