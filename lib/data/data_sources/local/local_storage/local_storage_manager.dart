import 'dart:io';
import 'dart:typed_data' show Uint8List;
import 'package:flutter/material.dart' show debugPrint;
import 'package:mobile/core/utils/constants/local_storage_constants.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageService{
  static final LocalStorageService _instance=LocalStorageService._();
  static LocalStorageService get instance=>_instance;
  LocalStorageService._();

  Future<Directory> get _appDirectory async=>getApplicationDocumentsDirectory();

  Future<File?> _getFile({required String fileName, required String? subDirectory})async{
    final Directory _directory=await _appDirectory;
    final String _fileDirectoryPath="${_directory.path}${subDirectory??""}";
    final bool _directoryExist=await Directory(_fileDirectoryPath).exists();
    final bool _isFileExist=await File("$_directoryExist/$fileName").exists();
    if(_directoryExist&&_isFileExist){
      return File("$_directoryExist/$fileName");
    }

    return null;
  }

  /*
  Future<Uint8List?> getImageFromDisk({required String imageName})async{
    try{
      final File? _imageFile=await _getFile(fileName: imageName, subDirectory: PathProviderConstants.imageFolder);

      if(_imageFile!=null){
        return _imageFile.readAsBytes();
      }

      return null;
    }catch(e){
      debugPrint("Error on getImageFromDisk Function: ${e.toString()}");
      return null;
    }
  }

   */

  /*
  Future<bool> saveImageToDisk({required Uint8List file, required String imageName})async{
    try{
      final Directory _directory=await _appDirectory;
      final String _fileDirectoryPath="${_directory.path}${PathProviderConstants.imageFolder}";
      final bool _directoryExist=await Directory(_fileDirectoryPath).exists();
      final bool _isFileExist=await File("$_fileDirectoryPath/$imageName").exists();
      if(!_isFileExist){
        if(!_directoryExist){
          await Directory(_fileDirectoryPath).create(recursive: true);
        }

        final _imageFile=File("$_fileDirectoryPath/$imageName");
        await _imageFile.writeAsBytes(image);
        return true;
      }

      return false;
    }catch(e){
      debugPrint("Error on saveImageToDisk Function: ${e.toString()}");
      return false;
    }
  }

   */

}
