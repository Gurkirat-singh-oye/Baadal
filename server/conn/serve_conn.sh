#!/bin/bash

echo "[LOG] Connected to the reciever buffer."
echo "[LOG] Waiting for a message to arrive.."
while IFS=':' read -a message ; do
    # for i in "${message[@]}";do
    #     echo "$i"
    # done
    case "${message[0]}" in
        "clie-serv")
            echo "spawn cdfl quick tunnel: ${message[1]}"
            tunnel_url=$(cloudflared tunnel --url http://localhost:3000 2>&1 | grep -m1 -o '[a-z0-9-]*\.trycloudflare\.com')
	    sleep 15
            echo "[LOG] tunnel url:$tunnel_url"
	    curl -d "serv-clie:url:$tunnel_url" ntfy.sh/tuhade_pind_da_raa
            ;;
        
    esac

done < conn/.buffers/reciever_pipe
