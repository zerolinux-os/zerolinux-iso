# إضافات رائعة لملف ~/.bashrc أو ~/.zshrc

# ألوان محسنة مع تأثيرات
BLUE='\033[1;34m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
DIM='\033[2m'
BLINK='\033[5m'
RESET='\033[0m'

# شعار محسن مع تأثيرات بصرية
zerolinux_logo() {
    clear
    echo ""

    # خط علوي متحرك
    echo -e "${CYAN}════════════════════════════════════════════════════════════════════════════════${RESET}"
    echo ""

    # الشعار الأساسي
    echo -e "${BLUE}███████╗███████╗██████╗  ██████╗ ${RED}██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗${RESET}"
    echo -e "${BLUE}╚══███╔╝██╔════╝██╔══██╗██╔═══██╗${RED}██║     ██║████╗  ██║██║   ██║╚██╗██╔╝${RESET}"
    echo -e "${BLUE}  ███╔╝ █████╗  ██████╔╝██║   ██║${RED}██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ ${RESET}"
    echo -e "${BLUE} ███╔╝  ██╔══╝  ██╔══██╗██║   ██║${RED}██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ ${RESET}"
    echo -e "${BLUE}███████╗███████╗██║  ██║╚██████╔╝${RED}███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗${RESET}"
    echo -e "${BLUE}╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ${RED}╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝${RESET}"
    echo ""

    # معلومات النظام محسنة
    echo -e "${PURPLE}╭─────────────────────────── ${BLINK}${BOLD}System Information${RESET} ${PURPLE}─────────────────────────╮${RESET}"
    echo -e "${PURPLE}│${RESET}"
    echo -e "${PURPLE}│${RESET} ${CYAN}🖥️  OS:${RESET} ${GREEN}$(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d'=' -f2 | tr -d '"' || echo 'Linux')${RESET}"
    echo -e "${PURPLE}│${RESET} ${YELLOW}⚡ Kernel:${RESET} ${WHITE}$(uname -r)${RESET}"
    echo -e "${PURPLE}│${RESET} ${GREEN}👤 User:${RESET} ${CYAN}$(whoami)${RESET} ${PURPLE}│${RESET} ${RED}🏠 Host:${RESET} ${CYAN}$(hostname)${RESET}"
    echo -e "${PURPLE}│${RESET} ${BLUE}🐚 Shell:${RESET} ${WHITE}$(basename $SHELL)${RESET} ${PURPLE}│${RESET} ${YELLOW}⏰ Time:${RESET} ${GREEN}$(date '+%H:%M:%S')${RESET}"
    echo -e "${PURPLE}│${RESET} ${CYAN}💾 Memory:${RESET} ${WHITE}$(free -h | awk '/^Mem:/ {print $3"/"$2}')${RESET} ${PURPLE}│${RESET} ${GREEN}💽 Disk:${RESET} ${WHITE}$(df -h / | awk 'NR==2{print $3"/"$2}')${RESET}"
    echo -e "${PURPLE}│${RESET}"
    echo -e "${PURPLE}╰──────────────────────── ${BOLD}${GREEN}Welcome to ZeroLinux!${RESET} ${PURPLE}─────────────────────────╯${RESET}"
    echo ""

    # خط سفلي
    echo -e "${CYAN}════════════════════════════════════════════════════════════════════════════════${RESET}"
    echo ""
}

# دالة معلومات سريعة
sysinfo() {
    echo -e "${BOLD}${BLUE}🔧 Quick System Info:${RESET}"
    echo -e "${GREEN}├─${RESET} Uptime: ${CYAN}$(uptime -p)${RESET}"
    echo -e "${GREEN}├─${RESET} CPU: ${CYAN}$(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)${RESET}"
    echo -e "${GREEN}├─${RESET} Load: ${CYAN}$(uptime | awk -F'load average:' '{print $2}')${RESET}"
    echo -e "${GREEN}└─${RESET} Processes: ${CYAN}$(ps aux | wc -l) running${RESET}"
    echo ""
}

# دالة للطقس (اختيارية - تحتاج إنترنت)
weather() {
    echo -e "${BLUE}🌤️  Weather:${RESET}"
    curl -s "wttr.in/?format=3" 2>/dev/null || echo -e "${RED}❌ Unable to fetch weather${RESET}"
    echo ""
}

# aliases مفيدة مع ألوان
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias logo='zerolinux_logo'
alias info='sysinfo'
alias weather='weather'

# aliases للتنقل السريع
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# aliases للأوامر الشائعة
alias c='clear'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias du='du -kh'
alias df='df -kTh'

# تحسين التاريخ
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups:erasedups

# عرض الشعار عند فتح الطرفية
zerolinux_logo

# رسائل تفاعلية
echo -e "${GREEN}💡 Quick Commands:${RESET}"
echo -e "   ${CYAN}logo${RESET}    - Show ZeroLinux logo"
echo -e "   ${CYAN}info${RESET}    - System information"
echo -e "   ${CYAN}weather${RESET} - Current weather"
echo -e "   ${CYAN}c${RESET}       - Clear screen"
echo ""

# رسالة عشوائية
MESSAGES=(
    "🚀 Ready to explore the terminal!"
    "💻 ZeroLinux - Where possibilities are endless!"
    "⚡ Terminal powered by ZeroLinux!"
    "🎯 Focus, code, achieve!"
    "🔥 Let's build something amazing!"
)
RANDOM_MSG=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}
echo -e "${YELLOW}${RANDOM_MSG}${RESET}"
echo ""
export GEMINI_API_KEY="AIzaSyDOJUO6r9o7eBfZVCoi0BU1zj9EyKYzHuU"

# Zero7x-Cybersecurity Tool Aliases (v1.2)
alias nmap-quick='nmap -T4 -F'
alias nmap-full='nmap -T4 -A -v'
alias nmap-vuln='nmap --script vuln'
alias hydra-ssh='hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://'
alias sqlmap-crawl='sqlmap --crawl=3 --batch'
alias gobuster-dir='gobuster dir -u'
alias ffuf-dir='ffuf -w /usr/share/wordlists/dirb/common.txt -u'
alias nikto-scan='nikto -h'
alias metasploit='msfconsole'
alias wireshark='wireshark &'
alias update-security='sudo pacman -Syu && yay -Syu'


# Oh-My-Posh Config
eval "$(oh-my-posh init bash --config $HOME/.config/ohmyposh/distrous-xero-linux.omp.json)"

