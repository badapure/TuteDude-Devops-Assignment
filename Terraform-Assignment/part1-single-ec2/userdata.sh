#!/bin/bash
apt update && apt install -y python3-pip nodejs npm
pip3 install flask
node -v || curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt install -y nodejs

# Flask
mkdir -p /home/ubuntu/app/backend
echo "$(cat <<EOF
$(cat app/backend/app.py)
EOF
)" > /home/ubuntu/app/backend/app.py
nohup python3 /home/ubuntu/app/backend/app.py &

# Express
mkdir -p /home/ubuntu/app/frontend
echo "$(cat <<EOF
$(cat app/frontend/index.js)
EOF
)" > /home/ubuntu/app/frontend/index.js
cd /home/ubuntu/app/frontend && npm init -y && npm install express
nohup node index.js &
