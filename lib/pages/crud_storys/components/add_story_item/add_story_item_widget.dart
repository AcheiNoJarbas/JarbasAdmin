import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_story_item_model.dart';
export 'add_story_item_model.dart';

class AddStoryItemWidget extends StatefulWidget {
  const AddStoryItemWidget({
    super.key,
    required this.tipoDeUpload,
  });

  final String? tipoDeUpload;

  @override
  State<AddStoryItemWidget> createState() => _AddStoryItemWidgetState();
}

class _AddStoryItemWidgetState extends State<AddStoryItemWidget> {
  late AddStoryItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddStoryItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.6,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        child: Builder(
                          builder: (context) {
                            if (widget!.tipoDeUpload == 'IMAGE') {
                              return Visibility(
                                visible: _model.linkToUpload != null &&
                                    _model.linkToUpload != '',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      '${_model.linkToUpload}',
                                      'data:image/jpeg;base64,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',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            } else {
                              return Visibility(
                                visible: _model.linkToUpload != null &&
                                    _model.linkToUpload != '',
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: custom_widgets.JarbasVideoPlayer(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    urlVideo: _model.linkToUpload,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget!.tipoDeUpload == 'IMAGE')
                Align(
                  alignment: AlignmentDirectional(0.94, 0.94),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 100.0,
                      fillColor: Color(0xFF003DFF),
                      icon: Icon(
                        Icons.image_outlined,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      onPressed: () async {
                        if (_model.linkToUpload != null &&
                            _model.linkToUpload != '') {
                          await deleteSupabaseFileFromPublicUrl(
                              _model.linkToUpload!);
                        }
                        // UploadOfImage
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          storageFolderPath: 'storyFiles',
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          safeSetState(() => _model.isDataUploading1 = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          var downloadUrls = <String>[];
                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();

                            downloadUrls = await uploadSupabaseStorageFiles(
                              bucketName: 'Stories',
                              selectedFiles: selectedMedia,
                            );
                          } finally {
                            _model.isDataUploading1 = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile1 =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl1 = downloadUrls.first;
                            });
                          } else {
                            safeSetState(() {});
                            return;
                          }
                        }

                        _model.linkToUpload = _model.uploadedFileUrl1;
                        safeSetState(() {});
                      },
                    ),
                  ),
                ),
              if (widget!.tipoDeUpload == 'VIDEO')
                Align(
                  alignment: AlignmentDirectional(0.94, 0.94),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 10.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 100.0,
                      fillColor: Color(0xFF003DFF),
                      icon: Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      onPressed: () async {
                        if (_model.linkToUpload != null &&
                            _model.linkToUpload != '') {
                          await deleteSupabaseFileFromPublicUrl(
                              _model.linkToUpload!);
                        }
                        // UploadOfVideo
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          storageFolderPath: 'storyFiles',
                          allowPhoto: false,
                          allowVideo: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          safeSetState(() => _model.isDataUploading2 = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          var downloadUrls = <String>[];
                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();

                            downloadUrls = await uploadSupabaseStorageFiles(
                              bucketName: 'Stories',
                              selectedFiles: selectedMedia,
                            );
                          } finally {
                            _model.isDataUploading2 = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile2 =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl2 = downloadUrls.first;
                            });
                          } else {
                            safeSetState(() {});
                            return;
                          }
                        }

                        _model.linkToUpload = _model.uploadedFileUrl2;
                        safeSetState(() {});
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
