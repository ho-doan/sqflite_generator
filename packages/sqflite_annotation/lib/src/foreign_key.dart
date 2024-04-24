part of '../sqflite_annotation.dart';

enum ForeignAction { setNull, setDefault, restrict, noAction, cascade }

extension ForeignActionX on ForeignAction {
  String get str {
    switch (this) {
      case ForeignAction.setNull:
        return 'SET NULL';
      case ForeignAction.setDefault:
        return 'SET DEFAULT';
      case ForeignAction.restrict:
        return 'RESTRICT';
      case ForeignAction.noAction:
        return 'NO ACTION';
      case ForeignAction.cascade:
        return 'CASCADE';
    }
  }
}

class ForeignKey extends Property {
  final ForeignAction onUpdate;
  final ForeignAction onDelete;

  const ForeignKey({
    required super.name,
    this.onDelete = ForeignAction.noAction,
    this.onUpdate = ForeignAction.noAction,
  });
}
