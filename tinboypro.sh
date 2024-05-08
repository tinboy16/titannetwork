#!/bin/bash
# Kiểm tra xem Docker đã được cài đặt hay chưa
if ! command -v docker &> /dev/null; then
    # Nếu không, cài đặt Docker
    echo "Docker is not installed. Installing Docker..."

    # Sử dụng lệnh cài đặt Docker cho hệ điều hành cụ thể, ví dụ:
    # Ubuntu/Debian
    sudo apt-get update
    sudo apt-get install -y docker.io

    # CentOS/RHEL
    # sudo yum install -y docker

    # Fedora
    # sudo dnf install -y docker

    # Khởi động dịch vụ Docker
    sudo systemctl start docker

    # Tự động khởi động Docker khi khởi động hệ thống
    sudo systemctl enable docker

    echo "Docker installed successfully."
fi

# Hỏi người dùng nhập thông tin proxy
echo "Enter the proxy information:"
read -p "Proxy IP: " proxy_ip
read -p "Proxy port: " proxy_port
read -p "Proxy username (leave empty if none): " proxy_user
read -s -p "Proxy password (leave empty if none): " proxy_pass
echo ""

# Tạo URL proxy từ thông tin được nhập
proxy_url="http://$proxy_ip:$proxy_port"
if [ -n "$proxy_user" ]; then
    proxy_url="$proxy_user:$proxy_pass@$proxy_url"
fi

# Thiết lập biến môi trường cho proxy
export HTTP_PROXY="$proxy_url"
export HTTPS_PROXY="$proxy_url"

# Hỏi người dùng nhập số bắt đầu của container
read -p "Enter the starting number of containers: " start_num

# Hỏi người dùng nhập hash
echo "Enter the hash:"
read hash

# Tạo thư mục cho từng container, bắt đầu từ số bắt đầu được nhập
for ((i=start_num; i<start_num+5; i++)); do
    mkdir -p ~/.titanedge$i
    docker run -dit --name titan$i --restart always -v ~/.titanedge$i:/root/.titanedge nezha123/titan-edge
done

# Chờ một khoảng thời gian cho container khởi động
sleep 10

# Thực hiện hành động cho từng container
for ((i=start_num; i<start_num+5; i++)); do
    docker exec -it titan$i /bin/bash -c "titan-edge bind --hash=$hash https://api-test1.container1.titannet.io/api/v2/device/binding"
done
