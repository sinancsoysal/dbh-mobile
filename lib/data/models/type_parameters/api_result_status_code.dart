enum ApiResultStatusCode {
  success,
  serverError,
  badRequest,
  notFound,
  listEmpty,
  logicError,
  unAuthorized,
  forbidden,
  conflict,
  gone,
  unknown
}

extension StringToApiResultStatusCode on String {
  ApiResultStatusCode get toApiResultStatusCode {
    switch (this) {
      case "Success":
        return ApiResultStatusCode.success;
      case "ServerError":
        return ApiResultStatusCode.serverError;
      case "BadRequest":
        return ApiResultStatusCode.badRequest;
      case "NotFound":
        return ApiResultStatusCode.notFound;
      case "ListEmpty":
        return ApiResultStatusCode.listEmpty;
      case "LogicError":
        return ApiResultStatusCode.logicError;
      case "UnAuthorized":
        return ApiResultStatusCode.unAuthorized;
      case "Forbidden":
        return ApiResultStatusCode.forbidden;
      case "Conflict":
        return ApiResultStatusCode.conflict;
      case "Gone":
        return ApiResultStatusCode.gone;
      default:
        return ApiResultStatusCode.unknown;
    }
  }
}

extension ApiResultStatusCodeToString on ApiResultStatusCode {
  String get rawValue {
    switch (this) {
      case ApiResultStatusCode.success:
        return "Success";
      case ApiResultStatusCode.serverError:
        return "ServerError";
      case ApiResultStatusCode.badRequest:
        return "BadRequest";
      case ApiResultStatusCode.notFound:
        return "NotFound";
      case ApiResultStatusCode.listEmpty:
        return "ListEmpty";
      case ApiResultStatusCode.logicError:
        return "LogicError";
      case ApiResultStatusCode.unAuthorized:
        return "UnAuthorized";
      case ApiResultStatusCode.forbidden:
        return "Forbidden";
      case ApiResultStatusCode.conflict:
        return "Conflict";
      case ApiResultStatusCode.gone:
        return "Gone";
      case ApiResultStatusCode.unknown:
        return "Unknown";
    }
  }
}
