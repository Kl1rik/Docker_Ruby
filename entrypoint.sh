#!/bin/sh
cd ror_app/
EXT_IP=$(hostname -I | awk '{print $1}')
rails db:migrate
rails server -b $EXT_IP -p 5000