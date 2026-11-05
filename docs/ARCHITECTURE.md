# Kiến trúc dự kiến

## Các lớp

- `match`: trạng thái và mô phỏng trận đấu, bóng, cầu thủ, luật, AI, thay người và thống kê.
- `career`: dữ liệu cầu thủ, lịch, tiến trình, phong độ, thể lực, chấn thương và hoạt động ngoài sân. Không phụ thuộc scene, camera hoặc input trực tiếp.
- `presentation`: camera, sprite, animation, UI và âm thanh. Đọc trạng thái/sự kiện; không quyết định luật.
- `input`: chuyển thao tác người dùng thành lệnh hợp lệ cho trận đấu hoặc sự nghiệp.
- `persistence`: lưu/tải và phiên bản dữ liệu.

Tên thư mục và cách hiện thực sẽ chốt khi chọn engine.

## Luồng dữ liệu

Sự nghiệp tạo cấu hình đầu trận → trận đấu chạy độc lập → trả kết quả, thống kê và sự kiện → sự nghiệp cập nhật.

Lớp hiển thị nhận dữ liệu từ trận đấu và sự nghiệp. Việc ẩn một cầu thủ trên màn hình không được coi là thay người hợp lệ.

## Quy ước cần giữ

- Va chạm và điểm số tính trong tọa độ thế giới, không dùng vị trí ảnh sprite.
- Camera chỉ chuyển tọa độ thế giới thành tọa độ màn hình.
- Tách vai trò chiến thuật, vị trí xoay vòng và vị trí thực tế trên sân.
- Mỗi cầu thủ có ID ổn định, không dùng tên hoặc số áo làm khóa duy nhất.
- Đồng hồ mô phỏng độc lập tốc độ vẽ để hỗ trợ tua nhanh và mô phỏng tự động.
- Kết quả ngẫu nhiên phải hỗ trợ seed để tái hiện lỗi.
- Dữ liệu lưu có số phiên bản ngay từ lần lưu đầu tiên.

## Hiển thị sân

Sân có màu dễ nhìn ngay từ bản đầu. Lưới, vạch và bóng phải đọc được rõ trước khi thêm khán giả hay trang trí. Chưa cần mô phỏng ánh sáng phức tạp.

Điểm rơi là dự báo từ trạng thái bóng hiện tại, cần tính lại khi có chạm bóng hoặc va chạm. Bóng đổ chỉ thể hiện vị trí chiếu xuống sàn.
