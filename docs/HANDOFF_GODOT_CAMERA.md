# Bàn giao ngày 2026-11-08

## Mở bản mới

Cài Godot 4.7.2 stable bản thường, mở `game/project.godot`, nhấn F5. Không cần server web. Không có đường dẫn máy riêng trong mã nguồn.

- Mũi tên hoặc vòng điều khiển trái: di chuyển số 7.
- Space/nút Nhảy: bật nhảy. C: đổi góc chéo/thẳng. P: tạm dừng.
- Có 12 người, sân màu, lưới, bóng minh họa, bóng đổ và dự báo điểm rơi.

Kiểm tra đã chạy: `godot --headless --path game --script camera_checks.gd` — đủ người, hai phép chiếu, joystick, nhảy/tiếp đất, dừng và mô phỏng bóng 60 giây. Ảnh `game/camera-preview.png` được chụp từ viewport Godot thật.

## Phân biệt các bản

- `game/`: bản kiểm tra camera Godot, không có AI/luật trận đầy đủ. Bóng chạy chuỗi minh họa, không phản ứng với người chơi.
- `prototypes/browser/spike-ball-keyboard.html`: demo gameplay PC trước khi chuyển Godot, có AI vai trò và điều khiển đập/đỡ.
- `prototypes/browser/spike-ball-mobile.html`: demo cảm ứng trước khi chuyển Godot.
- `prototypes/browser/spike-ball-jerseys.html`: demo riêng số áo, tên rút gọn và áo libero. Thiết kế mới hơn đã bỏ tên trên áo, xem `art/`.
- `art/mens-rosters-v2/`: mẫu nhân vật nam hiện tại; chưa tích hợp toàn bộ 6 đội vào gameplay.

## Việc tiếp theo

1. Làm một cầu thủ mẫu có góc chéo trước/sau và hoạt ảnh đứng, chạy, nhảy, tiếp đất.
2. Thêm đập/đỡ/chuyền/chắn và sự kiện chạm bóng khớp animation.
3. Chuyển gameplay/AI từ JavaScript sang lớp trận đấu GDScript, độc lập phép chiếu camera.
4. Kiểm tra joystick, đa chạm, safe area và kích thước sprite trên máy thật.

Chưa build iOS/Android. Chưa có mùa giải, sự nghiệp hoặc animation tay chân đầy đủ trong Godot. Không coi nhún sprite/chuyển vị trí là hoạt ảnh chạy hoàn chỉnh.
