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
# Bước 1: Tạo thư mục ~/.titanedge1 nếu chưa tồn tại

mkdir -p ~/.titanedge1

# Bước 2: Chạy container 1 và cấu hình tự động khởi động lại
docker run -dit --name titan1 --restart always -v ~/.titanedge1:/root/.titanedge nezha123/titan-edge

# Bước 3: Tạo thư mục ~/.titanedge2 nếu chưa tồn tại
mkdir -p ~/.titanedge2

# Bước 4: Chạy container 2 và cấu hình tự động khởi động lại
docker run -dit --name titan2 --restart always -v ~/.titanedge2:/root/.titanedge nezha123/titan-edge

# Bước 5: Tạo thư mục ~/.titanedge3 nếu chưa tồn tại
mkdir -p ~/.titanedge3

# Bước 6: Chạy container 3 và cấu hình tự động khởi động lại
docker run -dit --name titan3 --restart always -v ~/.titanedge3:/root/.titanedge nezha123/titan-edge

# Bước 7: Tạo thư mục ~/.titanedge4 nếu chưa tồn tại
mkdir -p ~/.titanedge4

# Bước 8: Chạy container 4 và cấu hình tự động khởi động lại
docker run -dit --name titan4 --restart always -v ~/.titanedge4:/root/.titanedge nezha123/titan-edge

# Bước 9: Tạo thư mục ~/.titanedge0 nếu chưa tồn tại
mkdir -p ~/.titanedge0

# Bước 10: Chạy container 0 và cấu hình tự động khởi động lại
docker run -dit --name titan0 --restart always -v ~/.titanedge0:/root/.titanedge nezha123/titan-edge

# Chờ một khoảng thời gian cho container khởi động
sleep 10

# Thực hiện hành động cho từng container
docker exec -it titan0 /bin/bash -c 'titan-edge bind --hash=4A760FEF-C664-4624-B5B9-406FA9AEA1F6 https://api-test1.container1.titannet.io/api/v2/device/binding'
docker exec -it titan1 /bin/bash -c 'titan-edge bind --hash=4A760FEF-C664-4624-B5B9-406FA9AEA1F6 https://api-test1.container1.titannet.io/api/v2/device/binding'
docker exec -it titan2 /bin/bash -c 'titan-edge bind --hash=4A760FEF-C664-4624-B5B9-406FA9AEA1F6 https://api-test1.container1.titannet.io/api/v2/device/binding'
docker exec -it titan3 /bin/bash -c 'titan-edge bind --hash=4A760FEF-C664-4624-B5B9-406FA9AEA1F6 https://api-test1.container1.titannet.io/api/v2/device/binding'
docker exec -it titan4 /bin/bash -c 'titan-edge bind --hash=4A760FEF-C664-4624-B5B9-406FA9AEA1F6 https://api-test1.container1.titannet.io/api/v2/device/binding'
