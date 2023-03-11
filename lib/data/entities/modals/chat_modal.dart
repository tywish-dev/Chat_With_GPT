class ChatModal {
  final String msg;
  final int chatIndex;

  ChatModal({required this.msg, required this.chatIndex});

  factory ChatModal.fromJson(Map<String, dynamic> json) =>
      ChatModal(msg: json['msg'], chatIndex: json['chatIndex']);
}
