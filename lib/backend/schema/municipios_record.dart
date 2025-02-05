import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MunicipiosRecord extends FirestoreRecord {
  MunicipiosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "stateCode" field.
  String? _stateCode;
  String get stateCode => _stateCode ?? '';
  bool hasStateCode() => _stateCode != null;

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "municipioID" field.
  String? _municipioID;
  String get municipioID => _municipioID ?? '';
  bool hasMunicipioID() => _municipioID != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _stateCode = snapshotData['stateCode'] as String?;
    _nome = snapshotData['Nome'] as String?;
    _municipioID = snapshotData['municipioID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Municipios');

  static Stream<MunicipiosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MunicipiosRecord.fromSnapshot(s));

  static Future<MunicipiosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MunicipiosRecord.fromSnapshot(s));

  static MunicipiosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MunicipiosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MunicipiosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MunicipiosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MunicipiosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MunicipiosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMunicipiosRecordData({
  String? image,
  String? stateCode,
  String? nome,
  String? municipioID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'stateCode': stateCode,
      'Nome': nome,
      'municipioID': municipioID,
    }.withoutNulls,
  );

  return firestoreData;
}

class MunicipiosRecordDocumentEquality implements Equality<MunicipiosRecord> {
  const MunicipiosRecordDocumentEquality();

  @override
  bool equals(MunicipiosRecord? e1, MunicipiosRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.stateCode == e2?.stateCode &&
        e1?.nome == e2?.nome &&
        e1?.municipioID == e2?.municipioID;
  }

  @override
  int hash(MunicipiosRecord? e) => const ListEquality()
      .hash([e?.image, e?.stateCode, e?.nome, e?.municipioID]);

  @override
  bool isValidKey(Object? o) => o is MunicipiosRecord;
}
