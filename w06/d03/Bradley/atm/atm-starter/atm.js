function Account(name, balance, overdraftAccount) {
  this.name = name;
  this.balance = balance;
  this.overdraftAccount = overdraftAccount;
}

Account.prototype.updateBalance = function() {
  this.balanceDisplay.innerHTML = "$" + this.balance;
  if (this.balance === 0) {
    this.balanceDisplay.style.backgroundColor = 'red';
  }
  else {
    this.balanceDisplay.style.backgroundColor = 'white';
  }
}

Account.prototype.makeWithdrawal = function() {
  var withdrawalAmount = parseInt(document.getElementById(this.name + "_amount").value);
  // var name = this.name;
  if (withdrawalAmount <= this.balance) {
    this.balance -= withdrawalAmount;
  }
  else if (withdrawalAmount < (checking.balance + savings.balance)) {
    if (this.name === "checking") {
      withdrawalAmount -= checking.balance;
      checking.balance = 0;
      savings.balance -= withdrawalAmount;
    }
    else {
      withdrawalAmount -= savings.balance;
      savings.balance = 0;
      checking.balance -= withdrawalAmount;
    }
  }
  else {
    alert("You don't have enough funds for that!")
  }
  checking.updateBalance();
  savings.updateBalance();
}

Account.prototype.makeDeposit = function() {
  var depositAmount = parseInt(document.getElementById(this.name + "_amount").value);
  this.balance += depositAmount;
  this.updateBalance();
}

Account.prototype.attachListeners = function() {
  this.withdrawButton.addEventListener('click', this.makeWithdrawal.bind(this));
  this.depositButton.addEventListener('click', this.makeDeposit.bind(this));
}


Account.prototype.initialize = function() {
  this.balanceDisplay = document.getElementById(this.name + "_balance");
  this.withdrawButton = document.getElementById(this.name + "_withdraw");
  this.depositButton = document.getElementById(this.name + "_deposit");
  this.updateBalance();
}

window.onload = function() {

  checking = new Account('checking', 0, 'savings');
  checking.initialize();
  checking.attachListeners();

  savings = new Account('savings', 0, 'checking');
  savings.initialize();
  savings.attachListeners();
}