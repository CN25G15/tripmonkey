#!/bin/bash

echo "  ______ ______ ______ ______ ______ ______ ______ ______ ______ ______ 
 |______|______|______|______|______|______|______|______|______|______|
       |__   __| (_)                           | |                      
          | |_ __ _ _ __  _ __ ___   ___  _ __ | | _____ _   _          
          | | '__| | '_ \| '_ \` _ \ / _ \| '_ \| |/ / _ | | | |
          | | |  | | |_) | | | | | | (_) | | | |   |  __| |_| |         
          |_|_|  |_| .__/|_| |_| |_|\___/|_| |_|_|\_\___|\__, |         
                   | |                                    __/ |         
  ______ ______ ___|_| ______ ______ ______ ______ ______|___/__ ______ 
 |______|______|______|______|______|______|______|______|______|______|
                                                                        "

echo "\n-------------------------------------\nBuilding images for local docker repo\n-------------------------------------\n"

previous=$(pwd)
cd supporting-modules
echo "\ninstalling support modules for java microservices"
bash mvnw clean install
cd ..

# Loop over each subdirectory in the current directory
for dir in */; do
  # Check if a Dockerfile exists in the current directory
  if [ -f "${dir}Dockerfile" ]; then
    # If it does, use docker build to build the image
    echo "\nfound Dockerfile @ ${dir}"
	docker build -t "tripmonkey/${dir}" "${dir}"
	
  else
    # If there's no Dockerfile, look for a script with the name "build-image.sh"
    if [ -x "${dir}build-image.sh" ]; then
      # If it exists and is executable, run the script
	  echo "\nfound build-image.sh @ ${dir}"
	  bash "${dir}build-image.sh"
    else
      # If neither a Dockerfile nor "build-image.sh" exist in this directory, skip it
      echo "\nNo Dockerfile or build-image.sh found @ ${dir}"
    fi
  fi
done