import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_components/buttons/back_button/back_button_widget.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/title/title_widget.dart';
import '/global_components/inputs/input_multiline/input_multiline_widget.dart';
import '/global_components/inputs/input_selection/input_selection_widget.dart';
import '/pages/crud_storys/components/add_story_item/add_story_item_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'criar_storys_model.dart';
export 'criar_storys_model.dart';

class CriarStorysWidget extends StatefulWidget {
  const CriarStorysWidget({
    super.key,
    required this.empresaID,
  });

  final String? empresaID;

  @override
  State<CriarStorysWidget> createState() => _CriarStorysWidgetState();
}

class _CriarStorysWidgetState extends State<CriarStorysWidget> {
  late CriarStorysModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriarStorysModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
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
                            if (_model.addStoryItemModel.linkToUpload != null &&
                                _model.addStoryItemModel.linkToUpload != '') {
                              await deleteSupabaseFileFromPublicUrl(
                                  _model.addStoryItemModel.linkToUpload!);
                            }

                            context.pushNamed(
                              'storysByEmpresa',
                              queryParameters: {
                                'empresaID': serializeParam(
                                  widget!.empresaID,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.titleModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TitleWidget(
                          title: 'Adicionar Story',
                        ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.inputSelectionModel,
                            updateCallback: () => safeSetState(() {}),
                            child: InputSelectionWidget(
                              label: 'Selecione o tipo de arquivo.',
                              itemSelected: '',
                              valueList: _model.valueList,
                              labelsList: _model.labelList,
                              functionOnselected: () async {
                                _model.reload = true;
                                safeSetState(() {});
                              },
                            ),
                          ),
                          if (_model.inputSelectionModel.listIsEmptyTrueValue !=
                                  null &&
                              _model.inputSelectionModel.listIsEmptyTrueValue !=
                                  '')
                            wrapWithModel(
                              model: _model.addStoryItemModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: AddStoryItemWidget(
                                tipoDeUpload: _model
                                    .inputSelectionModel.listIsEmptyTrueValue!,
                              ),
                            ),
                          wrapWithModel(
                            model: _model.inputMultilineModel,
                            updateCallback: () => safeSetState(() {}),
                            child: InputMultilineWidget(
                              value: 'Descrição do story',
                              maxCharaters: 200,
                            ),
                          ),
                        ].divide(SizedBox(height: 15.0)),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.normalButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NormalButtonWidget(
                      text: 'Postar story',
                      function: () async {
                        if (_model.addStoryItemModel.linkToUpload != null &&
                            _model.addStoryItemModel.linkToUpload != '') {
                          var storysRecordReference =
                              StorysRecord.collection.doc();
                          await storysRecordReference
                              .set(createStorysRecordData(
                            descricao:
                                _model.inputMultilineModel.textController.text,
                            empresaID: widget!.empresaID,
                            imageUrl: _model.addStoryItemModel.linkToUpload,
                            createdTime: dateTimeFormat(
                              "dd/MM/yyyy",
                              getCurrentTimestamp,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            isImage: _model
                                    .inputSelectionModel.listIsEmptyTrueValue ==
                                'IMAGE',
                            videoUrl: _model.addStoryItemModel.linkToUpload,
                          ));
                          _model.storyCreate = StorysRecord.getDocumentFromData(
                              createStorysRecordData(
                                descricao: _model
                                    .inputMultilineModel.textController.text,
                                empresaID: widget!.empresaID,
                                imageUrl: _model.addStoryItemModel.linkToUpload,
                                createdTime: dateTimeFormat(
                                  "dd/MM/yyyy",
                                  getCurrentTimestamp,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                isImage: _model.inputSelectionModel
                                        .listIsEmptyTrueValue ==
                                    'IMAGE',
                                videoUrl: _model.addStoryItemModel.linkToUpload,
                              ),
                              storysRecordReference);

                          await _model.storyCreate!.reference
                              .update(createStorysRecordData(
                            storyID: _model.storyCreate?.reference.id,
                          ));

                          context.goNamed(
                            'viewStory',
                            queryParameters: {
                              'storyID': serializeParam(
                                _model.storyCreate?.reference.id,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Arquivo não selecionado.'),
                                content: Text(
                                    'Selecione uma foto ou video para postar o story!'),
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
                        }

                        safeSetState(() {});
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 15.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
