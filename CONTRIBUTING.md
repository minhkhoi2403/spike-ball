# Cộng tác hai người

## Nhánh và review

- `main`: trạng thái tích hợp đã được kiểm tra.
- Mỗi công việc dùng nhánh ngắn: `feat/court-camera`, `feat/ball-motion`, `fix/rotation-order` hoặc `docs/roadmap`.
- Gắn một người phụ trách cho từng issue. Issue cần mục tiêu, phần phụ thuộc và tiêu chí hoàn thành.
- Tạo pull request khi thay đổi đủ nhỏ để review. Người còn lại kiểm tra trước khi merge.
- Cập nhật nhánh từ `main` trước khi tích hợp; không force-push lên `main`.
- Không cùng sửa một scene hoặc tài nguyên nhị phân nếu chưa thống nhất.

## Danh tính commit

Dùng tên và email Git của thành viên thực hiện. Kiểm tra trước khi commit công khai. Nếu không muốn công khai email cá nhân, dùng địa chỉ noreply lấy từ phần cài đặt tài khoản GitHub của chính thành viên đó.

Không tự thêm tác giả, chữ ký, credit hoặc dòng đồng tác giả ngoài những người được chủ dự án cho phép.

## File được đưa vào Git

- Mã nguồn, scene, asset nguồn cần thiết, dữ liệu mẫu và tài liệu.
- Không đưa khóa bí mật, token, mật khẩu, dữ liệu cá nhân hoặc file cấu hình máy riêng vào repo.
- Không đưa cache engine hoặc bản build xuất ra vào lịch sử mã nguồn.
- Chọn cách quản lý asset lớn trước khi thêm hàng loạt tài nguyên nhị phân.

## Kiểm tra trước khi merge

1. Project mở được trên phiên bản engine đã thống nhất.
2. Tình huống liên quan thay đổi chạy đúng.
3. Không làm hỏng phần phụ thuộc trực tiếp.
4. Với luật, lưu/tải hoặc mô phỏng: thêm hoặc cập nhật ca kiểm thử phù hợp.
5. Ghi rõ giới hạn và phần chưa làm trong pull request.

## Phát hành

Chỉ thêm tự động build/deploy sau khi chọn nền tảng và xuất bản thủ công thành công. Release phải ghi phiên bản, cách chạy và lỗi còn biết. Không tự gửi lời mời cộng tác hoặc thay đổi quyền truy cập khi chưa có yêu cầu cụ thể của chủ repository.
