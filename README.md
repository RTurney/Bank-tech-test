# Bank tech test

This is the repo for the bank tech test. This script will allow users to withdraw/deposit an amount into their account. Users can print bank statements detailing their recent transactions.  

## Build status:

This code is still in development.

## Implemented features:

* Bank class exists
* Has an empty account on initialisation

## User instructions:

To install this script run:
`<git clone git@github.com:RTurney/Bank-tech-test.git>`

To use this code please run form the command line:
```
cd Bank-tech-test
irb -r 'lib/bank'
```
To create a bank object please run:
```
bank = Bank.new  
```
To deposit some money please run:
```
 bank.deposit(amount)
```
To withdraw some money please run:
```
bank.withdraw(amount)
```
To print a bank statement please run:
```
bank.statement
```

## Tests

If you wish to run the test infrastructure for this project, just run `<rspec>` in the command terminal.

The full spectrum of tests can be found within the spec folder and are run with RSpec.

## Upcoming features:
 This is a list of upcoming features to be implemented within this project:

 * a bank object
 * deposit method
 * withdrawal method
 * print statement method
