#!/bin/bash

# Bước 1: Tạo thư mục ~/.titanedge1 nếu chưa tồn tại
mkdir -p ~/.titanedge1

# Bước 2: Chạy container 1 với tùy chọn --name để đặt tên là titan1 và mount thư mục ~/.titanedge1 vào /root/.titanedge
docker run -dit --name titan1 -v ~/.titanedge1:/root/.titanedge nezha123/titan-edge

# Bước 3: Tạo thư mục ~/.titanedge2 nếu chưa tồn tại
mkdir -p ~/.titanedge2

# Bước 4: Chạy container 2 với tùy chọn --name để đặt tên là titan2 và mount thư mục ~/.titanedge2 vào /root/.titanedge
docker run -dit --name titan2 -v ~/.titanedge2:/root/.titanedge nezha123/titan-edge

# Bước 5: Tạo thư mục ~/.titanedge3 nếu chưa tồn tại
mkdir -p ~/.titanedge3

# Bước 6: Chạy container 3 với tùy chọn --name để đặt tên là titan3 và mount thư mục ~/.titanedge3 vào /root/.titanedge
docker run -dit --name titan3 -v ~/.titanedge3:/root/.titanedge nezha123/titan-edge

# Bước 7: Tạo thư mục ~/.titanedge4 nếu chưa tồn tại
mkdir -p ~/.titanedge4

# Bước 8: Chạy container 4 với tùy chọn --name để đặt tên là titan4 và mount thư mục ~/.titanedge4 vào /root/.titanedge
docker run -dit --name titan4 -v ~/.titanedge4:/root/.titanedge nezha123/titan-edge

# Bước 9: Tạo thư mục ~/.titanedge0 nếu chưa tồn tại
mkdir -p ~/.titanedge0

# Bước 10: Chạy container 0 với tùy chọn --name để đặt tên là titan0 và mount thư mục ~/.titanedge0 vào /root/.titanedge
docker run -dit --name titan0 -v ~/.titanedge0:/root/.titanedge nezha123/titan-edge
sleep 10
# Thực hiện hành động cho container 0
docker exec -it titan0 /bin/bash -c 'titan-edge bind --hash=6E0A51D9-CE34-4D21-9445-C6D1D24B8523 https://api-test1.container1.titannet.io/api/v2/device/binding'

# Thực hiện hành động cho container 1
docker exec -it titan1 /bin/bash -c 'titan-edge bind --hash=6E0A51D9-CE34-4D21-9445-C6D1D24B8523 https://api-test1.container1.titannet.io/api/v2/device/binding'

# Thực hiện hành động cho container 2
docker exec -it titan2 /bin/bash -c 'titan-edge bind --hash=6E0A51D9-CE34-4D21-9445-C6D1D24B8523 https://api-test1.container1.titannet.io/api/v2/device/binding'

# Thực hiện hành động cho container 3
docker exec -it titan3 /bin/bash -c 'titan-edge bind --hash=6E0A51D9-CE34-4D21-9445-C6D1D24B8523 https://api-test1.container1.titannet.io/api/v2/device/binding'

# Thực hiện hành động cho container 4
docker exec -it titan4 /bin/bash -c 'titan-edge bind --hash=6E0A51D9-CE34-4D21-9445-C6D1D24B8523 https://api-test1.container1.titannet.io/api/v2/device/binding'
