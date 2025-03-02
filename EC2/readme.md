^^^ FOR AWS EC2 MACHINE


export ANTHROPIC_API_KEY=sk-ant-api

docker run \
    -e ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY \
    -v $HOME/.anthropic:/home/computeruse/.anthropic \
    -p 5900:5900 \
    -p 8501:8501 \
    -p 6080:6080 \
    -p 8080:8080 \
    -it ghcr.io/anthropics/anthropic-quickstarts:computer-use-demo-latest


sudo docker exec -it 3baae1e135f8 /bin/sh

find /home/computeruse -type f -not -path "/home/computeruse/.pyenv/*" -not -path "/home/computeruse/.vscode-server/*" -exec sed -i 's/127.0.0.1/EC2_Public_IP/g' {} +

find /home/computeruse -type f -not -path "/home/computeruse/.pyenv/*" -not -path "/home/computeruse/.vscode-server/*" -exec sed -i 's/localhost/EC2_Public_IP/g' {} +

![image](https://github.com/user-attachments/assets/3d222754-8dbc-4ff6-9eaa-683b60d56555)
