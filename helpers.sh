# require the user to have root permission: 💥 and movie trailer 💥
sudo chmod 007 /usr/local/bin

# bring bin directory back to correct defaults that would not require permission:
sudo chmod 775 /usr/local/bin

# check that the file exists or does not exist and permissions.
sudo ls -l /usr/local/bin/reveal >&2
