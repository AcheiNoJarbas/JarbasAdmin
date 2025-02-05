import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'jarbas_add_image_banner_model.dart';
export 'jarbas_add_image_banner_model.dart';

class JarbasAddImageBannerWidget extends StatefulWidget {
  const JarbasAddImageBannerWidget({
    super.key,
    this.imageUrl,
  });

  final String? imageUrl;

  @override
  State<JarbasAddImageBannerWidget> createState() =>
      _JarbasAddImageBannerWidgetState();
}

class _JarbasAddImageBannerWidgetState
    extends State<JarbasAddImageBannerWidget> {
  late JarbasAddImageBannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JarbasAddImageBannerModel());

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
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: MediaQuery.sizeOf(context).height * 0.2,
                decoration: BoxDecoration(
                  color: Color(0xFFDBDEF2),
                  shape: BoxShape.rectangle,
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
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          '${widget!.imageUrl}',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else if (_model.uploadFile != null &&
                        (_model.uploadFile?.bytes?.isNotEmpty ?? false)) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.memory(
                          _model.uploadFile?.bytes ?? Uint8List.fromList([]),
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.rectangle,
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
          ),
          Align(
            alignment: AlignmentDirectional(0.99, 0.95),
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
