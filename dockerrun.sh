              # mount      host_dir  :container_dir    image:tag   args
docker run -v /root/app/filserver_data:/app/data  fileserver:V1.0  -a :8080 -r /app/data
