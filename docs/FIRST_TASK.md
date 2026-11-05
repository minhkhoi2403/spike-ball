# Công việc đầu tiên

## Mục tiêu

Hai người clone cùng repository, mở cùng project và xem được sân màu từ camera phía sau đội người chơi.

## Trước khi viết gameplay

- Chốt engine và phiên bản cụ thể. Godot 4 đang là phương án dự kiến, chưa khóa phiên bản.
- Chốt nền tảng thử nghiệm đầu tiên và thiết bị điều khiển.
- Thêm thành viên thứ hai vào repository bằng tài khoản GitHub của người đó.
- Thống nhất x là chiều ngang sân, y là chiều dọc, z là độ cao; quy định gốc tọa độ và đơn vị.
- Xác định vai trò A/B dựa trên kỹ năng của hai người.

## Việc A làm

1. Tạo project tối thiểu trong `game/` sau khi chốt engine.
2. Tạo cấu trúc dữ liệu sân và 12 cầu thủ, không gắn tọa độ thế giới với pixel màn hình.
3. Cung cấp dữ liệu một quả bóng có độ cao và một tình huống bay thử.
4. Viết kiểm tra cơ bản cho tọa độ và dữ liệu đội hình.

## Việc B làm

1. Thống nhất hàm chiếu với A trước khi dựng cảnh.
2. Dựng sân màu: mặt sân tông gỗ/cam nhạt, vùng ngoài xanh dịu, vạch sáng.
3. Tạo 12 hình đại diện đơn giản có số áo; chưa cần sprite chi tiết.
4. Vẽ lưới ngang, bóng đổ, vòng chọn và điểm rơi có ký hiệu phân biệt.
5. Kiểm tra che khuất và độ dễ nhìn ở kích thước cửa sổ mục tiêu.

## Kiểm tra chung

- Cả hai máy mở được project từ một bản clone sạch.
- Đội người chơi dưới, đối thủ trên; đủ 6 người mỗi bên.
- Sprite không thay đổi kích thước theo khoảng cách.
- Bóng bay cao thì ảnh bóng đi lên; bóng đổ vẫn nằm tại vị trí chiếu xuống sàn.
- Vòng điểm rơi không bị hiểu nhầm là bóng đổ.
- Thay đổi góc camera không làm thay đổi tọa độ thế giới.
- Mỗi người hoàn thành một pull request nhỏ và review phần của người còn lại.

Sau khi đạt các điều kiện trên mới chuyển sang điều khiển cầu thủ và va chạm bóng.
