import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'jarbas_add_image_perfil_model.dart';
export 'jarbas_add_image_perfil_model.dart';

class JarbasAddImagePerfilWidget extends StatefulWidget {
  const JarbasAddImagePerfilWidget({
    super.key,
    this.imageUrl,
  });

  final String? imageUrl;

  @override
  State<JarbasAddImagePerfilWidget> createState() =>
      _JarbasAddImagePerfilWidgetState();
}

class _JarbasAddImagePerfilWidgetState
    extends State<JarbasAddImagePerfilWidget> {
  late JarbasAddImagePerfilModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JarbasAddImagePerfilModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.5,
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Stack(
        children: [
          ClipOval(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: Color(0xFFDBDEF2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF3200FF),
                  width: 1.0,
                ),
              ),
              child: Builder(
                builder: (context) {
                  if ((widget!.imageUrl != null && widget!.imageUrl != '') &&
                      (_model.uploadFile == null ||
                          (_model.uploadFile?.bytes?.isEmpty ?? true))) {
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        '${widget!.imageUrl}',
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (_model.uploadFile != null &&
                      (_model.uploadFile?.bytes?.isNotEmpty ?? false)) {
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.memory(
                        _model.uploadFile?.bytes ?? Uint8List.fromList([]),
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.image_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 120.0,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.84, 0.92),
            child: FlutterFlowIconButton(
              borderRadius: 100.0,
              buttonSize: 50.0,
              fillColor: Color(0xFF3200FF),
              icon: Icon(
                Icons.image_outlined,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  safeSetState(() => _model.isDataUploading = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

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
                  } finally {
                    _model.isDataUploading = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length) {
                    safeSetState(() {
                      _model.uploadedLocalFile = selectedUploadedFiles.first;
                    });
                  } else {
                    safeSetState(() {});
                    return;
                  }
                }

                _model.uploadFile = _model.uploadedLocalFile;
                _model.updatePage(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
