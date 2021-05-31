Step to build docker image:

1. docker build ./ --tag ioki
2. docker network create -d bridge ioki-network
3. docker run -d --name=ioki -p 99:99 --network ioki-network --volume "code":"/data/behat" ioki


#####to create local files with connecting to docker
1. mkdir recruitmentTask_docker_local
2. docker volume create --driver local --name code --opt type=none --opt o=bind --opt device=$PWD/recruitmentTask_docker_local


############# to run tests
4. docker run -d --name=selenium -p 34444:24444 -p 35900:25900 --privileged -e TZ="Europe/Warsaw" -e GRID=true -e CHROME=true -e FIREFOX=false -e SCREEN_WIDTH=1300 -e SCREEN_HEIGHT=999 -e MAX_INSTANCES=10 -e MAX_SESSIONS=10 --network ioki-network --dns 8.8.8.8 elgalu/selenium:3.141.59-p34

5. docker exec -it ioki sh
6. php -d memory_limit=-1 bin/behat -c config/behat.yml --profile=default --format=progress --format=pretty --strict src/FunctionalTests/Features/pearsonMainPage.feature