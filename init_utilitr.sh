#!/bin/bash
echo "$PROTOCOL://$USERNAME:$TOKEN@$HOST" > /home/onyxia/git.store
chown onyxia /home/onyxia/git.store
chmod o-r,g-r /home/onyxia/git.store
runuser -l onyxia -c 'git config --global credential.helper "store --file ~/git.store"'
if [ -z "$FORK" ]
then
    echo "Pas de clonage de dépôt"
elif [ "$FORK" = "TRUE" ]
then
    cd $WORK_DIR
    runuser -l onyxia -c "git clone https://github.com/$USERNAME/utilitr.git && \
    cd utilitr && \
    git remote add upstream https://github.com/inseefrlab/utilitr.git && \
    git fetch upstream"
else
    cd $WORK_DIR
    runuser -l onyxia -c "git clone https://github.com/inseefrlab/utilitr.git"
fi
if [ ! -z "$FORK" ]
then
    # Open the project
    echo \
    "
    setHook('rstudio.sessionInit', function(newSession) {
        if (newSession && identical(getwd(), path.expand(\"'$WORK_DIR'\")))
        {
            message('Ouverture du tutoriel')
            rstudioapi::openProject('//utilitr')
            }
            }, action = 'append')
            " >> /home/onyxia/.Rprofile
fi
