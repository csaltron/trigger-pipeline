#!/bin/bash
REPOS=("repo1" "repo2" "repo3" ...) 
DATE=$(date +%Y%m%d%H%M%S)

echo "Inicio de trigger pipeline"

for REPO in "${REPOS[@]}"; do
  echo "Creando pipeline para repo $REPO"
  cd $REPO
  git checkout master && git pull
  BRANCH="auto-trigger-devSecOps-$DATE"
  git checkout -b $BRANCH
  
  # Modificar archivo de versión
  echo "# Auto-trigger $DATE" >> .pipeline-trigger
  
  git add .pipeline-trigger
  git commit -m "chore: trigger weekly pipeline [skip ci]"
  git push origin $BRANCH

  echo "Pipeline Ok"

done
echo "Fin de trigger pipeline"
