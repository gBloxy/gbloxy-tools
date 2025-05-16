# g_Bloxy's utils tools

This repository contains some tools I made.

## Account - GLA

An account manager for my leaderboard games.  
Its useful when you want to play with the same name on multiple games that have a leaderboard.

### Installation

- Make sure you have Python installed.
- Download the source code or clone the repository.
- Go inside `account`.
- Execute `install.bat` if you are on windows, `install.sh` if you are on linux.

### Usage

- Get current account information (username and uuid) :
  ```bash
  gla --get
  ```
- Login via username and uuid :
  ```bash
  gla --login <username> <uuid>
  ```
- Logout from the current session :
  ```bash
  gla --logout
  ```
- Save account information in a file :
  ```bash
  gla --save <file_path>
  ```
- Load account and login from a file :
  ```bash
  gla --load <file_path>
  ```
