import 'package:equatable/equatable.dart';

class Page extends Equatable {
  final String created;
  final String description;
  final bool draft;
  final String permalink;
  final String relpermalink;
  final String title;
  final String type;
  final String updated;
  final int weight;

  Page({
    this.created,
    this.description,
    this.draft,
    this.permalink,
    this.relpermalink,
    this.title,
    this.type,
    this.updated,
    this.weight,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      created: json['created'],
      description: json['description'],
      draft: json['draft'],
      permalink: json['permalink'],
      relpermalink: json['relpermalink'],
      title: json['title'],
      type: json['type'],
      updated: json['updated'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this.created;
    data['description'] = this.description;
    data['draft'] = this.draft;
    data['permalink'] = this.permalink;
    data['relpermalink'] = this.relpermalink;
    data['title'] = this.title;
    data['type'] = this.type;
    data['updated'] = this.updated;
    data['weight'] = this.weight;
    return data;
  }

  @override
  List<Object> get props => [type, title];

  @override
  bool get stringify => true;
}
