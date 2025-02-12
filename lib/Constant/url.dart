class AppApi {
  static String url = "http://10.0.2.2:8000/api";
  static String imageurl = "http://10.0.2.2:8000/storage/";
  //Auth
  static String Signup = "/register";
  static String Login = "/login";
  static String UpdatePassword = "/updatePassword";

  //Home onwer
  static String GetCategory(String? lang) => "/getCategories/$lang";
  static String GetContractorsByServices(String? lang) =>
      "/getcontractorbycategory/$lang";
  static String SendTask = "/createtask";
  static String MyContracts = "/get_all_my_contract";
  static String GetMyNotification = "/getMyNotification";
  static String Rate = "/rate";

  static String GetContractById(int contractId) =>
      "/getContractById/$contractId";
  static String GetProtfilioContractor(int contractorId) =>
      "/get_protfilio_contractor/$contractorId";

  static String AcceRejContract(int contractId) =>
      "/acc_rej_contract/$contractId";
  static String GetProfile = "/getprofile";
  static String GetReceiptById(int receiptId) => "/getReceiptById/$receiptId";
  static String SendReceiptToReview(int receiptId) =>
      "/sendReceiptToReview/$receiptId";

  //Contractor

  static String GetMyTasks = "/get_all_my_task";
  static String AccRejTask(int taskId) => "/acc_rej_task/$taskId";
  static String GetTaskById(int taskId) => "/getTaskbyId/$taskId";
  static String SendContract(int taskId) => "/send_contract/$taskId";
  static String SendReceipt(int contractId) => "/addreceipt/$contractId";
  static String GetAllMyRating = "/get_all_my_rating";

  static String UpdateProtfolio = "/update_protfolio";

  //MainPages

  static String EditProfile = "/editprofile";
}
