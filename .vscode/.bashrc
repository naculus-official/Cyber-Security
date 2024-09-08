# COLOR mapping
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
WHITE="\e[0m"
ENDCOLOR="\e[0m"


echo -e "${GREEN}Setting up vscode terminal environment${ENDCOLOR}"
echo -e "${GREEN}Current directory: ${YELLOW}$(pwd)${ENDCOLOR}"
echo -e "${WHITE}Author: github.com/yomisana${ENDCOLOR}"


echo -e "${WHITE}[.vscode - env] ${YELLOW}Hello world!${ENDCOLOR}"
# # 檢查 laragon 是否在背景執行，如果沒有則啟動 laragon，並將輸出導向 .vscode/laragon.log
# # nohup laragon --console > .vscode/laragon.log 2>&1 &
if [ -z "$(ps -ef | grep laragon | grep -v grep)" ]; then
    echo "running laragon"
    echo -e "${WHITE}[.vscode - env] ${GREEN}Running laragon${ENDCOLOR}"
    laragon --console > .vscode/laragon.log 2>&1 &
else
    echo -e "${WHITE}[.vscode - env] ${RED}Already running laragon${ENDCOLOR}"
fi