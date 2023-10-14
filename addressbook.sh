# Перевірка, чи існує файл, що представляє адресну книгу
if [ ! -f addressbook.txt ]; then
    touch addressbook.txt
fi

# Функція для додавання запису до адресної книги
add_entry() {
    name="$2"
    email="$3"
    echo "$name:$email" >> addressbook.txt
}

# Функція для відображення всіх записів у адресній книзі
list_entries() {
    if [ -s addressbook.txt ]; then
        cat addressbook.txt | tr ':' ' '
    else
        echo "адресна книга порожня"
    fi
}

# Функція для видалення всіх записів, пов'язаних із заданим іменем
remove_entries() {
    name="$2"
    sed -i "/^$name:/d" addressbook.txt
}

# Функція для очищення адресної книги
clear_book() {
    > addressbook.txt
}

# Функція для пошуку та виводу всіх електронних адрес разом із іменами, пов'язаними із заданим іменем
lookup_entries() {
    name="$2"
    grep "^$name:" addressbook.txt | while IFS=: read -r found_name email; do
        echo "$found_name: $email"
    done
}

# Перевірка введеної команди та виклик відповідної функції
case "$1" in
    "new")
        add_entry "$@"
        ;;
    "list")
        list_entries
        ;;
    "remove")
        remove_entries "$@"
        ;;
    "clear")
        clear_book
        ;;
    "lookup")
        lookup_entries "$@"
        ;;
    *)
        echo "Невідома команда. Використовуйте ./addressbook new/list/remove/clear/lookup"
        ;;
esac
