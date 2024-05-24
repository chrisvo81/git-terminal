# git-terminal

## Project Overview

If you're used to Git Bash and want to make the terminal look similar, you can customize the prompt to include the current Git branch and status. Here's how you can do it:

This project provides a set of `.zshrc` and `.bashrc` scripts that customize the terminal to mimic the color scheme and behavior of the Git Bash program. By following the instructions below, you can apply these customizations to the terminal environment.

## Prerequisites

Before you begin, you need to determine which configuration file the shell uses. The common configuration files are:

- `.bashrc`
- `.bash_profile`
- `.zshrc`

## Initial Steps to take

### 1. Check if Home Directory has `.bashrc`, `.bash_profile`, or `.zshrc`

Open the terminal and navigate to the home directory by typing:

```bash
cd ~
```

Use the `ls` command in the terminal to list the files to see if you have any of the following configuration files:

```bash
ls -a ~/
```

This command lists all files in the home directory, including hidden ones (those starting with a `.`). Look for `.bashrc`, `.bash_profile`, or `.zshrc` in the output.

If there are too many file, use this command lists all files in the home directory and filters the output to show only the files that match `.bashrc`, `.bash_profile`, or `.zshrc`.

```jsx
ls -a ~/ | grep -E '^\.(bashrc|bash_profile|zshrc)$'
```

### 2. Choose the Right File

Depending on the shell, you need to update the appropriate file:

- Bash Shell: Use `.bashrc` or `.bash_profile`

- Zsh Shell: Use `.zshrc`

### 3. Edit the Configuration File

You can edit the file using a text editor. Choose between nano or code (Visual Studio Code):

- To use nano: `nano [file_name]`

- To user Visual Studio Code: `code .`

## How to write the own `zshrc` script

### Colors

For `zshrc`, the colors in the PROMPT variable are built-in color codes for the Zsh shell. In Zsh, you can use the `%F{color}` syntax to set the foreground color. The `%f` resets the color back to the default.

The colors you can use are `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`, and a numeric value between `0` and `255` for 256-color mode.

### Prompt

The PROMPT variable is used to customize the command prompt. It can include a variety of special sequences that are replaced with information about the current shell session. Here are some of the most commonly used ones:

- `%n`: The username of the current user.

- `%m`: The hostname up to the first '.'.

- `%M`: The full hostname.

- `%l`: The name of the shell's terminal device.

- `%?`: The return status of the last command executed just before the prompt.

- `%#`: A # if the shell is running with privileges, a % otherwise.

- `%~`: The current working directory. If the current directory starts with the home directory, the ~ is substituted in.

- `%1~`: The current working directory, but only the last component. If the current directory is the home directory, the ~ is substituted in.

- `%2~`: The current working directory, but only the last two components, and so on.

- `%d` or `%/`: The current working directory.

- `%D{format}`: The current date in the given format.

- `%t`, `%T`, `%*`: The current time in various formats.

- `%!`: The current history event number.

- `%j`: The number of jobs.

- `%v` and `%V`: The version of zsh.

You can use these sequences to customize the prompt to show the information you find most useful. For example, if you wanted to show the full hostname, the current directory, and the current time, you could use:

```bash
PROMPT='%M %~ %T %# '
```

Remember to use the `setopt PROMPT_SUBST` command before setting PROMPT if If you want to use variables (like `$USER` or `$HOME`) or command substitutions (like `$(date)`) in the prompt. For example:

```bash
setopt PROMPT_SUBST
PROMPT='Hello, $USER. The date is $(date +%Y-%m-%d). %~ %# '
```

### precmd

The `vcs_info` is a built-in zsh function for version control system information. This function supports multiple VCSs, not just Git, and provides a lot of flexibility for customizing the prompt. The `precmd` function is a special function in `zsh` that is executed before each prompt; in the setup, it's used to update the BRANCH variable with the current branch information from `vcs_info`. This `BRANCH` variable is then used in the PROMPT setting
