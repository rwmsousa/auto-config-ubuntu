#!/bin/bash

# Script principal para configurar uma máquina Ubuntu

# Verificar se o usuário tem privilégios de sudo
if [ "$(id -u)" != "0" ]; then
  echo "Este script precisa ser executado com privilégios de superusuário (sudo)."
  exit 1
fi

# Diretório onde os scripts estão localizados
SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Executar os scripts individuais
$SCRIPTS_DIR/1.configure_system.sh
$SCRIPTS_DIR/2.install_essentials.sh
$SCRIPTS_DIR/3.install_applications.sh

# Limpar pacotes desnecessários após a instalação
sudo apt autoremove -y
sudo apt clean

echo "Configuração concluída com sucesso!"
