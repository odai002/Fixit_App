class AppLink {
  // static const String servrer = "http://192.168.43.178:8000/api";
  static const String servrer = "http://10.0.2.2:8000/api";
  static const String Category = "http://10.0.2.2:8000/storage/";

  // ====================================
//Auth
  static const String signup = "$servrer/register";

  static const String signin = "$servrer/login";

  static const String updatePassword = "$servrer/updatePassword";

  //Home onwer
  static const String getcategory = "$servrer/getCategories";

  static const String getcontractorsbyservices =
      "$servrer/getcontractorbycategory";

  static const String sendTask = "$servrer/createtask";

  static const String myContracts = "$servrer/get_all_my_contract";
  static const String getMyNotification = "$servrer/getMyNotification";

  static String getContractById(int contractId) =>
      "$servrer/getContractById/$contractId";

  static String AcceptContract(int contractId) =>
      "$servrer/acc_rej_contract/$contractId";

  static String RejactContract(int contractId) =>
      "$servrer/acc_rej_contract/$contractId";

  static const String getProfile = "$servrer/getprofile";

  //Contractor

  static const String getMyTasks = "$servrer/get_all_my_task";
  static String deleteTask(int taskId) => "$servrer/acc_rej_task/$taskId";
  static String acceptTask(int taskId) => "$servrer/acc_rej_task/$taskId";
  static String sendContract(int taskId) => "$servrer/send_contract/$taskId";

  static const String update_protfolio = "$servrer/update_protfolio";

  //MainPages

  static const String EditProfile = "$servrer/editprofile";
}
