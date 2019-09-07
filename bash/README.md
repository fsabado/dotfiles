# Bash README



# Redirection Outputs


`cmd >>file.txt 2>&1`

Bash executes the redirects from left to right as follows:

1. `>>file.txt`: Open file.txt in append mode and redirect stdout there.
1. 2>&1: Redirect stderr to "where stdout is currently going". In this case, that is a file opened in append mode. In other words, the &1 reuses the file descriptor which stdout currently uses.

Reference: https://stackoverflow.com/questions/876239/how-can-i-redirect-and-append-both-stdout-and-stderr-to-a-file-with-bash



