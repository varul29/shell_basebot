#!/bin/sh

cd /home/brijesh/Projects/Neosoft/mahindra_basebot

if ! pgrep -f '/home/patricia/Projects/Neosoft/mahindra_basebot/manage.py'

then
    # cd <main path> 
    /home/patricia/Projects/Neosoft/mahindra_basebot/mchatenv/bin/python /home/brijesh/Projects/Neosoft/mahindra_basebot/manage.py runserver 0.0.0.0:8000 >/dev/null 2>>/home/brijesh/Projects/Neosoft/mahindra_basebot/shell_logs/manage.log & 
    /home/patricia/Projects/Neosoft/mahindra_basebot/mchatenv/bin/python /home/brijesh/Projects/Neosoft/mahindra_basebot/nlgaction/nlg_server.py >/dev/null 2>>/home/brijesh/Projects/Neosoft/mahindra_basebot/shell_logs/nlg_server.log & 
    /home/patricia/Projects/Neosoft/mahindra_basebot/mchatenv/bin/python /home/brijesh/Projects/Neosoft/mahindra_basebot/nlgaction/actions_server.py >/dev/null 2>>/home/brijesh/Projects/Neosoft/mahindra_basebot/shell_logs/actions_server.log & 
    # /root/folder/env_name/bin/python '<python file with full path>' >/dev/null 2>>/filepath/output.log &
    # /snap/bin/ngrok http 80 -log=stdout > ngrok.log &
    # /home/brijesh/Projects/Neosoft/mahindra_basebot/mchatenv/bin/celery worker -A /home/brijesh/Projects/Neosoft/mahindra_basebot/basebot --loglevel=info --detach
    /home/patricia/Projects/Neosoft/mahindra_basebot/mchatenv/bin/celery -A basebot worker -l INFO --detach
else 
   echo "running"
fi
