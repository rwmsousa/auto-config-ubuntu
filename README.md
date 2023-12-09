# Automated Setup Script

This repository contains a script for automating the setup of your development environment. It covers the installation of essential tools, configuration settings, and application setups. The script is designed to be executed using the `make` command for easy and consistent setup across systems.

## Prerequisites

Before running the script, ensure that you have the following prerequisites installed:

- [Git](https://git-scm.com/)
- [Make](https://www.gnu.org/software/make/)

## Execution

To execute the script, follow these steps:

1. Clone this repository:

   ```bash
   git clone git@github.com:rwmsousa/auto-config-ubuntu.git
   ```

2. Navigate to the project directory:

   ```bash
   cd auto-config-ubuntu
   ```

3. Run the script using the `make` command:

   ```bash
   make setup
   ```

   This command will initiate the automated setup process.

## Configuration

The script may prompt you for user-specific information during execution, such as name and email for Git configuration. Make sure to provide the required details when prompted.

## Additional Notes

- Some steps in the script may require superuser (sudo) privileges. You might be prompted to enter your password during the execution.

- The script is designed for a specific development environment. If you encounter issues or want to customize the setup, feel free to modify the script to suit your requirements.

- After the script completes, you may need to restart your terminal or log out and log back in to apply certain changes.

## Support

If you encounter any issues or have questions regarding the setup script, feel free to [open an issue](https://github.com/your-username/automated-setup-script/issues). Contributions and suggestions for improvements are welcome.

Happy coding! 🚀
