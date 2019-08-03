#!/bin/bash
# display values just entered
# echo "$VALUES"
# Script author: Chinmay Deo-6000417021,Neel Vasani-60004170070,Parth Shah-6000417070
# Script date: 27-03-2019
# Script ver: 1.0

# The main function to create dialog
_zenity="/usr/bin/zenity"
user=test
pword=test
# Script use to create a password entry dialog.
 f_login () {
     # Define the command, we use both username and password fields.
     ENTRY=`zenity --password --username`
     
     
     # Read the result from the command above
     case $? in
         0)
            uvalue=`echo $ENTRY | cut -d'|' -f1`
            pvalue=`echo $ENTRY | cut -d'|' -f2`
             if [ "${uvalue}" = "${user}" ]
             then
                 if [ "${pvalue}" = "${pword}" ]
                 then
                     ${_zenity} --info \
                     --title "Login" \
                     --text="Successfully"
                     f_menu
                 else
                     ${_zenity} --error \
                     --text="Incorrect password"
                     f_login
                 fi
             else
                 ${_zenity} --error \
                 --text="Incorrect user"
                 f_login
             fi
                
            
             # At this step, you can assign a variable to username's value like this:
             # VAR_USERNAME=`echo $ENTRY | cut -d'|' -f1`
             
             # The result from ENTRY command look like: username|password
             # This command use to cut the first column -> get username
#             echo "User Name: `echo $ENTRY | cut -d'|' -f1`"
#              
#              # This command use to cut the second column -> get password
#             echo "Password : `echo $ENTRY | cut -d'|' -f2`"
         ;;
         1)
            echo "Stop login.";;
         -1)
            echo "An unexpected error has occurred.";;
     esac
 }
 
 #create timetable function
 f_menu () {
     
    selection=$(zenity --list "1. Create" "2. Display" --column="Task" --text="Select task from the list to perform" --title="Timetable Management System")

    case "$selection" in
    "1. Create")
        f_select_days;;
#     "2. Delete")
#         zenity --info --text="Do something here for No2";;
#     "3. Update")
#         zenity --info --text="Do something here for No3";;
    "2. Display")
        f_display
    esac
 }
 
  f_select_days  () {
    array=(Monday Tuesday Wednesday Thursday Friday Saturday)
    select=`zenity --entry --title "Select Starting day for Term Test" --entry-text "${array[@]}" --text "Insert your choice." `
    if [ "${select[0]}" = "Monday" ]
    then
        f_create_monday
        f_create_tuesday
        f_create_wednesday
    fi
    if [ "${select[0]}" = "Tuesday" ]
    then
        f_create_tuesday
        f_create_wednesday
        f_create_thursday
    fi
    if [ "${select[0]}" = "Wednesday" ]
    then
        f_create_wednesday
        f_create_thursday
        f_create_friday
    fi
    if [ "${select[0]}" = "Thursday" ]
    then
        f_create_thursday
        f_create_friday
        f_create_saturday
    fi
    if [ "${select[0]}" = "Friday" ]
    then
        f_create_friday
        f_create_saturday
        f_create_monday
    fi
    if [ "${select[0]}" = "Saturday" ]
    then
        f_create_saturday
        f_create_monday
        f_create_tuesday
    fi
    f_menu
 }
 
 
#  f_select () {
#     for ()
#  }
#  
 
 f_create_monday () {
    Enter1=`zenity --forms --title="Monday" $Enter1  \
        --add-entry="7:00 - 8:00" \
        --add-entry="8:00 - 9:00" \
        --add-entry="9:30 - 10:30" \
        --add-entry="10:30 - 11:30" \
        --add-entry="12:00 - 1:00"`
 }
 
  f_create_tuesday () {
    Enter2=`zenity --forms --title="Tuesday" \
        --add-entry="7:00 - 8:00" \
        --add-entry="8:00 - 9:00" \
        --add-entry="9:30 - 10:30" \
        --add-entry="10:30 - 11:30" \
        --add-entry="12:00 - 1:00"`
 }
 
  f_create_wednesday () {
    Enter3=`zenity --forms --title="Wednesday" \
        --add-entry="7:00 - 8:00" \
        --add-entry="8:00 - 9:00" \
        --add-entry="9:30 - 10:30" \
        --add-entry="10:30 - 11:30" \
        --add-entry="12:00 - 1:00"`
 }
 
  f_create_thursday () {
    Enter4=`zenity --forms --title="Thursday" \
        --add-entry="7:00 - 8:00" \
        --add-entry="8:00 - 9:00" \
        --add-entry="9:30 - 10:30" \
        --add-entry="10:30 - 11:30" \
        --add-entry="12:00 - 1:00"`
 }
 
  f_create_friday () {
    Enter5=`zenity --forms --title="Friday" \
        --add-entry="7:00 - 8:00" \
        --add-entry="8:00 - 9:00" \
        --add-entry="9:30 - 10:30" \
        --add-entry="10:30 - 11:30" \
        --add-entry="12:00 - 1:00"`
 }
 
  f_create_saturday () {
    Enter6=`zenity --forms --title="Saturday" \
        --add-entry="7:00 - 8:00" \
        --add-entry="8:00 - 9:00" \
        --add-entry="9:30 - 10:30" \
        --add-entry="10:30 - 11:30" \
        --add-entry="12:00 - 1:00"`
 }
#  `echo $Enter1 | cut -d'|' -f1`
#  `echo $ENTRY | cut -d'|' -f1`
#  `echo $ENTRY | cut -d'|' -f1`
#  `echo $ENTRY | cut -d'|' -f1`
#  `echo $ENTRY | cut -d'|' -f1`
 
  f_display () {
     zenity --list --column="" --column="Monday" --column="Tuesday" --column="Wednesday" --column="Thursday" --column="Friday" --column="Sturday" \
     "7:00 - 8:00" "`echo $Enter1 | cut -d'|' -f1`" "`echo $Enter2 | cut -d'|' -f1`" "`echo $Enter3 | cut -d'|' -f1`" "`echo $Enter4 | cut -d'|' -f1`" "`echo $Enter5 | cut -d'|' -f1`" "`echo $Enter6 | cut -d'|' -f1`" \
     "8:00 - 9:00" "`echo $Enter1 | cut -d'|' -f2`" "`echo $Enter2 | cut -d'|' -f2`" "`echo $Enter3 | cut -d'|' -f2`" "`echo $Enter4 | cut -d'|' -f2`" "`echo $Enter5 | cut -d'|' -f1`" "`echo $Enter6 | cut -d'|' -f2`" \
     "9:30 - 10:30" "`echo $Enter1 | cut -d'|' -f3`" "`echo $Enter2 | cut -d'|' -f3`" "`echo $Enter3 | cut -d'|' -f3`" "`echo $Enter4 | cut -d'|' -f3`" "`echo $Enter5 | cut -d'|' -f3`" "`echo $Enter6 | cut -d'|' -f3`" \
     "10:30 - 11:30" "`echo $Enter1 | cut -d'|' -f4`" "`echo $Enter2 | cut -d'|' -f4`" "`echo $Enter3 | cut -d'|' -f4`" "`echo $Enter4 | cut -d'|' -f4`" "`echo $Enter5 | cut -d'|' -f4`" "`echo $Enter6 | cut -d'|' -f4`" \
     "12:00 - 1:00" "`echo $Enter1 | cut -d'|' -f5`" "`echo $Enter2 | cut -d'|' -f5`" "`echo $Enter3 | cut -d'|' -f5`" "`echo $Enter4 | cut -d'|' -f5`" "`echo $Enter5 | cut -d'|' -f5`" "`echo $Enter6 | cut -d'|' -f5`"
     f_menu
  }
   
 # The main function of script
 f_main () {
     f_login
 }
 f_main
 exit
