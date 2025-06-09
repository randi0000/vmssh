#!/bin/bash

# Start the application in the background (adjust this command to your needs)
npm start &

# Start the SSH tunnel to serveo.net
./start-tunnel.sh
