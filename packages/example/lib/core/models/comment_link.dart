import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_annotation/sqflite_annotation.dart';

part 'comment_link.g.dart';

@entity
class CommentLinkModel extends EntityQuery {
  @primaryKey
  final int commentId; // コメントUID
  @primaryKey
  final int subNo; // 枝番
  final int attachedId; // イメージUID
  final int linkType; // リンクタイプ
  final int orderIndex; // オーダインデックス
  final int targetSystem; // 対象システム
  final String linkDetail; // リンク詳細
  final String linkText; // リンクテキスト
  final int stampDate; // スタンプ日
  final int stampTime; // スタンプ時間

  const CommentLinkModel({
    required this.commentId,
    required this.subNo,
    required this.attachedId,
    required this.linkType,
    required this.orderIndex,
    required this.targetSystem,
    required this.linkDetail,
    required this.linkText,
    required this.stampDate,
    required this.stampTime,
  });

  factory CommentLinkModel.fromDB(
          Map<dynamic, dynamic> json, List<Map<dynamic, dynamic>> lst,
          [String childName = '']) =>
      CommentLinkModelQuery.$fromDB(json, lst, childName);

  Map<String, dynamic> toDB() => $toDB();
}
