import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalStorageService{
  static final LocalStorageService _instance=LocalStorageService._();
  static LocalStorageService get instance=>_instance;
  LocalStorageService._();
  Future<Directory> get _appDirectory async=>getApplicationDocumentsDirectory();


  Future<String> getAppDirectoryPathWithSubDirectoryPath({
    required String? subDirectory
  })async=>"${(await _appDirectory).path}/${subDirectory??""}";

  String _getFilePath({
    required String directoryPath,
    required String fileName,
    required String? extension
  }){
    if(extension==null||extension.isEmpty){
      return "$directoryPath/$fileName";
    }else if(extension.startsWith(".")){
      return "$directoryPath/$fileName$extension";
    }else{
      return "$directoryPath/$fileName.$extension";
    }

  }

  Future<File?> getFile({
    required String fileName,
    required String? extension,
    required String? subDirectory
  })async{
    final String _fileDirectoryPath=await getAppDirectoryPathWithSubDirectoryPath(
      subDirectory: subDirectory
    );
    final bool _directoryExist=await Directory(_fileDirectoryPath).exists();
    final String _filePath=_getFilePath(directoryPath: _fileDirectoryPath, fileName: fileName, extension: extension);
    final bool _isFileExist=await File(_filePath).exists();
    if(_directoryExist&&_isFileExist){
      return File(_filePath);
    }

    return null;
  }

  Future<bool> deleteFile({
    required String fileName,
    required String extension,
    required String subDirectory
  })async{
    try{
      final String _fileDirectoryPath=await getAppDirectoryPathWithSubDirectoryPath(
          subDirectory: subDirectory
      );

      final String _filePath=_getFilePath(directoryPath: _fileDirectoryPath, fileName: fileName, extension: extension);

      final bool _isFileExist=await File(_filePath).exists();

      if(_isFileExist){
        await File(_filePath).delete();

        return true;
      }else{
        return true;
      }
    }catch(e){
      return false;
    }

  }

  Future<bool> isFileExist({
    required String fileName,
    required String extension,
    required String subDirectory
  })async{
    final String _fileDirectoryPath=await getAppDirectoryPathWithSubDirectoryPath(
        subDirectory: subDirectory
    );

    final String _filePath=_getFilePath(
        directoryPath: _fileDirectoryPath,
        fileName: fileName,
        extension: extension
    );

    return await File(_filePath).exists();
  }
}
