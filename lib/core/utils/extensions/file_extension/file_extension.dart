///This extension can used for file manager operations like
///found a file type can openable or not...
import 'dart:io' show Platform;
import 'package:flutter/material.dart' show Icons, IconData;


extension FileStringExtension on String{
  String? fileNameWithoutExtension({
    required String fileExtension
  }){
    if(isEmpty){
      return null;
    }else{
      if(fileExtension.isNotEmpty
          &&endsWith(fileExtension)){
        final int _rangeMax=length;
        final int _rangeMin=length-fileExtension.length;
        return replaceRange(_rangeMin, _rangeMax, "");
      }else{
        return this;
      }
    }
  }

  String? get fileExtension{
    final bool _isNotEmptyAndHasExtension=isNotEmpty
        &&contains(".");

    if(_isNotEmptyAndHasExtension){
      final List<String> _fileNameParts=split(".");

      final bool _isExtensionPartExist=_fileNameParts.length>=2;

      if(_isExtensionPartExist){
        return "."+_fileNameParts.last;
      }
    }


    return null;
  }
}

extension FileExtensionIconExtension on String{
  IconData get extensionIcon{
    switch(toLowerCase()){
      case "":return Icons.contact_support;
      case ".webm":
      case ".mov":
      case ".amw":
      case ".3gp":
      case ".mkv":
      case ".wmv":
      case ".flv":
      case ".mp4": return Icons.play_circle_outline;
      case ".webp":
      case ".gif": return Icons.video_library;
      case ".jpg":
      case ".png":
      case ".jpeg":
      case ".svg": return Icons.image;
      case ".gz": return Icons.attachment;
      case ".js": return Icons.open_in_browser;
      case ".htm": return Icons.open_in_browser;
      case ".html": return Icons.open_in_browser;
      case ".ppt":
      case ".pptx":
      case ".pps": return Icons.pie_chart;
      case ".doc":
      case ".pdf": return Icons.description;
      case ".exe":
      case ".apk": return Icons.open_in_new;
      case ".config": return Icons.settings;
      case ".waw":
      case ".mp3":
      case ".mp2": return Icons.audiotrack_outlined;
    ///txt, etc...
      default: return Icons.text_snippet;
    }
  }
}

extension FileOpenExtension on String{
  bool get canFileExtensionOpenable{
    if (Platform.isAndroid) {
      return _canFileExtensionOpenableOnAndroid;
    } else {
      return _canFileExtensionOpenableOnIos;
    }
  }

  bool get _canFileExtensionOpenableOnAndroid{
    switch(this){
      case(".doc"):return true;
      case(".docx"):return true;
      case(".xls"):return true;
      case(".xlsx"):return true;
      case(".html"):return true;
      case(".png"):return true;
      case(".jpeg"):return true;
      case(".jpg"):return true;
      case(".mov"):return true;
      case(".mp4"):return true;
      case(".pdf"):return true;
      case(".ppt"):return true;
      case(".pptx"):return true;
      case(".bmp"):return true;
      case(".apk"):return true;
      case(".3gp"):return true;
      case(".torrent"):return true;
      case(".kml"):return true;
      case(".gpx"):return true;
      case(".csv"):return true;
      case(".asf"):return true;
      case(".avi"):return true;
      case(".bin"):return true;
      case(".c"):return true;
      case(".class"):return true;
      case(".conf"):return true;
      case(".cpp"):return true;
      case(".exe"):return true;
      case(".gif"):return true;
      case(".gtar"):return true;
      case(".gz"):return true;
      case(".h"):return true;
      case(".htm"):return true;
      case(".jar"):return true;
      case(".java"):return true;
      case(".js"):return true;
      case(".log"):return true;
      case(".m3u"):return true;
      case(".m4a"):return true;
      case(".m4b"):return true;
      case(".m4p"):return true;
      case(".m4u"):return true;
      case(".m4v"):return true;
      case(".mp2"):return true;
      case(".mp3"):return true;
      case(".mpc"):return true;
      case(".mpe"):return true;
      case(".mpeg"):return true;
      case(".mpg"):return true;
      case(".mpg4"):return true;
      case(".mpga"):return true;
      case(".msg"):return true;
      case(".ogg"):return true;
      case(".pps"):return true;
      case(".prop"):return true;
      case(".rc"):return true;
      case(".rmvb"):return true;
      case(".rtf"):return true;
      case(".sh"):return true;
      case(".tar"):return true;
      case(".tgz"):return true;
      case(".txt"):return true;
      case(".wav"):return true;
      case(".wma"):return true;
      case(".wmv"):return true;
      case(".wps"):return true;
      case(".xml"):return true;
      case(".z"):return true;
      case(".zip"):return true;
      default: return false;
    }
  }

  bool get _canFileExtensionOpenableOnIos{
    switch(this){
      case(".txt"):return true;
      case(".html"):return true;
      case(".jpg"):return true;
      case(".jpeg"):return true;
      case(".png"):return true;
      case(".mp4"):return true;
      case(".bmp"):return true;
      case(".doc"):return true;
      case(".ppt"):return true;
      case(".pdf"):return true;
      case(".rtf"):return true;
      case(".htm"):return true;
      case(".xml"):return true;
      case(".tar"):return true;
      case(".gz"):return true;
      case(".gzip"):return true;
      case(".tgz"):return true;
      case(".avi"):return true;
      case(".mpg"):return true;
      case(".mpeg"):return true;
      case(".3gpp"):return true;
      case(".3gp"):return true;
      case(".mp3"):return true;
      case(".zip"):return true;
      case(".gif"):return true;
      case(".ico"):return true;
      case(".xls"):return true;
      case(".wav"):return true;
      case(".wm"):return true;
      case(".wmv"):return true;
      default: return false;
    }
  }
}