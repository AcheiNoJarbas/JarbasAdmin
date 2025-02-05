import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EstadosRecord extends FirestoreRecord {
  EstadosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "estadoID" field.
  String? _estadoID;
  String get estadoID => _estadoID ?? '';
  bool hasEstadoID() => _estadoID != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _code = snapshotData['code'] as String?;
    _estadoID = snapshotData['estadoID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('estados');

  static Stream<EstadosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EstadosRecord.fromSnapshot(s));

  static Future<EstadosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EstadosRecord.fromSnapshot(s));

  static EstadosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EstadosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EstadosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EstadosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EstadosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EstadosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEstadosRecordData({
  String? nome,
  String? code,
  String? estadoID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'code': code,
      'estadoID': estadoID,
    }.withoutNulls,
  );

  return firestoreData;
}

class EstadosRecordDocumentEquality implements Equality<EstadosRecord> {
  const EstadosRecordDocumentEquality();

  @override
  bool equals(EstadosRecord? e1, EstadosRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.code == e2?.code &&
        e1?.estadoID == e2?.estadoID;
  }

  @override
  int hash(EstadosRecord? e) =>
      const ListEquality().hash([e?.nome, e?.code, e?.estadoID]);

  @override
  bool isValidKey(Object? o) => o is EstadosRecord;
}
