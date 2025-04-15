#!/bin/bash
add_password(){
#tempの一時ファイルに複合して保存する
gpg -d file.txt.gpg > temp.txt

echo "サービス名を入力してください！" 
read service_name
echo "ユーザー名を入力してください！" 
read user_name
echo "パスワードを入力してください！" 
read password

#一時ファイルに追記する
echo -e "echo -e "\nサービス名: $service_name\nユーザー名: $user_name\nパスワード: $password" >> temp.txt
"
gpg -c -o file.txt.gpg temp.txt
#ファイルの削除
rm temp.txt

echo "パスワードの追加は成功しました。"
}

get_password(){
read -p "サービスを入力してください:" search_service
if grep -q "$search_service" file.txt; then
	grep -A 2 "$search_service" file.txt

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
