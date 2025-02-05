import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/pop_ups/jarbas_add_image_perfil/jarbas_add_image_perfil_widget.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/inputs/input_normal/input_normal_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'widget_crud_edit_and_create_categorias_model.dart';
export 'widget_crud_edit_and_create_categorias_model.dart';

class WidgetCrudEditAndCreateCategoriasWidget extends StatefulWidget {
  const WidgetCrudEditAndCreateCategoriasWidget({
    super.key,
    this.categoryID,
  });

  final DocumentReference? categoryID;

  @override
  State<WidgetCrudEditAndCreateCategoriasWidget> createState() =>
      _WidgetCrudEditAndCreateCategoriasWidgetState();
}

class _WidgetCrudEditAndCreateCategoriasWidgetState
    extends State<WidgetCrudEditAndCreateCategoriasWidget> {
  late WidgetCrudEditAndCreateCategoriasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => WidgetCrudEditAndCreateCategoriasModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.categoryID != null) {
        _model.resultQueryCategoriaByID =
            await CategoriasRecord.getDocumentOnce(widget!.categoryID!);
        safeSetState(() {
          _model.categoryModel.textController?.text =
              _model.resultQueryCategoriaByID!.nome;
        });
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
                      context.pushNamed('listCrudCategorias');
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
                      model: _model.jarbasAddImagePerfilModel,
                      updateCallback: () => safeSetState(() {}),
                      child: JarbasAddImagePerfilWidget(
                        imageUrl: _model.resultQueryCategoriaByID?.imageUrl,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.categoryModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: InputNormalWidget(
                        value: 'Adicione uma categoria',
                        maxChar: 15,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (widget!.categoryID != null) {
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
                                  _model.categoriaImage = await action_blocks
                                      .uploadFileToSupabaseBlock(
                                    context,
                                    bucketName: 'categorias',
                                    folderName: 'imagesCategoria',
                                    uploadFile: _model
                                        .jarbasAddImagePerfilModel.uploadFile,
                                    hasUpload: _model.jarbasAddImagePerfilModel
                                                .uploadFile !=
                                            null &&
                                        (_model
                                                .jarbasAddImagePerfilModel
                                                .uploadFile
                                                ?.bytes
                                                ?.isNotEmpty ??
                                            false),
                                  );

                                  await widget!.categoryID!
                                      .update(createCategoriasRecordData(
                                    nome: _model
                                        .categoryModel.textController.text,
                                    imageUrl: _model.categoriaImage != null &&
                                            _model.categoriaImage != ''
                                        ? _model.categoriaImage
                                        : _model
                                            .resultQueryCategoriaByID?.imageUrl,
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
                                              'Categoria atualizada com sucesso!',
                                          functionPopUp: () async {
                                            context.pushNamed(
                                                'listCrudCategorias');

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
                                text: 'Adicionar categoria',
                                function: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  _model.fotoCategoriaCreate =
                                      await action_blocks
                                          .uploadFileToSupabaseBlock(
                                    context,
                                    bucketName: 'categorias',
                                    folderName: 'imagesCategoria',
                                    uploadFile: _model
                                        .jarbasAddImagePerfilModel.uploadFile,
                                    hasUpload: _model.jarbasAddImagePerfilModel
                                                .uploadFile !=
                                            null &&
                                        (_model
                                                .jarbasAddImagePerfilModel
                                                .uploadFile
                                                ?.bytes
                                                ?.isNotEmpty ??
                                            false),
                                  );

                                  var categoriasRecordReference =
                                      CategoriasRecord.collection.doc();
                                  await categoriasRecordReference
                                      .set(createCategoriasRecordData(
                                    nome: _model
                                        .categoryModel.textController.text,
                                    imageUrl: _model.fotoCategoriaCreate,
                                  ));
                                  _model.resultCreateCategory =
                                      CategoriasRecord.getDocumentFromData(
                                          createCategoriasRecordData(
                                            nome: _model.categoryModel
                                                .textController.text,
                                            imageUrl:
                                                _model.fotoCategoriaCreate,
                                          ),
                                          categoriasRecordReference);

                                  await _model.resultCreateCategory!.reference
                                      .update(createCategoriasRecordData(
                                    categoriaID: _model
                                        .resultCreateCategory?.reference.id,
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
                                              'Categoria adicionada com sucesso',
                                          functionPopUp: () async {
                                            context.pushNamed(
                                                'listCrudCategorias');

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
