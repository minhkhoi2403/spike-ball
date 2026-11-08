# Spike Ball

Game bóng chuyền 2D pixel, chế độ sự nghiệp một cầu thủ. Dự án phát triển bởi nhóm hai người.

## Trạng thái

Bản thử Godot 4.7.2 ở `game/`: camera chéo, 12 cầu thủ, di chuyển/nhảy và bóng minh họa. Mở `game/project.godot`, nhấn F5. Đây chưa phải bản chuyển đầy đủ gameplay; xem `game/README.md`. Định hướng phát hành đã chuyển sang app mobile.

Bản mới nhất để thử trên iPhone là [Spike Ball Mobile](prototypes/browser/spike-ball-mobile.html), chơi ngang màn hình với joystick và ba nút Nhảy, Đánh, Đỡ. [Mở bản đã xuất bản](https://spike-ball-mobile-0711.equalsorbet4.chatgpt.site). Link hiện riêng tư, yêu cầu quyền truy cập của chủ dự án.

- Joystick để chạy và chọn hướng; Nhảy để bật; giữ/thả Đánh để lấy lực tới 100%; Đỡ để nhận bóng hoặc chuyền thay.
- Trên PC, mở [bản bàn phím](prototypes/browser/spike-ball-keyboard.html): mũi tên chạy/chọn hướng, Space nhảy, A đỡ/chuyền, S bỏ nhỏ, giữ/thả D đánh, Z+D đánh dài, C+D đập cắm.
- [Bản AI theo vai trò](prototypes/browser/spike-ball-role-ai.html) có tình huống bước một thường, lệch và cần người chuyền thay. Chuyền hai ưu tiên bóng hai, phân phối cho chủ công, đối chuyền và phụ công.
- Các bản cũ, bao gồm set tập 7 điểm, nằm trong cùng thư mục để so sánh.
- Ưu tiên tiếp theo: thử cảm ứng trên iPhone thật, điều chỉnh nhịp nhảy–đánh và tiếp tục cải thiện trận đấu/AI. Bản gameplay HTML được giữ để đối chiếu trong quá trình chuyển sang Godot.

Xem [bàn giao mobile](docs/MOBILE_HANDOFF.md) để biết cách chạy và phạm vi kiểm tra.

## Bộ thiết kế và bàn giao mới

- [Nhân vật và đồng phục 6 đội](art/README.md).
- [Bàn giao Godot và việc cần làm tiếp](docs/HANDOFF_GODOT_CAMERA.md).
- [Demo thử số áo](prototypes/browser/spike-ball-jerseys.html).

## Định hướng

- Một sân, hai đội, 6 cầu thủ mỗi bên. Người chơi điều khiển một người; các cầu thủ còn lại là AI.
- Camera cao góc chéo đã được duyệt; giữ góc thẳng để so sánh trong bản thử Godot.
- Tọa độ thế giới `(x, y, z)` và hàm chiếu riêng; sprite không nhỏ đi theo khoảng cách.
- Sân có màu dễ nhìn từ phiên bản đầu; không dùng sân hộp xám.
- Tự tạo cầu thủ, thay người, quan sát khi dự bị, phong độ, tập luyện, nghỉ ngơi và chấn thương.
- Asset tự tạo, sprite ghép lớp ba hướng và đổi bảng màu; âm thanh placeholder tự tạo.
- Tham chiếu cảm giác thể thao pixel của Hoop Land; không sao chép tên, nhân vật, sprite, giao diện hoặc âm thanh.

## Đọc theo thứ tự

1. [Roadmap](docs/ROADMAP.md): công việc, phụ thuộc, người phụ trách và tiêu chí hoàn thành.
2. [Công việc đầu tiên](docs/FIRST_TASK.md): bắt đầu từ đâu, kết quả cần có.
3. [Kiến trúc](docs/ARCHITECTURE.md): tách trận đấu, sự nghiệp và hiển thị.
4. [Quy trình cộng tác](CONTRIBUTING.md): nhánh, review và tích hợp.
5. [Các quyết định cần chốt](docs/DECISIONS.md).

## Làm việc với repository

Repository: https://github.com/minhkhoi2403/spike-ball

```sh
git clone https://github.com/minhkhoi2403/spike-ball.git
cd spike-ball
```

Hai thành viên clone cùng repository và làm trên các nhánh riêng. Quyền ghi của thành viên thứ hai cần được chủ repository cấp trước khi push.

Engine đã chọn: Godot 4; bản thử đầu tiên dùng Godot 4.7.2 stable và GDScript, hướng phát hành app mobile. Mã nguồn mới nằm trong `game/`. Chưa xuất bản build iOS/Android.

## Phạm vi phát hành

Public repository phục vụ chia sẻ mã nguồn và clone. Bản game tải về hoặc bản chơi trên web là sản phẩm riêng, chỉ phát hành khi đã có cấu hình xuất bản và kiểm thử phù hợp.

Chưa chọn giấy phép mã nguồn hoặc asset. Việc công khai repository không thay thế quyết định cấp phép của chủ dự án.
