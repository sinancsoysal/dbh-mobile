extension FolderPathExtension on String?{
  String? get withoutMultipleSplashFolderPath{
    final RegExp multipleRegexp=RegExp(r'(\/)+');

    return this?.replaceAll(multipleRegexp, "/");
  }


  String? get previousFolderPath{
    final String? _tempPath=this?.withoutMultipleSplashFolderPath;

    if(_tempPath==null||_tempPath.isEmpty||_tempPath=="/"||_tempPath.trim()=="/"){
      return null;
    }else{
      final List<String> _tempPathParts=_tempPath.split("/");

      String _tempPreviousPath="/";

      final int iteratorCount=_tempPath.trim().endsWith("/")
          ?_tempPathParts.length-2
          :_tempPathParts.length-1;

      for(int i=0;i<iteratorCount;i++){
        if(_tempPathParts[i].isEmpty){
          continue;
        }else{
          _tempPreviousPath=_tempPreviousPath+'/'+_tempPathParts[i];
        }
      }

      return (_tempPreviousPath+'/').withoutMultipleSplashFolderPath;
    }
  }


  String get currentFolderNameFromPath{
    final String? _tempPath=this?.withoutMultipleSplashFolderPath;

    if(_tempPath==null||_tempPath.isEmpty||_tempPath=="/"||_tempPath.trim()=="/"){
      return "/";
    }else{
      final List<String> _tempPathParts=_tempPath.split("/");

      final int iteratorCount=_tempPath.trim().endsWith("/")
          ?_tempPathParts.length-2
          :_tempPathParts.length-1;

      return _tempPathParts[iteratorCount];
    }
  }


}