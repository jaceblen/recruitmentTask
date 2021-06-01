## Steps to build and run docker image:

1. `docker build ./ -t recruitment-task:latest`
2. `docker network create -d bridge recruitment-task-network`
3. `docker run -d --name=recruitment-task --network recruitment-task-network --volume "code":"/data/behat" recruitment-task:latest`

## Running tests:
### Setting up Local selenium Grid
`docker run -d --name=selenium -p 34444:24444 -p 35900:25900 --privileged -e TZ="Europe/Warsaw" -e GRID=true -e CHROME=true -e FIREFOX=false -e SCREEN_WIDTH=1300 -e SCREEN_HEIGHT=999 -e MAX_INSTANCES=10 -e MAX_SESSIONS=10 --network recruitment-task-network --dns 8.8.8.8 elgalu/selenium:3.141.59-p34`
### Connecting to container and running specific test:
1. `docker exec -it recruitment-task sh`
2. `php -d memory_limit=-1 bin/behat -c config/behat.yml --profile=default --format=progress --format=pretty --strict src/FunctionalTests/Features/pearsonMainPage.feature`

## Setting up local file system connected to container
1. `mkdir recruitmentTask_docker_local`
2. `docker volume create --driver local --name code --opt type=none --opt o=bind --opt device=$PWD/recruitmentTask_docker_local`