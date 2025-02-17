for i in `docker inspect --format='{{.Name}}' $(docker ps -q) | cut -f2 -d\/`
        do container_name=$i
        echo -n "$container_name - "
        container_data=`docker inspect $container_name`
        mkdir -p $backup_path/$container_name
        echo $container_data > $backup_path/$container_name/$container_name-data.txt
        echo "OK"
done
