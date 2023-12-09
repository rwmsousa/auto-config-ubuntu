.PHONY: all

all: permission setup

permission:
    @chmod +x setup_machine.sh
    @echo "Permissions configured."

setup: permission
    @echo "Starting configuration..."
    @sudo ./setup_machine.sh
    @echo "Configuration completed successfully!"
