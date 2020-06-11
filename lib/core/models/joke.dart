class Joke {
  String id;
  String content;
  bool nsfw;
  int upvotes;
  int downvotes;

  Joke({this.id, this.content, this.nsfw, this.upvotes, this.downvotes});

  Joke.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['content'],
        nsfw = json['nsfw'],
        upvotes = json['upvotes'],
        downvotes = json['downvotes'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'nsfw': nsfw,
    'upvotes': upvotes,
    'downvotes': downvotes
  };
}
