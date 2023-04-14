class StringManager {
  static final StringManager _instance = StringManager._init();
  static StringManager get instance => _instance;
  StringManager._init();

  final String hello = "Hello,";
  final String welcomeBack = "Hi, Welcome Back!";
  final String loginIntoYourAccout = "Login into your account";

  final String yourAcount = "Your Account";
  final String yourName = "Your Name";
  final String yourMail = "Email";

  final String password = "Password";

  final String signIn = "Sign In";
  final String signUp = "Sign Up";

  final String createAccount = "Create  Account";
  final String alreadyHaveAnAccount = "Already have an account?";

  final String days = "Days";
  final String daysSubs = "Choose the day you want to make reservations";

  final String workout = "Workouts";
  final String listTrailingSubs = "Select the workout you want to change";

  final String editingTrailingSubs =
      "After changing the program, don't forget to update it.";
  final String traningName = "Training name";
  final String traningTime = "Training time";

  final String addTraining = "Add Training";
  final String addSubs = "Add the workout of your choice";
  final String update = "Update";
  final String add = "Add";
  final String notFoundTitle = "Not Found";

  final String monday = "Monday";
  final String tuesday = "Tuesday";
  final String wednesday = "Wednesday";
  final String thursday = "Thursday";
  final String friday = "Friday";
  final String saturday = "Saturday";
  final String sunday = "Sunday";

  final String invalidMail = "Please enter a valid e-mail address";
  final String wrongPassword = "Wrong password. Please try again";
  final String userNotFound = "Registered email address not found";
  final String userDisable = "No such user record found";

  final String weakPassword = "Weak password";
  final String emailAlreadyInUse =
      "There is already an account registered for this email.";

  final String blank = "Please do not leave blank";
}
