#!/bin/bash

# Port your app is running on (adjust this if your app runs on a different port)
APP_PORT=3000

# The Serveo SSH command to create the tunnel
ssh -R 80:localhost:$APP_PORT serveo.net
