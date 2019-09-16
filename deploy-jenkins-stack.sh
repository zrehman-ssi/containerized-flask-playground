DATE=$(date -I)

docker build . --no-cache -t zeburrehman/jenkins:$DATE
docker tag zeburrehman/jenkins:$DATE zeburrehman/jenkins:lts
docker tag zeburrehman/jenkins:$DATE zeburrehman/jenkins:latest

docker push zeburrehman/jenkins:$DATE
docker push zeburrehman/jenkins:lts
docker push zeburrehman/jenkins:latest

docker stack rm jenkins
sleep 15

docker stack deploy -c docker-compose.yml jenkins