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
    runuser -l onyxia -c "cd $WORKSPACE_DIR && \
    git clone https://github.com/$USERNAME/utilitr.git && \
    cd utilitr && \
    git remote add upstream https://github.com/inseefrlab/utilitr.git && \
    git fetch upstream"
else
    cd /home/onyxia/work
    runuser -l onyxia -c "cd $WORKSPACE_DIR && git clone https://github.com/inseefrlab/utilitr.git"
fi
if [ ! -z "$FORK" ]
then
    # Open the project
    echo \
    "
    setHook('rstudio.sessionInit', function(newSession) {
        if (newSession && identical(getwd(), path.expand(\"/home/onyxia/work\")))
        {
            message('Ouverture du tutoriel')
            rstudioapi::openProject(\"$WORKSPACE_DIR/utilitr\")
            }
            }, action = 'append')
            " >> /home/onyxia/.Rprofile
fi
