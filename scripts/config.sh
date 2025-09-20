#!/bin/bash
export HG_ROOT=$(realpath .)

config_menu() {
    PS3="Конфигурация параметров: "
    options=("Язык" "Процессор" "Видеокарта" "Показать настройки" "Назад")

    echo "=== ГЛАВНОЕ МЕНЮ КОНФИГА ==="
    select opt in "${options[@]}"; do
        case $REPLY in
            1)  # Язык
                choose_language
                ;;
            2)  # Процессор
                choose_cpu
                ;;
            3)  # Видеокарта
                choose_gpu
                ;;
            4)  # Показать настройки
                show_config
                ;;
            5)  # Назад
                echo "Возврат в основное меню..."
                return 0
                ;;
            *)
                echo "Неверный выбор! Выберите от 1 до 5"
                ;;
        esac
        
        # После выполнения команды снова показываем меню
        echo ""
        echo "=== ГЛАВНОЕ МЕНЮ КОНФИГА ==="
    done
}

choose_language() {
    options1=("Русский" "Английский" "Назад")
    echo "=== ВЫБОР ЯЗЫКА ==="
    select opt1 in "${options1[@]}"; do
        case $REPLY in
            1)
                export HG_LANG=ru
                echo "Выбран русский язык"
                return 0
                ;;
            2)
                export HG_LANG=en
                echo "Выбран английский язык"
                return 0
                ;;
            3)  # Назад
                return 0
                ;;
            *)
                echo "Неверный выбор!"
                ;;
        esac
    done
}

choose_cpu() {
    options2=("Intel" "AMD" "Назад")
    echo "=== ВЫБОР ПРОЦЕССОРА ==="
    select opt2 in "${options2[@]}"; do
        case $REPLY in
            1)
                export HG_CPU=intel-cpu
                echo "Выбран процессор Intel"
                return 0
                ;;
            2)
                export HG_CPU=amd-cpu
                echo "Выбран процессор AMD"
                return 0
                ;;
            3)  # Назад
                return 0
                ;;
            *)
                echo "Неверный выбор!"
                ;;
        esac
    done
}

choose_gpu() {
    options3=("Intel" "AMD" "Nvidia" "Назад")
    echo "=== ВЫБОР ВИДЕОКАРТЫ ==="
    select opt3 in "${options3[@]}"; do
        case $REPLY in
            1)
                export HG_GPU=intel-gpu
                echo "Выбрана видеокарта Intel"
                return 0
                ;;
            2)
                export HG_GPU=amd-gpu
                echo "Выбрана видеокарта AMD"
                return 0
                ;;
            3)
                export HG_GPU=nvidia-gpu
                echo "Выбрана видеокарта Nvidia"
                return 0
                ;;
            4)  # Назад
                return 0
                ;;
            *)
                echo "Неверный выбор!"
                ;;
        esac
    done
}

show_config() {
    echo "=== ТЕКУЩИЕ НАСТРОЙКИ ==="
    echo "Корневая директория: $HG_ROOT"
    echo "Язык: ${HG_LANG:-не выбран}"
    echo "Процессор: ${HG_CPU:-не выбран}" 
    echo "Видеокарта: ${HG_GPU:-не выбран}"
    echo "=========================="
    
    # Просто ждем любого ввода для возврата
    read -p "Нажмите Enter для возврата..."
}

# Запускаем меню конфига
config_menu
