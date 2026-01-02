class VideoModel{
  final String? notes;
  final String? subscribe;
  final String? title;
  final String? videoUrl;

  VideoModel({
    this.videoUrl,
    this.title,
    this.subscribe,
    this.notes
});


  factory VideoModel.fromJson(final Map<String,dynamic> json){
    return VideoModel(
      notes: json['notes'],
      subscribe: json['subscribe'],
      title: json['title'],
      videoUrl: json['video_url']
    );
  }

}