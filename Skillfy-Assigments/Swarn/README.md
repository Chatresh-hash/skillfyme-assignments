# Docker Swarm Deployment
docker swarm init
docker stack deploy -c docker-stack.yml skillfybank

docker stack services skillfybank
docker service ls

docker node ls
docker service ps skillfybank_transaction-service

Overlay network ensures inter‑service communication.

Transaction Service uses rolling updates (start-first strategy).

Notification Service has a restart policy with retries.

Document screenshots/logs of node failure simulation and service recovery.


chmod +x swarm-init.sh
./swarm-init.sh
docker-machine ssh manager1 "docker node ls"


This script automates cluster creation with Docker Machine + VirtualBox.

manager1 initializes the Swarm, then other managers and workers join automatically.

Use docker node ls to confirm HA setup.

You can now deploy your docker-stack.yml directly from manager1.


