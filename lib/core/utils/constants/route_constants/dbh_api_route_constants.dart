// ignore_for_file: constant_identifier_names
import 'dbh_api_param_constants.dart';

class DbhApiRouteConstants {
  static const BASE_URL =
      DbhApiParamConstants.BASE_URL_PARAM + DbhApiParamConstants.VERSION_NUMBER_PARAM;

  // AvtivityLog Routes
  static const activityLogGetByUser = "/ActivityLog/GetByUser";
  static const activityLogGetLatestLogs = "/ActivityLog/GetLatestLogs";
  static const getLogsWithDetails = "/ActivityLog/GetLogsWithDetails";

  // Company Routes
  static const companyCreate = "/Company/Create";
  static const companyUpdate = "/Company/Update";
  static const companyDelete = "/Company/Delete" + DbhApiParamConstants.PARAMS_ID;
  static const companyCheckRepeat = "/Company/CheckRepeat";
  static const companyUploadAttechment = "/Company/UploadAttachment";
  static const companyGetId = "/Company/Get" + DbhApiParamConstants.PARAMS_ID;
  static const companyGetAll = "/Company/GetAll";
  static const companyGetAllSkipOffset = "/Company/GetAll" +
      DbhApiParamConstants.PARAMS_SKIP +
      DbhApiParamConstants.PARAMS_OFFSET;

  // Main Expense Routes
  static const mainExpenseCreate = "/MainExpense/Create";
  static const mainExpenseUpdate = "/MainExpense/Update";
  static const mainExpenseDelete =
      "/MainExpense/Delete" + DbhApiParamConstants.PARAMS_ID;
  static const mainExpenseGetId =
      "ExpenseItem/Get" + DbhApiParamConstants.PARAMS_ID;
  static const mainExpenseGetAll = "/MainExpense/GetAll";
  static const mainExpenseGetMostUsed = "/MainExpense/GetMostUsed";
  static const mainExpenseGetComparison = "/MainExpense/GetComparison";
  static const mainExpenseGetAllSkipOffset = "/MainExpense/GetAll" +
      DbhApiParamConstants.PARAMS_SKIP +
      DbhApiParamConstants.PARAMS_OFFSET;

  // Invoice Routes
  static const invoiceCreate = "/Invoice/Create";
  static const invoiceUpdate = "/Invoice/Update";
  static const invoiceDelete = "/Invoice/Delete" + DbhApiParamConstants.PARAMS_ID;
  static const invoiceGetId = "/Invoice/Get" + DbhApiParamConstants.PARAMS_ID;
  static const invoiceGetAll = "/Invoice/GetAll";
  static const invoiceGetAllSkipOffset = "/Invoice/GetAll" +
      DbhApiParamConstants.PARAMS_SKIP +
      DbhApiParamConstants.PARAMS_OFFSET;
  static const invoiceImportExcel = "/Invoice/ImportExcel";
  static const invoiceExportExcel = "/Invoice/ExportExcel";
  static const invoiceGetAllWithItems = "/Invoice/GetAllWithItems";

  // Invoice Item Routes
  static const invoiceItemCreate = "/Invoice/Create";
  static const invoiceItemUpdate = "/Invoice/Update";
  static const invoiceItemDelete =
      "/Invoice/Delete" + DbhApiParamConstants.PARAMS_ID;
  static const invoiceItemUploadAttachment = "/Invoice/UploadAttechment";
  static const invoiceItemGetId = "/Invoice/Get" + DbhApiParamConstants.PARAMS_ID;
  static const invoiceItemGetByInvoice = "/Invoice/GetByInvoice";
  static const invoiceItemQureyInvoice = "/Invoice/QureyInvoice";

  // Settings
  static const settingsCreateRole = "/Settings/CreateRole";
  static const settingsDeleteRole = "/Settings/DeleteRole";
  static const settingsGetAllRoles = "/Settings/GetAllRoles";
  static const settingsGetAllMembers = "/Settings/GetAllMembers";
  static const settingsSuspendUser = "/Settings/SuspendUser";

  // User Routes
  static const userRefreshToken = "/User/RefreshToken";
  static const userUpdateProfile = "/User/UpdateProfile";
  static const userLogin = "/User/Login";
  static const userRegisterUser = "/User/RegisterUser";
  static const userGetUser = "/User/GetUser";
  static const userGoogleLogin = "/User/GoogleLogin";
  static const userLogout = "/User/Logout";
  static const userChangePassword = "/User/ChangePassword";
  static const getFileManagerLoginDetails = "/User/GetFileManagerLoginDetails";

  //Fm Routes
  static const String getUserCredentials="/fm/GetUserCredentials";

  // Sub Expense Routes
  static const String subExpense1Create = "/SubExpense/Create";
  static const String subExpense1Update = "/SubExpense/Update";
  static const String subExpense1Delete =
      "/SubExpense/Delete" + DbhApiParamConstants.PARAMS_ID;
  static const String subExpense1GetId =
      "/SubExpense/Get" + DbhApiParamConstants.PARAMS_ID;
  static const String subExpense1GetByMainExpenseMainExpenseId =
      "/SubExpense/Get" + DbhApiParamConstants.PARAMS_MAIN_EXPENSE_ID;
  static const String subExpense1GetAll = "/SubExpense/GetAll";
  static const String subExpense1GetAllSkipOffset = "/SubExpense/GetAll" +
      DbhApiParamConstants.PARAMS_SKIP +
      DbhApiParamConstants.PARAMS_OFFSET;

  // Area Routes
  static const String areaCreate = "/Area/Create";
  static const String areaUpdate = "/Area/Update";
  static const String areaDelete = "/Area/Delete" + DbhApiParamConstants.PARAMS_ID;
  static const String areaGetId = "/Area/Get/" + DbhApiParamConstants.PARAMS_ID;
  static const String areaGetAll = "/Area/GetAll";
}