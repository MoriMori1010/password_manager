#!/bin/bash

#パスワードを追加する関数
add_password(){
#tempの一時ファイルに複合して保存する
gpg -d file.txt.gpg > temp.txt

#情報をもらう
read -p "サービス名を入力してください！" service_name
read -p "ユーザー名を入力してください！" user_name
read -p "パスワードを入力してください！" password

#一時ファイルに追記する
echo -e "echo -e "\nサービス名: $service_name\nユーザー名: $user_name\nパスワード: $password" >> temp.txt
"
gpg -c -o file.txt.gpg temp.txt
#ファイルの削除
rm temp.txt

echo "パスワードの追加は成功しました。"
}

#パスワードを受け取る関数
get_password(){
read -p "サービスを入力してください:" search_setvice
#ファイルを複合して検索する
if gpg -d file.txt.gpg | grep -q "$search_service"; then
	gpg -d file.txt.gpg |  grep -A 2 "$search_service" 

else
	echo "$search_service は登録されていません。"
fi
}

echo "パスワードマネージャへようこそ！"
while true; do
read -p "次の選択肢から入力してください(AddPassword/GetPassword/Exit):" chose

if [ "$chose" = "Exit" ]; then
	echo "Thank you!" 
	break
elif [ "$chose" = "AddPassword" ]; then
	add_password
elif [ "$chose" = "GetPassword" ]; then
	get_password
else
	echo "入力が間違えています。AddPassword/GetPassword/Exitから入力してください。"
fi
done
