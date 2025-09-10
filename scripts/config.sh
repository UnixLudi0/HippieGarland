PS3="Конфигурация параметров: "

options=("Язык" "Процессор" "Видеокарта" "Выход")

while true; do
    echo "=== ГЛАВНОЕ МЕНЮ ==="
    select opt in "${options[@]}"; do
        case $opt in
            "Язык")
                options1=("Русский" "Английский")
                echo "=== ВЫБОР ЯЗЫКА ==="
                select opt1 in "${options1[@]}"; do
                    case $opt1 in
                        "Русский")
                            echo "ru" >> config.txt
                            echo "Выбран русский язык"
                            break
                            ;;
                        "Английский")
                            echo "us" >> config.txt
                            echo "Выбран английский язык"
                            break
                            ;;
                    esac
                done
                break
                ;;
            "Процессор")
                options2=("Intel" "AMD")
                echo "=== ВЫБОР ПРОЦЕССОРА ==="
                select opt2 in "${options2[@]}"; do
                    case $opt2 in
                        "Intel")
                            echo "intel-cpu" >> config.txt
                            echo "Выбран процессор Intel"
                            break
                            ;;
                        "AMD")
                            echo "amd-cpu" >> config.txt
                            echo "Выбран процессор AMD"
                            break
                            ;;
                    esac
                done
                break
                ;;
            "Видеокарта")
                options3=("Intel" "AMD" "Nvidia")
                echo "=== ВЫБОР ВИДЕОКАРТЫ ==="
                select opt3 in "${options3[@]}"; do
                    case $opt3 in
                        "Intel")
                            echo "intel-gpu" >> config.txt
                            echo "Выбрана видеокарта Intel"
                            break
                            ;;
                        "AMD")
                            echo "amd-gpu" >> config.txt
                            echo "Выбрана видеокарта AMD"
                            break
                            ;;
                        "Nvidia")
                            echo "nvidia-gpu" >> config.txt
                            echo "Выбрана видеокарта Nvidia"
                            break
                            ;;
                    esac
                done
                break
                ;;
            "Выход")
                echo "Выход..."
                exit 0
                ;;
            *)
                echo "Неверный выбор!"
                break
                ;;
        esac
    done
done































































