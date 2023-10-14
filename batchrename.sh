# Перевірка наявності необхідної кількості аргументів
if [ "$#" -ne 3 ]; then
    echo "Потрібно вказати каталог, оригінальне розширення та нове розширення."
    exit 1
fi

# Збереження аргументів в змінних
directory="$1"
original_ext="$2"
new_ext="$3"

# Перевірка, чи існує вказаний каталог
if [ ! -d "$directory" ]; then
    echo "Каталог '$directory' не існує."
    exit 1
fi

# Зміна поточного каталогу на вказаний каталог
cd "$directory" || exit 1

# Перебір файлів з вказаним розширенням та їх перейменування
for file in *.$original_ext; do
    if [ -e "$file" ]; then
        new_name="${file%.$original_ext}.$new_ext"
        mv "$file" "$new_name"
        echo "Переіменовую $file на $new_name"
    fi
done
