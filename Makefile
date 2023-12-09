.PHONY: all

all: permission setup

permission:
    @chmod +x setup_machine.sh
    @echo "Permissões configuradas."

setup: permission
    @echo "Iniciando configuração..."
    @sudo ./setup_machine.sh
    @echo "Configuração concluída com sucesso!"


# NO TERMINAL, DIGITE APENAS "make" PARA EXECUTAR O SCRIPT