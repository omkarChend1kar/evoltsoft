class ApiConstants {
  static String baseUrl = 'https://xrdashboard.com/';
  static String deviceRequestBaseUrl = 'https://vrms.aijunction.in/';
  static String mainBaseUrl = 'https://vrmsdevice.aijunction.in/';
  static String login = 'auth/sign-in';
  static String newLogin = 'api/v1/Identity/User/login';
  static String getAllEmployees = 'employee/employee';
  static String getEmployees = 'api/v1/Employee/GetTable';
  static String verifyDevice = 'api/v1/device/request';
  static String getAllDepartments = 'auth/departments';
  static String getEmployeeFormSchemas = 'api/v1/AppConfig/Get';
  static String getAllUsers = 'auth/get-all-users';
  static String fileDownload = 'api/v1/FileManager/GetFile?OrganizationId=';

  ///
  static String createEmployee = 'api/v1/Employee/Create';
}
