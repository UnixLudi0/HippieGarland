PS3="Конфигурация параметров..."

options=("Язык" "Процессор" "Видеокарта" "Выход")

select opt in "${options[@]}"; do
    case $opt in
        "Язык")
            options1=("Русский" "Английский")
            select opt1 in "${options1[@]}"; do
              case $opt1 in
                "Русский")
                  echo "ru" >> config.txt
                ;;
                "Английский")
                  echo "us" >> config.txt
                ;;
              esac
            done
            ;;
        "Процессор")
           options2=("Intel" "AMD")
            select opt2 in "${options2[@]}"; do
              case $opt2 in
                "Intel")
                  echo "intel-cpu" >> config.txt
                ;;
                "AMD")
                  echo "amd-cpu" >> config.txt
                ;;
              esac
            done
            ;;
        "Видеокарта")
           options3=("Intel" "AMD" "Nvidia")
            select opt3 in "${options3[@]}"; do
              case $opt3 in
                "Intel")
                  echo "intel-gpu" >> config.txt
                ;;
                "AMD")
                  echo "amd-gpu" >> config.txt
                ;;
              "Nvidia")
                echo "nvidia-gpu" >> config.txt
              ;;
              esac
            done
            ;;
        "Выход")
            echo "Выход..."
            break
            ;;
        *)
            echo "Неверный выбор!"
            ;;
    esac
done
