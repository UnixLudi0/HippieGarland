#!/bin/bash

PS3="Это CrazyHippieland, выберите скрипт: "

options=("Установить Arch Linux" "Установить Hyprland" "Установка драйверов Nvidia" "Применение оптимизаций из ARU" "Установка прикладных программ" "Удаление Hyprland и прикладных программ" "Выход")

select opt in "${options[@]}"; do
    case $opt in
        "Установить Arch Linux")
            echo "Запуск скрипта..."
            #sudo bash ./arch.sh
            ;;
        "Установить Hyprland")
            echo "Запуск скрипта..."
            bash ./hyprland.sh
            ;;
        "Установка драйверов Nvidia")
            echo "Запуск скрипта..."
            bash ./nvidia.sh
            ;;
        "Применение оптимизаций из ARU")
            echo "Запуск скрипта..."
            bash ./aru.sh
            ;;
        "Установка прикладных программ")
            echo "Запуск скрипта..."
            bash ./apps.sh
            ;;
        "Удаление Hyprland и прикладных программ")
            echo "Запуск скрипта..."
            bash ./uninstall.sh
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
