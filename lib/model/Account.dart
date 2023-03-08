class Account {
  int? user_id;
  int? balance;


  Account(account) {
    user_id = account['id'];
    balance = account['balance'];
  
  }
}