class AppLink {
  static const String servrer = "http://192.168.43.178:8000/api";

  // ====================================
//Auth
  static const String signup = "$servrer/register";

  static const String signin = "$servrer/login";

  //Home onwer
  static const String getcategory = "$servrer/getCategories";

  static const String getcontractorsbyservices = "$servrer/getcontractorbycategory";

  static const String sendTask = "$servrer/createtask";

  static const String myContracts = "$servrer/get_all_my_contract";

  static String AcceptContract(int contractId) => "$servrer/acc_rej_contract/$contractId";

  static String RejactContract(int contractId) => "$servrer/acc_rej_contract/$contractId";





  //Contractor

  static const String getMyTasks = "$servrer/get_all_my_task";
  static String deleteTask(int taskId) => "$servrer/acc_rej_task/$taskId";
  static String acceptTask(int taskId) => "$servrer/acc_rej_task/$taskId";
  static String sendContract(int taskId) => "$servrer/send_contract/$taskId";
 //MainPages

  static const String EditProfile = "$servrer/editprofile";


}