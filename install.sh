#!/bin/bash

bash ./config.sh
PS3="Это HippieGarland, выберите скрипт: "

options=("Установить Arch Linux" "Редактировать конфиг" "Базовая настройка" "Установка Hyprland" "Установка прикладных программ" "Установка продвинутых программ" "WINE" "Оптимизация" "Удаление Hyprland и прикладных программ" "Выход")

select opt in "${options[@]}"; do
    case $opt in
        "Установить Arch Linux")
            #echo "Запуск arch.txt..."
            #sudo bash ./arch.txt
            ;;
        "Редактировать конфиг")
            echo "Запуск config.sh..."
            bash ./scripts/config.sh
            ;;
        "Базовая настройка")
            echo "Запуск base.sh..."
            bash ./scripts/base.sh
            ;;
        "Установка Hyprland")
            echo "Запуск hyprland.sh..."
            bash ./scripts/hyprland.sh
            ;;
        "Установка прикладных программ")
            echo "Запуск apps.sh..."
            bash ./scripts/apps.sh
            ;;
        "Установка продвинутых программ")
            echo "Запуск apps-extra.sh..."
            bash ./scripts/apps-extra.sh
            ;;
        "WINE")
            echo "Запуск wine.sh..."
            bash ./scripts/wine.sh
            ;;
        "Оптимизация")
            echo "Запуск optimization.sh..."
            bash ./scripts/optimization.sh
            ;;
        "Удаление Hyprland и прикладных программ")
            echo "Запуск скрипта удаления..."
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
