import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StorysRecord extends FirestoreRecord {
  StorysRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "empresaID" field.
  String? _empresaID;
  String get empresaID => _empresaID ?? '';
  bool hasEmpresaID() => _empresaID != null;

  // "storyID" field.
  String? _storyID;
  String get storyID => _storyID ?? '';
  bool hasStoryID() => _storyID != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "clickedLike" field.
  List<String>? _clickedLike;
  List<String> get clickedLike => _clickedLike ?? const [];
  bool hasClickedLike() => _clickedLike != null;

  // "visualization" field.
  List<String>? _visualization;
  List<String> get visualization => _visualization ?? const [];
  bool hasVisualization() => _visualization != null;

  // "isImage" field.
  bool? _isImage;
  bool get isImage => _isImage ?? false;
  bool hasIsImage() => _isImage != null;

  // "createdTime" field.
  String? _createdTime;
  String get createdTime => _createdTime ?? '';
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _descricao = snapshotData['descricao'] as String?;
    _empresaID = snapshotData['empresaID'] as String?;
    _storyID = snapshotData['storyID'] as String?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _clickedLike = getDataList(snapshotData['clickedLike']);
    _visualization = getDataList(snapshotData['visualization']);
    _isImage = snapshotData['isImage'] as bool?;
    _createdTime = snapshotData['createdTime'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('storys');

  static Stream<StorysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StorysRecord.fromSnapshot(s));

  static Future<StorysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StorysRecord.fromSnapshot(s));

  static StorysRecord fromSnapshot(DocumentSnapshot snapshot) => StorysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StorysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StorysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StorysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StorysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStorysRecordData({
  String? descricao,
  String? empresaID,
  String? storyID,
  String? videoUrl,
  String? imageUrl,
  bool? isImage,
  String? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'descricao': descricao,
      'empresaID': empresaID,
      'storyID': storyID,
      'videoUrl': videoUrl,
      'imageUrl': imageUrl,
      'isImage': isImage,
      'createdTime': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class StorysRecordDocumentEquality implements Equality<StorysRecord> {
  const StorysRecordDocumentEquality();

  @override
  bool equals(StorysRecord? e1, StorysRecord? e2) {
    const listEquality = ListEquality();
    return e1?.descricao == e2?.descricao &&
        e1?.empresaID == e2?.empresaID &&
        e1?.storyID == e2?.storyID &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.imageUrl == e2?.imageUrl &&
        listEquality.equals(e1?.clickedLike, e2?.clickedLike) &&
        listEquality.equals(e1?.visualization, e2?.visualization) &&
        e1?.isImage == e2?.isImage &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(StorysRecord? e) => const ListEquality().hash([
        e?.descricao,
        e?.empresaID,
        e?.storyID,
        e?.videoUrl,
        e?.imageUrl,
        e?.clickedLike,
        e?.visualization,
        e?.isImage,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is StorysRecord;
}
