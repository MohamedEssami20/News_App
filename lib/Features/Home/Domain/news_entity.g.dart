// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsEntityAdapter extends TypeAdapter<NewsEntity> {
  @override
  final int typeId = 0;

  @override
  NewsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsEntity(
      newsTitle: fields[0] as String,
      newsDesc: fields[1] as String,
      newsImage: fields[2] as String,
      newsCatgorie: fields[3] as String,
      newsTime: fields[5] as String,
      newsauthor: fields[4] as String,
      newsUrl: fields[6] as String,
      newsId: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewsEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.newsTitle)
      ..writeByte(1)
      ..write(obj.newsDesc)
      ..writeByte(2)
      ..write(obj.newsImage)
      ..writeByte(3)
      ..write(obj.newsCatgorie)
      ..writeByte(4)
      ..write(obj.newsauthor)
      ..writeByte(5)
      ..write(obj.newsTime)
      ..writeByte(6)
      ..write(obj.newsUrl)
      ..writeByte(7)
      ..write(obj.newsId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
