# Spike Ball

Game bóng chuyền 2D pixel, chế độ sự nghiệp một cầu thủ. Dự án phát triển bởi nhóm hai người.

## Trạng thái

Mốc chơi thử hiện tại là [set tập 7 điểm](prototypes/browser/spike-ball-set-7.html). Sau khi clone, mở file HTML này bằng Chrome hoặc Edge trên PC rồi bấm **Bắt đầu set**. Các sprite đã được nhúng trong file.

- WASD di chuyển, Space nhảy, chuột trái nhắm và đập, chuột phải đỡ. Người chơi điều khiển Thảo xuyên suốt set.
- Set kết thúc từ 7 điểm với cách biệt 2. Giao bóng tự động. Đội vừa giành quyền phát xoay vòng. Libero thay phụ công tại vị trí 5 và 6 trong thể thức tập này.
- Các bản thử trước nằm cạnh bản set gồm tập đập, pha bóng hai chiều có tình huống libero bơi cá, và mẫu tạo hình nhân vật.
- Việc tiếp theo đề xuất: thêm trạng thái quan sát khi Thảo ra sân và trả quyền điều khiển khi Thảo trở lại. Engine và phiên bản vẫn cần chốt.

## Định hướng

- Một sân, hai đội, 6 cầu thủ mỗi bên. Người chơi điều khiển một người; các cầu thủ còn lại là AI.
- Camera cao từ sau đội người chơi: đội bạn ở dưới, đối thủ ở trên, lưới ngang.
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

Engine đang cân nhắc: Godot 4. Phiên bản cụ thể và nền tảng phát hành chưa chốt. Khi chốt engine, mã nguồn game đặt trong `game/`; hướng dẫn chạy và xuất bản sẽ bổ sung cùng bản chạy đầu tiên.

## Phạm vi phát hành

Public repository phục vụ chia sẻ mã nguồn và clone. Bản game tải về hoặc bản chơi trên web là sản phẩm riêng, chỉ phát hành khi đã có cấu hình xuất bản và kiểm thử phù hợp.

Chưa chọn giấy phép mã nguồn hoặc asset. Việc công khai repository không thay thế quyết định cấp phép của chủ dự án.
