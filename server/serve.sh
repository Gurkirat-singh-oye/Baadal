#!/bin/bash

bash conn/serve_conn.sh > .logs/connection.log &

nohup curl --silent --no-buffer "ntfy.sh/tuhade_pind_da_raa/raw" > conn/.buffers/reciever_pipe &
echo "[LOG] Listening for client requests."

tail -f .logs/connection.log
echo "[LOG] Tailing logs.."
