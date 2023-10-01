package dao;

import bo.giohangbo;
import jakarta.servlet.http.HttpSession;

public class giohangdao {
	public giohangbo layGioHang(HttpSession session) {
        // Kiểm tra xem session có giỏ hàng không
        if (session.getAttribute("gioHang") != null) {
            // Nếu có, trả về đối tượng giỏ hàng từ session
            return (giohangbo) session.getAttribute("gioHang");
        }
        return null; // Nếu không có giỏ hàng, trả về null hoặc thực hiện xử lý khác tùy theo yêu cầu của bạn
    }

}
