#!/bin/bash
echo "$PROTOCOL://$USERNAME:$TOKEN@$HOST" > /home/rstudio/git.store
chown rstudio /home/rstudio/git.store
chmod o-r,g-r /home/rstudio/git.store
runuser -l rstudio -c 'git config --global credential.helper "store --file ~/git.store"'
if [ -z "$FORK" ]
then
    echo "Pas de clonage de dépôt"
elif [ "$FORK" = "TRUE" ]
then
    runuser -l rstudio -c "git clone https://github.com/$USERNAME/utilitr.git && \
    cd utilitr && \
    git remote add upstream https://github.com/inseefrlab/utilitr.git && \
    git fetch upstream"
else
    runuser -l rstudio -c "git clone https://github.com/inseefrlab/utilitr.git"
fi
if [ ! -z "$FORK" ]
then
    # Open the project
    echo \
    "
    setHook('rstudio.sessionInit', function(newSession) {
        if (newSession && identical(getwd(), path.expand('~')))
        {
            message('Ouverture du tutoriel')
            rstudioapi::openProject('~/utilitr')
            }
            }, action = 'append')
            " >> /home/rstudio/.Rprofile
fi
