class NoteModel {
  final int? id;
  final bool isMarked;
  final String? title;
  final String? content;
  final DateTime lastAtt;

  NoteModel(
      {this.id,
      this.title,
      this.content,
      required this.lastAtt,
      required this.isMarked});

  static NoteModel fromDoc(Map<String, Object?> doc) {
    return NoteModel(
        id: doc['id'] as int?,
        isMarked: doc['isMarked'] == 1,
        title: doc['title'] as String,
        content: doc['content'] as String,
        lastAtt: DateTime.parse(doc['lastAtt'] as String));
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'isMarked': isMarked ? 1 : 0,
        'title': title ?? '',
        'content': content ?? '',
        'lastAtt': lastAtt.toIso8601String(),
      };
}
