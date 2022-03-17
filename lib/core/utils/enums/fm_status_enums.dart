enum FmLoginStatusEnum {
  ///InitialState: at this state, we are not doing anything.
  initialState,

  ///Request Sending To Dbh System for getting the fm username password.
  loginCredentialsRequesting,

  ///Username - Password fetched.
  loginCredentialsFetched,

  ///Username - Password couldn't load.
  loginCredentialsCouldNotFetch,

  ///Fm login request sending for getting cookie.
  fmLoginRequestSending,

  ///Success
  fmLoginCookieFetched,

  ///Fail
  fmLoginCookieCouldNotFetch
}

enum FmFolderFetchStatusEnum {
  ///[initialState]: FirstState - InitialState - EmptyState
  initialState,

  ///[fetching] - HttpRequestSending state.
  fetching,
  ///[fetched] - HttpRequest handled successfully and fetched itemList
  fetched,

  ///[failedDueUnknownReason] - HttpRequest failed. Unknown error state. Refreshment needed.
  failedDueUnknownReason,

  ///[failedDueAuthTokenError] - HttpRequest failed due auth token error. Refreshment needed.
  failedDueAuthTokenError,

  ///[failedDueHttpResponseCode404] - folder deleted or never exist!. BackButtonNeeded.
  failedDueHttpResponseCode404,

  ///[failedDueHttpResponseCode401] - Unauthorized, back button needed. BackButtonNeeded.
  failedDueHttpResponseCode401,
}

enum FmFileDownloadStatusEnum{
  ///[initialState]: FirstState - InitialState - EmptyState
  initialState,

  ///[fileDownloading] - StartingToDownloadTheFile
  fileDownloading,

  ///[downloadCompleted] - Download completed Successfully
  fileDownloadCompleted,

  ///[failedDueUnknownReason] - HttpRequest failed. Unknown error state. Refreshment needed.
  ///401 response errors coming here too. Because it is not about folder auth error, just a file
  ///so we can't be sure the reason.
  failedDueUnknownReason,

  ///[failedDueAuthTokenError] - HttpRequest failed due auth token error. Refreshment needed.
  failedDueAuthTokenError,

  ///[failedDueHttpResponseCode404] - folder deleted or never exist!. BackButtonNeeded.
  failedDueHttpResponseCode404,
}
