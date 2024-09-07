# # alias mapping
# alias composer="php composer"
# alias mysql="mariadb"
# # http server
# alias http="php -S localhost:8080 > .vscode/http.log 2>&1 &"
# alias phpserver="php -S localhost:8080 > .vscode/http.log 2>&1 &"
# alias phps="php -S localhost:8080 > .vscode/http.log 2>&1 &"
# # mysqld --standalone &
# # mysqld --console &

# # COLOR mapping
# RED="\e[31m"
# GREEN="\e[32m"
# YELLOW="\e[33m"
# BLUE="\e[34m"
# WHITE="\e[0m"
# ENDCOLOR="\e[0m"

# echo -e "${GREEN}Setting up vscode terminal environment${ENDCOLOR}"
# echo -e "${GREEN}Current directory: ${YELLOW}$(pwd)${ENDCOLOR}"
# echo -e "${WHITE}Author: github.com/yomisana${ENDCOLOR}"

# # if .vscode/mariadb/data folder not exists, will run mysql_install_db if exists run mysqld
# if [ ! -d .vscode/mariadb/data ]; then
#     # mysql_install_db --user=root --datadir=.vscode/mariadb/data
#     echo -e "${WHITE}[.vscode - env] ${YELLOW}initialization mysql${ENDCOLOR}"
#     echo -e "${RED}Do not close this terminal until sql initializationcreation is complete${ENDCOLOR}"
#     mysql_install_db
#     # first time
#     mysqld --console > .vscode/sql.log 2>&1 &
#     echo -e "${YELLOW}importing template.sql${ENDCOLOR}"
#     mysql -u root < .vscode/template/template.sql
#     echo -e "${WHITE}[.vscode - env] ${GREEN}Database initialization completed!${ENDCOLOR}"
# fi

# # 檢查 mysqld 是否在背景執行，如果沒有則啟動 mysqld，並將輸出導向 .vscode/sql.log
# # nohup mysqld --console > .vscode/sql.log 2>&1 &
# if [ -z "$(ps -ef | grep mysqld | grep -v grep)" ]; then
#     # echo "running mysqld"
#     echo -e "${WHITE}[.vscode - env] ${GREEN}Running mysqld${ENDCOLOR}"
#     mysqld --console > .vscode/sql.log 2>&1 &
# else
#     echo -e "${WHITE}[.vscode - env] ${RED}Already running mysqld${ENDCOLOR}"
# fi

# echo -e "${WHITE}[.vscode - env] ${GREEN}Run command of 'http' or 'phpserver' or 'phps' start php server.${ENDCOLOR}"


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