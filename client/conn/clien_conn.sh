#!/bin/bash

while IFS=':' read -a message ; do
    # for i in "${message[@]}";do
    #     echo "$i"
    # done
    case "${message[0]}" in
        "serv-clie")
            case "${message[1]}" in
                "url")
                echo "[LOG] Quick tunnel URL: ${message[2]}"
                ;;
            esac
        
    esac

done < buffers/reciever_pipe