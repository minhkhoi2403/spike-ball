# Bàn giao mobile — 07/11/2026

## Chạy thử

Mở prototypes/browser/spike-ball-mobile.html trên PC hoặc truy cập https://spike-ball-mobile-0711.equalsorbet4.chatgpt.site bằng Safari trên iPhone, xoay ngang và bấm Bắt đầu. Site hiện riêng tư; cộng sự cần quyền truy cập hoặc tự phục vụ file HTML. Sprite đã được nhúng trong file.

Bản PC dùng bộ phím mới nằm tại prototypes/browser/spike-ball-keyboard.html. Bản thử AI và các tình huống bước một nằm tại prototypes/browser/spike-ball-role-ai.html.

Nếu máy tính đã có Python, chạy từ gốc repository:

```sh
python -m http.server 8000 --bind 0.0.0.0 --directory prototypes/browser
```

Trên iPhone cùng Wi-Fi, mở http://<IPv4-của-máy-tính>:8000/spike-ball-mobile.html . Hai thiết bị cần liên lạc được qua mạng nội bộ. Nếu Firewall hỏi, chỉ cho phép mạng riêng đang dùng. Dừng máy chủ bằng Ctrl+C sau khi thử.

## Điều khiển

Joystick trái để chạy và chọn hướng. Khi trên không, cầu thủ giữ quán tính chạy đà, joystick chọn hướng đánh. Bấm Nhảy, giữ Đánh để tăng lực tới 100%, thả để vung. Đỡ xử lý bóng đầu hoặc chuyền thay. Nút Dừng tạm dừng; trang cũng tự tạm dừng khi bị ẩn.

## Đã kiểm tra

Bố cục giả lập 844x390 và 667x375. Đã kiểm tra joystick và giữ Đánh đồng thời, nhả nút Đánh, hủy cảm ứng, tạm dừng/tiếp tục và thông báo xoay ngang. Kiểm tra bằng Chromium mô phỏng cảm ứng. Safari/iPhone thật cần người dùng đánh giá tiếp.

Bản AI đã qua mô phỏng 10 phút. Bản bàn phím đã kiểm tra tổ hợp hướng, D/ZD/CD và giữ lực ở 100%.

## Tiếp tục

- Trận đấu/AI còn ở mức prototype, thông số cần cân bằng bằng chơi thử.
- Mobile hiện tập trung ba nút cơ bản. Đập dài/cắm và bỏ nhỏ có ở bản bàn phím.
- Ưu tiên đánh giá nhịp đổi ngón từ Nhảy sang Đánh trên máy thật, sau đó cải thiện AI và trận đấu.
- Engine, sự nghiệp, thay người chơi ra dự bị và lưu/tải vẫn còn phía trước.
- Khi sửa cảm ứng, kiểm tra nhiều ngón, pointercancel, xoay màn hình và chuyển ứng dụng.
- Dùng danh tính Git của thành viên; không thêm chữ ký, credit công cụ hoặc dòng đồng tác giả ngoài người được chủ dự án cho phép.
