# Đồng phục và số áo

Mở `prototypes/browser/spike-ball-jerseys.html` bằng trình duyệt. Đây là bản độc lập dựa trên demo bàn phím, không cần cài thư viện. Nút **Xem cầu thủ** hiển thị 14 cầu thủ của hai đội, bao gồm hai phụ công được libero thay thế. Trong sân vẫn có 12 người.

## Thay đổi
- Giữ nguyên atlas, tỷ lệ, tóc, mặt, tay chân và chuyển động đã duyệt.
- Số áo cố định theo cầu thủ, khác số vị trí xoay vòng. Mỗi đội có bảy số riêng biệt.
- Tên giả lập gồm Việt Nam và quốc tế; tên đầy đủ có dấu trong bảng cầu thủ, chữ cái viết tắt không dấu trên lưng.
- Atlas hiện có sáu hình quay lưng và sáu hình chính diện. Chỉ hình quay lưng có chữ viết tắt; chính diện có số ngực.
- Libero đội nhà mặc áo vàng; libero đội khách mặc áo xanh ngọc nhạt. Quần giữ màu đội.
- Chữ trên lưng rất nhỏ ở tỷ lệ thi đấu; dùng bảng cầu thủ để đọc rõ danh tính.

## Ghép với nhánh gameplay
Phần ngoại hình nằm trong `jerseyRoster`, `jerseyGlyphs`, `jerseyText`, `decorateJersey` và `referencePlayer`. Khóa bộ nhớ đệm bao gồm artId, đội, libero, số áo và tên viết tắt. Không dùng riêng artId vì người dự bị có thể dùng chung hình gốc.

Khi tạo phụ công thay libero trong `regulars`, gán lại fullName, shirtName và number để không kế thừa danh tính libero. Hiện dữ liệu ngoại hình nằm cùng HTML để mở trực tiếp; khi ghép vào dự án chính, có thể tách thành dữ liệu cầu thủ.

Các thuật toán bóng, AI và điều khiển được giữ nguyên. Bảng cầu thủ tạm dừng thời gian mô phỏng và ngăn phím thao tác lọt vào trận.

## Kiểm tra
- Chrome: mở demo, mở/đóng bảng cầu thủ, bắt đầu trận, không có lỗi JavaScript.
- Đủ 14 thẻ cầu thủ, hai libero, số áo riêng biệt trong mỗi đội.
- So sánh pixel với atlas: không thay đổi pixel ngoài vùng áo.
- Mô phỏng 60 giây: đủ 12 người, tọa độ hợp lệ.

Bản này được lưu cùng đợt bàn giao Godot; chưa cập nhật trang mobile đã xuất bản. Thiết kế mới hơn đã bỏ tên áo, xem `art/README.md`.
