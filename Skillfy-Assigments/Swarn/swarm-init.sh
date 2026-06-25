#!/bin/bash
# Swarm cluster setup: 3 managers + 2 workers
# Requires: Docker Machine + VirtualBox installed

# Create manager nodes
for i in 1 2 3; do
  docker-machine create --driver virtualbox manager$i
done

# Create worker nodes
for i in 1 2; do
  docker-machine create --driver virtualbox worker$i
done

# Initialize Swarm on manager1
MANAGER1_IP=$(docker-machine ip manager1)
docker-machine ssh manager1 "docker swarm init --advertise-addr $MANAGER1_IP"

# Get join tokens
MANAGER_JOIN=$(docker-machine ssh manager1 "docker swarm join-token manager -q")
WORKER_JOIN=$(docker-machine ssh manager1 "docker swarm join-token worker -q")

# Join other managers
for i in 2 3; do
  docker-machine ssh manager$i "docker swarm join --token $MANAGER_JOIN $MANAGER1_IP:2377"
done

# Join workers
for i in 1 2; do
  docker-machine ssh worker$i "docker swarm join --token $WORKER_JOIN $MANAGER1_IP:2377"
done

echo "✅ Swarm cluster setup complete!"
echo "Managers: manager1, manager2, manager