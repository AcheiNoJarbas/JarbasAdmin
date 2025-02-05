import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BairrosRecord extends FirestoreRecord {
  BairrosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "municipio" field.
  String? _municipio;
  String get municipio => _municipio ?? '';
  bool hasMunicipio() => _municipio != null;

  // "stateCode" field.
  String? _stateCode;
  String get stateCode => _stateCode ?? '';
  bool hasStateCode() => _stateCode != null;

  // "muncipioID" field.
  String? _muncipioID;
  String get muncipioID => _muncipioID ?? '';
  bool hasMuncipioID() => _muncipioID != null;

  // "bairroID" field.
  String? _bairroID;
  String get bairroID => _bairroID ?? '';
  bool hasBairroID() => _bairroID != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _municipio = snapshotData['municipio'] as String?;
    _stateCode = snapshotData['stateCode'] as String?;
    _muncipioID = snapshotData['muncipioID'] as String?;
    _bairroID = snapshotData['bairroID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bairros');

  static Stream<BairrosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BairrosRecord.fromSnapshot(s));

  static Future<BairrosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BairrosRecord.fromSnapshot(s));

  static BairrosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BairrosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BairrosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BairrosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BairrosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BairrosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBairrosRecordData({
  String? nome,
  String? municipio,
  String? stateCode,
  String? muncipioID,
  String? bairroID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'municipio': municipio,
      'stateCode': stateCode,
      'muncipioID': muncipioID,
      'bairroID': bairroID,
    }.withoutNulls,
  );

  return firestoreData;
}

class BairrosRecordDocumentEquality implements Equality<BairrosRecord> {
  const BairrosRecordDocumentEquality();

  @override
  bool equals(BairrosRecord? e1, BairrosRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.municipio == e2?.municipio &&
        e1?.stateCode == e2?.stateCode &&
        e1?.muncipioID == e2?.muncipioID &&
        e1?.bairroID == e2?.bairroID;
  }

  @override
  int hash(BairrosRecord? e) => const ListEquality()
      .hash([e?.nome, e?.municipio, e?.stateCode, e?.muncipioID, e?.bairroID]);

  @override
  bool isValidKey(Object? o) => o is BairrosRecord;
}
