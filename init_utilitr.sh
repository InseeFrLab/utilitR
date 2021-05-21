echo "$PROTOCOL://$USERNAME:$TOKEN@$HOST" > /home/rstudio/git.store
chown rstudio /home/rstudio/git.store
chmod o-r,g-r /home/rstudio/git.store
runuser -l rstudio -c 'git config --global credential.helper "store --file ~/git.store"'
