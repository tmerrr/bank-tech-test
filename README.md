# Bank tech test

## Instructions to get started:

Create an account:

```
<account_name> = BankAccount.new(<enter a starting balance or leave blank to start from 0>)
```

View balance:

```
<account_name>.current_balance
```

Make a deposit:

```
<account_name>.deposit(<value>)
```

Make a withdrawal:

```
<account_name>.withdraw(<value>)
```

Print statement:

```
<account_name>.statement
```

## The Task:

### Requirements:

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria:

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## My Approach:

Throughout the task I used a TDD approach and would try to refactor where I could, once the test was green.

I began by creating the class which seemed the most obvious; The Bank Account. Working through each of the task requirements in order, the BankAccount was first able to keep track of and view balance, then deposit funds, and then withdraw funds.

When it came to printing transactions, it was becoming clear I would need another class of some sort to manage this. However, for simplicities sake, I began by building this functionality into the BankAccount class until I had a working solution which met the requirement, before extracting into a new class.  The first solution kept track of transactions by recording each deposit and withdrawal as a Hash, and storing this in an Array.

From here, I decided the the class to extract would be Transaction. This would take the amount deposited or withdrawn, the balance after that transaction, and set the date of the transaction and store these in instance variables. It then has one method to print out the values. For formatting, I decided to create a helper method for Floats and Integers, which would return a string of the value to 2 decimal places.

Once this was complete, the BankAccount's statement method was able to just print the header for the statement, and then iterate over the array of Transactions, delegating the task of printing the details to the Transaction.

After further thought, I could go onto extract another class out from both Bank Account and Transaction, which would manage the task of printing. However for now, to keep it simple, I have decided to leave it as it is.
