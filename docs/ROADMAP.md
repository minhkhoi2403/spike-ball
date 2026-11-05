# Roadmap Spike Ball

## Nguyên tắc

Không giới hạn trong 4 tuần. Chuyển mốc khi đạt tiêu chí hoàn thành, không dựa vào số ngày đã làm.

Trình tự chính: chuẩn bị → sân và camera → điều khiển và bóng → một pha bóng → trận đấu 6 đấu 6 → vị trí và thay người → sự nghiệp → hoàn thiện art và âm thanh → kiểm thử và phát hành.

Asset placeholder bắt đầu sớm. Art chi tiết chỉ hoàn thiện khi camera và gameplay ổn định.

## Chia việc hai người

Đây là phân công đề xuất, có thể đổi theo thế mạnh thực tế.

| Người | Phụ trách chính | Phụ trách bổ sung |
| --- | --- | --- |
| A | Bóng, điều khiển, luật, luồng trận đấu, thay người | Tích hợp gameplay và kiểm thử luật |
| B | Sân, camera, sprite, giao diện, sự nghiệp | AI theo vai trò sau khi thống nhất giao diện dữ liệu |
| Cả hai | Chốt phạm vi, cấu trúc dữ liệu, chơi thử, review | Chọn engine, phiên bản luật, giấy phép và phát hành |

Mỗi công việc có một người chịu trách nhiệm chính. Người còn lại review. Không cùng sửa một scene hoặc tài nguyên lớn trong cùng lúc nếu chưa chia ranh giới rõ.

## Mốc 0 — Chuẩn bị nền tảng

### Làm theo thứ tự

1. Tạo repository chung, mời thành viên thứ hai và thử clone/push từ cả hai máy.
2. Chốt engine, phiên bản cụ thể, nền tảng thử nghiệm đầu tiên và cách điều khiển.
3. Chốt quy ước tọa độ, dữ liệu cầu thủ, đơn vị đo và sự kiện trận đấu.
4. Chọn phiên bản tài liệu luật chính thức; ghi nguồn và phần nào đã/chưa triển khai.
5. Tạo project tối thiểu chạy được trên cả hai máy.

### Phân công

- A: cấu trúc lớp trận đấu, dữ liệu đầu vào và cấu trúc kiểm thử.
- B: cấu trúc hiển thị, bảng màu sân và khung giao diện.
- Cả hai: cấu hình project và thử quy trình nhánh/review.

### Hoàn thành khi

Hai máy clone và mở được cùng project, dùng cùng phiên bản engine. Có một thay đổi nhỏ đi qua nhánh → review → main. Các quyết định còn mở được ghi rõ.

## Mốc 1 — Trận đấu

### 1.1 Sân và camera

- B dựng sân màu: sàn tông gỗ hoặc cam nhạt, vùng ngoài sân xanh dịu, vạch sáng rõ.
- Tách hàm `world_to_screen(x, y, z)` khỏi dữ liệu trận đấu.
- Đội người chơi ở dưới, lưới ngang; sprite giữ cùng kích thước.
- Thể hiện bóng đổ, vòng chọn người chơi, điểm rơi và cách xử lý che khuất.
- A tạo dữ liệu vị trí và một tình huống bóng bay thử để B kiểm tra phép chiếu.

Hoàn thành khi: nhìn rõ hai nửa sân và 12 người; đổi góc chiếu không thay đổi tọa độ thế giới; không nhầm bóng đổ với điểm rơi. Chưa cần AI hoặc art chi tiết.

### 1.2 Điều khiển và bóng

- A làm di chuyển, vùng chạm bóng, vận tốc, trọng lực và va chạm sân/lưới.
- B nối camera, sprite ba hướng tối thiểu và phản hồi khi chạm bóng.
- Tách điểm rơi dự báo khỏi vị trí bóng đổ hiện tại. Cập nhật dự báo sau mỗi lần chạm bóng.

Hoàn thành khi: điều khiển được một người và kiểm thử được bóng chạm sàn, qua lưới, chạm lưới, ra ngoài. Điều kiện va chạm không phụ thuộc vị trí sprite trên màn hình.

### 1.3 Một pha bóng có chủ đích

- A triển khai phát, đỡ, chuyền, đập; trạng thái bắt đầu/kết thúc pha bóng.
- B làm AI tối thiểu: nhận nhiệm vụ, di chuyển đến vị trí, chọn người xử lý bóng.
- Chỉ một người được phân công xử lý chính; những người khác giữ vị trí hoặc bọc lót.
- Tạo tình huống thử lặp lại được để sửa lỗi AI và bóng.

Hoàn thành khi: hai đội thực hiện được chuỗi chạm bóng có chủ đích và kết thúc pha bóng hợp lệ theo bộ luật đang triển khai.

### 1.4 Trận đấu 6 đấu 6

- A làm tính điểm rally, phát bóng, set/trận, xoay vòng, đổi sân và các lỗi trong phạm vi luật đã chốt.
- B làm AI đội hình, bảng điểm, thông báo trọng tài và màn hình kết quả.
- Đánh dấu từng điều luật đã kiểm thử; không gọi là đầy đủ FIVB khi còn thiếu.

Hoàn thành khi: chơi hết trận thử nghiệm, luôn đủ số người trên sân, điểm và quyền phát đúng với các ca kiểm thử, không cần sửa trạng thái bằng tay.

## Mốc 2 — Vị trí, tạo cầu thủ và thay người

Phụ thuộc: mốc 1 chạy ổn.

### Làm theo thứ tự

1. Mở một vị trí người chơi trước, kiểm tra nhiệm vụ và cách điều khiển.
2. Làm tạo cầu thủ: tên, số áo, vị trí và ngoại hình cơ bản; giới hạn chỉ số bằng dữ liệu.
3. Bổ sung lần lượt các vị trí còn lại và hành vi AI tương ứng.
4. Phân biệt vị trí xoay vòng với vai trò chiến thuật sau phát bóng.
5. Xây dựng thay người thường và thay thế libero thành hai luồng riêng, theo tài liệu luật đã chọn.
6. Làm chuyển trạng thái trên sân → dự bị → quan sát → trở lại sân.
7. Làm quyết định HLV từ phong độ, thể lực và chiến thuật; hiển thị lý do thay người.
8. Bổ sung tua nhanh khi dự bị nếu mô phỏng không mất tính đúng đắn.

### Phân công

- A: kiểm tra hợp lệ, cập nhật đội hình, quyết định thay người và quyền điều khiển.
- B: tạo cầu thủ, UI dự bị, AI theo vị trí và màn hình lý do thay người.

### Hoàn thành khi

Các vị trí có nhiệm vụ rõ. Thay người không làm mất hoặc nhân đôi cầu thủ. Người chơi dự bị chỉ quan sát. Libero và thay người thường vượt qua các tình huống kiểm thử riêng. Không dùng một lần mắc lỗi làm điều kiện cứng để thay ra.

## Mốc 3 — Sự nghiệp

Phụ thuộc: trận đấu có thống kê và sự kiện kết quả ổn định. Có thể thiết kế dữ liệu sớm, nhưng chỉ tích hợp sau mốc 2.

### Làm theo thứ tự

1. Hồ sơ cầu thủ, đội bóng, lịch và tiến trình thời gian.
2. Nhận kết quả trận đấu, cập nhật phong độ và đánh giá của HLV.
3. Tập luyện, nghỉ ngơi, thể lực và phát triển chỉ số.
4. Cạnh tranh suất đá chính, vai trò trong đội và thời lượng thi đấu.
5. Chấn thương, thời gian hồi phục, hạn chế tập/thi đấu và trở lại sân.
6. Lưu/tải có phiên bản dữ liệu; xử lý dữ liệu thiếu hoặc không tương thích.
7. Mô phỏng nhiều mùa không cần giao diện để tìm mất cân bằng.

### Phân công

- B: dữ liệu sự nghiệp, lịch, hoạt động, giao diện và lưu/tải.
- A: thống kê trận, bộ mô phỏng tự động, tích hợp thể lực/phong độ/chấn thương vào trận đấu.

### Hoàn thành khi

Một mùa chạy được cả có giao diện và không giao diện. Lưu/tải khôi phục đúng tiến trình. Không có chỉ số tăng vô hạn hoặc vòng lặp nghỉ/tập làm hỏng cân bằng. Các con số về chấn thương được ghi là tham số game, không giả định là mô hình y học đã xác thực.

## Mốc 4 — Art và âm thanh

Placeholder được dùng từ mốc 1; hoàn thiện sau khi camera và thao tác ổn định.

- B hoàn thiện sprite ghép lớp: sau, trước, ngang có thể lật; bảng màu, tóc, da, đồng phục.
- Thêm các động tác cần thiết: di chuyển, đỡ, chuyền, nhảy, đập, chắn và ngã.
- A nối animation với sự kiện gameplay; kết quả chạm bóng vẫn do hệ thống trận đấu quyết định.
- Tạo âm thanh phát/chạm bóng, còi, giao diện và âm lượng riêng.
- Kiểm tra khả năng nhìn bóng, đọc hướng chuyển động và nhận diện người chơi.
- Ghi nguồn và giấy phép của mọi tài nguyên ngoài nếu có.

Hoàn thành khi: hướng vẽ, animation và âm thanh khớp trạng thái; tài nguyên rõ nguồn gốc; giao diện dễ đọc ở độ phân giải mục tiêu.

## Mốc 5 — Hoàn thiện và phát hành

- Kiểm thử luật, đội hình, thay người, đổi sân, sự nghiệp, lưu/tải và thao tác nhập.
- Kiểm thử cả hai máy, đặt mục tiêu hiệu năng rồi đo thực tế.
- Chơi thử ngoài nhóm và ghi vấn đề theo mức ảnh hưởng.
- Sửa lỗi chặn tiến trình trước, sau đó mới cân bằng và cải thiện hình ảnh.
- Hoàn thiện hướng dẫn, tùy chọn âm thanh, phím và hỗ trợ khả năng tiếp cận trong phạm vi đã chọn.
- Chọn giấy phép, kênh phát hành và nền tảng đích.
- Tạo bản build có số phiên bản; kiểm tra từ một bản clone sạch.
- Tự động hóa build/deploy sau khi quy trình xuất bản thủ công đã chạy ổn.

Hoàn thành khi: người thử chơi được từ đầu đến cuối mà không cần nhóm hướng dẫn; không còn lỗi chặn tiến trình đã biết; tải về/chạy/lưu/tải lại được; có cách quay về bản phát hành trước.

## Quy tắc tránh làm lan man

- Chưa làm sự nghiệp đầy đủ nếu một pha bóng chưa ổn.
- Chưa vẽ nhiều animation nếu camera và tỷ lệ sprite còn thay đổi.
- Chưa tối ưu AI nâng cao nếu AI cơ bản còn tranh bóng hoặc bỏ bóng.
- Chưa tự động deploy nếu chưa xuất được bản chạy độc lập.
- Mỗi mốc phải có bản chơi thử và danh sách lỗi; không chỉ có tài liệu hoặc ảnh chụp.
