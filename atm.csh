#!/bin/csh
#CS2600 Project 3
#Ryan Mangilin
echo "*** Welcome to Cal Poly's ATM System ***"
echo "Please enter your PIN:"
set savings = 1000 #initialize accounts and pin
set checking = 1000
set pin = 111
set pinCount = 1
while ( $pinCount < 4 ) #allows 3 tries for pin
set pinIN = $<
if ( $pinIN == $pin )then #checks pin
set stop = 0
while ( $stop == 0) #loop to reprompt menu
clear
echo "*** Welcome to Cal Poly's ATM System ***"
echo " "
echo "(1) Transfer from checking account to savings account"
echo "(2) Transfer from savings account to checking account"
echo "(3) Savings account balance"
echo "(4) Checking account balance"
echo "(5) Withdraw Cash from either account"
echo "(6) Exit"
echo "==> Please select option (1-6)"
set i = $<
if ( $i == 1 )then
echo "Enter the amount you wish to transfer from checking account to savings account"
set transfer1 = $< #amount to transfer
if ( $transfer1 <= $checking )then #checks if the transfer is possible
@ savings = $savings + $transfer1 #adding transfer amount to savings 
@ checking = $checking - $transfer1 #subtracting transfer amount from checking
else
echo "Transfer not completed"
echo "Current balance of checking account is $checking"
echo "Enter any button to continue"
set x = $<
endif
else if ( $i == 2)then
echo "Enter the amount you wish to transfer from savings account to checking account"
set transfer2 = $< #amount to transfer
if ( $transfer2 <= $savings )then
@ checking = $checking + $transfer2 #adding transfer amount to checking
@ savings = $savings - $transfer2 #subtracting transfer amount from savings
else
echo "Transfer not completed"
echo "Current balance of savings account is $savings"
echo "Enter any button to continue"
set x = $<
endif
else if ( $i == 3 )then
echo "Current balance of savings account is $savings"
echo "Enter any button to continue"
set x = $<
else if ( $i == 4 )then
echo "Current balance of checking account is $checking"
echo "Enter any button to continue"
set x = $<
else if ( $i == 5 )then
echo "Enter the amount you wish to withdraw"
set withdraw = $<
clear
echo "What account would you like to withdraw from?"
echo "(1) Savings"
echo "(2) Checking"
set account = $<
if ( $account == 1 )then
if ( $withdraw <= $savings )then #checks if withdraw can be honored
@ savings = $savings - $withdraw
else
echo "Transfer not completed"
echo "Current balance of savings account is $savings"
echo "Enter any button to continue"
set x = $<
endif
else if ( $account == 2 )then
if ( $withdraw <= $checking )then #checks if withdraw can be honored
@ checking = $checking - $withdraw
else
echo "Transfer not completed"
echo "Current balance of checking account is $checking"
echo "Enter any button to continue"
set x = $<
endif
endif
else if ( $i == 6 )then
clear
echo "Thank you for using the ATM system."
exit 0 #exits script
endif
end
else
clear
echo "*** Welcome to Cal Poly's ATM System ***"
echo "Please enter your PIN:"
@ pinCount = $pinCount + 1
endif
end
clear
echo "Too many illegal PINs. Try later again."
