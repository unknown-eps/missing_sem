# Shell Commands Reference

This document contains a collection of useful shell commands along with their descriptions and example outputs.

## Table of Contents
- [Shell Commands Reference](#shell-commands-reference)
  - [Table of Contents](#table-of-contents)
  - [Date and Time Commands](#date-and-time-commands)
    - [`date`](#date)
  - [File and Directory Operations](#file-and-directory-operations)
    - [`ls`](#ls)
    - [`pwd`](#pwd)
    - [`mkdir`](#mkdir)
  - [System Information](#system-information)
    - [`whoami`](#whoami)
    - [`uname`](#uname)
    - [`df`](#df)
  - [Administrative Commands](#administrative-commands)
    - [`sudo su`](#sudo-su)
  - [Process Management](#process-management)
    - [`ps`](#ps)
    - [`top`](#top)
    - [`jobs`](#jobs)
    - [`fg`](#fg)
    - [`bg`](#bg)
    - [`disown`](#disown)
  - [Text Processing and I/O](#text-processing-and-io)
    - [`tee`](#tee)
  - [Shell Variables and Special Parameters](#shell-variables-and-special-parameters)
    - [`$$` (Process ID)](#-process-id)
    - [`$?` (Exit Code)](#-exit-code)
    - [`$#` (Number of Arguments)](#-number-of-arguments)
    - [`$0` (Script Name)](#0-script-name)
    - [`$1, $2, $3...` (Positional Parameters)](#1-2-3-positional-parameters)
    - [`$*` (All Arguments)](#-all-arguments)
    - [`$@` (All Arguments as Array)](#-all-arguments-as-array)
    - [`$!` (Background Process PID)](#-background-process-pid)
    - [`$_` (Last Argument)](#_-last-argument)
    - [`$$` vs `$BASHPID`](#-vs-bashpid)
  - [Tips for Adding New Commands](#tips-for-adding-new-commands)

---

## Date and Time Commands

### `date`
**Description:** Prints the current date and time

**Usage:**
```bash
date
```

**Example Output:**
```
Mon Nov  4 14:30:25 IST 2025
```

**Options:**
- `date +"%Y-%m-%d"` - Custom format (YYYY-MM-DD)
- `date +"%H:%M:%S"` - Time only (HH:MM:SS)

---

## File and Directory Operations

### `ls`
**Description:** Lists directory contents

**Usage:**
```bash
ls [options] [directory]
```

**Example Output:**
```
commands.md  README.md  shell/
```

**Common Options:**
- `ls -l` - Long format listing
- `ls -la` - Include hidden files
- `ls -lh` - Human-readable file sizes

### `pwd`
**Description:** Print working directory

**Usage:**
```bash
pwd
```

**Example Output:**
```
/home/username/Desktop/project/shell
```

### `mkdir`
**Description:** Create directories

**Usage:**
```bash
mkdir [options] directory_name
```

**Example:**
```bash
mkdir new_folder
mkdir -p path/to/nested/folder
```

---

## System Information

### `whoami`
**Description:** Display current username

**Usage:**
```bash
whoami
```

**Example Output:**
```
username
```

### `uname`
**Description:** System information

**Usage:**
```bash
uname -a
```

**Example Output:**
```
Linux hostname 5.15.0-86-generic #96-Ubuntu SMP Wed Sep 20 08:23:49 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
```

### `df`
**Description:** Display filesystem disk space usage

**Usage:**
```bash
df -h
```

**Example Output:**
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       100G   45G   50G  48% /
tmpfs           8.0G     0  8.0G   0% /dev/shm
```

---

## Administrative Commands

### `sudo su`
**Description:** Switch to the root user (superuser) with elevated privileges

**Usage:**
```bash
sudo su
```

**Example Output:**
```
[sudo] password for username: 
root@hostname:/current/directory# 
```

**Note:** 
- You'll be prompted to enter your password
- After switching, you'll have root privileges (notice the `#` prompt instead of `$`)
- Use `exit` to return to your regular user account
- Use with caution as root has full system access

**Related Commands:**
- `sudo su -` - Switch to root with root's environment
- `sudo -i` - Start a login shell as root
- `exit` - Return to previous user

---

## Process Management

### `ps`
**Description:** Display running processes

**Usage:**
```bash
ps aux
```

**Example Output:**
```
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.1 168548 11704 ?        Ss   Oct30   0:02 /sbin/init
user      1234  0.5  2.1 2847364 174580 ?      Sl   14:25   0:05 /usr/bin/code
```

### `top`
**Description:** Display and update sorted information about running processes

**Usage:**
```bash
top
```

**Note:** Press `q` to quit top

### `jobs`
**Description:** Display active jobs (background and suspended processes) in the current shell session

**Usage:**
```bash
jobs [options]
```

**Example Output:**
```
[1]-  Running                 sleep 100 &
[2]+  Stopped                 vim file.txt
[3]   Running                 python script.py &
```

**Common Options:**
- `jobs -l` - Include process IDs (PIDs)
- `jobs -p` - Display only PIDs
- `jobs -r` - Display only running jobs
- `jobs -s` - Display only stopped jobs

### `fg`
**Description:** Bring a background or suspended job to the foreground

**Usage:**
```bash
fg [job_number]
```

**Examples:**
```bash
# Bring the most recent job to foreground
fg

# Bring specific job to foreground
fg %1
fg 1
```

**Example Output:**
```bash
$ fg %1
sleep 100
```

**Note:** If no job number is specified, the most recent job is brought to foreground

### `bg`
**Description:** Resume a suspended job in the background

**Usage:**
```bash
bg [job_number]
```

**Examples:**
```bash
# Resume the most recent suspended job in background
bg

# Resume specific job in background
bg %2
bg 2
```

**Example Output:**
```bash
$ bg %1
[1]+ sleep 100 &
```

**Note:** If no job number is specified, the most recent suspended job is resumed

### `disown`
**Description:** Remove jobs from the shell's job table, preventing them from being terminated when the shell exits

**Usage:**
```bash
disown [options] [job_spec]
```

**Examples:**
```bash
# Disown the most recent job
disown

# Disown specific job
disown %1

# Disown all jobs
disown -a

# Remove job from table but don't send SIGHUP
disown -h %1
```

**Common Options:**
- `disown -a` - Remove all jobs from the job table
- `disown -h` - Mark job so it won't receive SIGHUP when shell exits
- `disown -r` - Remove only running jobs

**Use Cases:**
- Keep processes running after closing terminal
- Prevent accidental termination of long-running tasks
- Clean up job table

---

## Text Processing and I/O

### `tee`
**Description:** Read from input and write to both output and files simultaneously. Useful for displaying output while also saving it to a file.

**Usage:**
```bash
command | tee [options] filename
tee [options] filename
```

**Examples:**
```bash
# Display output and save to file
ls -la | tee directory_listing.txt

# Save to multiple files
echo "Hello World" | tee file1.txt file2.txt

# Append to file instead of overwriting
date | tee -a logfile.txt

# Display and save command output
ps aux | tee process_list.txt
```

**Example Output:**
```bash
$ ls -la | tee directory_listing.txt
total 16
drwxrwxr-x 3 username username 4096 Nov  4 14:30 .
drwxrwxr-x 4 username username 4096 Nov  4 14:25 ..
-rw-rw-r-- 1 username username 5234 Nov  4 14:30 commands.md
drwxrwxr-x 2 username username 4096 Nov  4 14:20 dir2
```
*Note: The same output is also written to `directory_listing.txt`*

**Common Options:**
- `tee -a filename` - Append to file instead of overwriting
- `tee filename1 filename2` - Write to multiple files
- `tee -i` - Ignore interrupt signals

**Use Cases:**
- Logging command output while viewing it
- Saving pipeline output for later analysis
- Creating backups of command results
- Debugging by capturing intermediate pipeline steps

---

## Shell Variables and Special Parameters

### `$$` (Process ID)
**Description:** Returns the process ID (PID) of the current shell

**Usage:**
```bash
echo $$
```

**Example Output:**
```
1234
```

### `$?` (Exit Code)
**Description:** Returns the exit status of the last executed command (0 for success, non-zero for error)

**Usage:**
```bash
ls /existing/directory
echo $?
ls /nonexistent/directory
echo $?
```

**Example Output:**
```
0
ls: cannot access '/nonexistent/directory': No such file or directory
2
```

### `$#` (Number of Arguments)
**Description:** Returns the number of positional parameters (command-line arguments) passed to a script

**Usage:**
```bash
# In a script:
echo "Number of arguments: $#"
```

**Example Output:**
```bash
# Running: ./script.sh arg1 arg2 arg3
Number of arguments: 3
```

### `$0` (Script Name)
**Description:** Returns the name of the script or shell

**Usage:**
```bash
echo $0
```

**Example Output:**
```
./myscript.sh
# or
bash
```

### `$1, $2, $3...` (Positional Parameters)
**Description:** Returns the value of positional parameters (command-line arguments)

**Usage:**
```bash
# In a script:
echo "First argument: $1"
echo "Second argument: $2"
```

**Example Output:**
```bash
# Running: ./script.sh hello world
First argument: hello
Second argument: world
```

### `$*` (All Arguments)
**Description:** Returns all positional parameters as a single string

**Usage:**
```bash
echo "All arguments: $*"
```

**Example Output:**
```bash
# Running: ./script.sh arg1 arg2 arg3
All arguments: arg1 arg2 arg3
```

### `$@` (All Arguments as Array)
**Description:** Returns all positional parameters as separate quoted strings

**Usage:**
```bash
for arg in "$@"; do
    echo "Argument: $arg"
done
```

**Example Output:**
```bash
# Running: ./script.sh "hello world" "foo bar"
Argument: hello world
Argument: foo bar
```

### `$!` (Background Process PID)
**Description:** Returns the process ID of the last background command

**Usage:**
```bash
sleep 100 &
echo $!
```

**Example Output:**
```
5678
```

### `$_` (Last Argument)
**Description:** Returns the last argument of the previous command

**Usage:**
```bash
ls /home/user/documents
echo $_
```

**Example Output:**
```
/home/user/documents
```

### `$$` vs `$BASHPID`
**Description:** `$$` gives the main shell PID, `$BASHPID` gives the current subshell PID

**Usage:**
```bash
echo "Main shell: $$"
echo "Current shell: $BASHPID"
(echo "Subshell: $BASHPID")
```

---

## Tips for Adding New Commands

When adding new commands to this document, follow this format:

```markdown
### `command_name`
**Description:** Brief description of what the command does

**Usage:**
```bash
command_name [options] [arguments]
```

**Example Output:**
```
Sample output here
```

**Common Options:** (if applicable)
- `option1` - Description
- `option2` - Description



