# Spike Ball — bản thử camera Godot

Godot **4.7.2 stable**, GDScript, Compatibility renderer. Mở `project.godot` và nhấn F6 hoặc F5. Dự án chạy cục bộ, không cần server web.

## Đã có

- Sân 18 × 9 đơn vị mét, cao lưới 2,43 m, sàn cam và vùng ngoài xanh ngọc.
- Góc chéo song song; nút đổi sang góc thẳng để đối chiếu cùng một trạng thái.
- 12 cầu thủ từ bộ ảnh đã duyệt; Khánh Hải nhìn lưng, Thanh Cảng nhìn trước, libero mới.
- Di chuyển số 7 bằng phím mũi tên hoặc kéo vòng điều khiển bên trái; Space/nút Nhảy để bật nhảy.
- Bóng minh họa lặp lại, bóng đổ và dự báo điểm rơi nếu không có lần chạm tiếp theo.
- Lưới chia đoạn và sắp lớp theo độ sâu camera; phím P tạm dừng, C đổi góc.
- Tách dữ liệu thế giới trong `match/` khỏi hàm chiếu và hiển thị trong `presentation/`.

## Giới hạn cần biết

Đây là mốc thử camera, chưa chuyển AI, va chạm bóng, đỡ/chuyền/đập, luật, điểm số, mùa giải hoặc sự nghiệp từ JavaScript. Bóng bay theo chuỗi minh họa, không phản ứng khi người dùng di chuyển. Các cầu thủ AI đứng tại vị trí mẫu.

Nhân vật dùng sprite mặt trước/mặt sau hiện có, chưa có sprite chéo và hoạt ảnh tay chân mới. Hình được trích từ bảng concept khi khởi động; cần thay bằng atlas trong suốt được chuẩn hóa cho sản phẩm thật. Khoảng trắng ngoài hình được xóa bằng flood-fill, không xóa phần giày trắng nằm trong viền.

Chưa build/test Android hoặc iOS. UI ngang có joystick và nút nhảy nhưng cần kiểm tra safe area, nhiều tỷ lệ màn hình và đa chạm trên thiết bị thật. Xuất iOS cần macOS/Xcode.

## Kiểm tra

`godot --headless --path . --script camera_checks.gd`

`godot --path . -- --capture` chạy một vài frame và ghi ảnh thật từ viewport vào `camera-preview.png`, rồi thoát.

Giữ bản demo HTML để đối chiếu khi chuyển gameplay. Không thay mã gameplay đang được phát triển ở nhánh khác bằng bản camera này.
