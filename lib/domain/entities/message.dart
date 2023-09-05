enum Fromwho { me, other }

class Message {
  final String text;
  final String? imageUrl;
  final Fromwho fromwho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromwho,
  });
}
