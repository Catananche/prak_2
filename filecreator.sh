# Вказати ваше ім'я
yourName="KarinaBilous"

# Перевірка наявних файлів у поточному каталозі та знаходження максимального номера
max_number=0
for file in ${yourName}*
do
  if [[ $file =~ ${yourName}([0-9]+) ]]; then
    number="${BASH_REMATCH[1]}"
    if [ "$number" -gt "$max_number" ]; then
      max_number="$number"
    fi
  fi
done

# Цикл для створення 25 нових файлів
for ((i = max_number + 1; i <= max_number + 25; i++))
do
  filename="${yourName}${i}"
  touch "$filename"
  echo "Created file: $filename"
done
