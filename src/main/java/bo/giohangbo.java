package bo;

import java.util.ArrayList;

import bean.giohangbean;
import bean.sachbean;

public class giohangbo {
	
	//viết hàm thêm/xóa/tổng tiền vào giỏ:ds
	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();
	public void Themhang(String masach, String tensach, String tacgia, Long soluong, Long gia,
			String anh) throws Exception{
		int n=ds.size();
		if(n==0) {
			soluong=(long)1;
			ds.add(new giohangbean(masach, tensach, tacgia, soluong, gia, anh));
		}else {
			for (int i=0;i<n;i++) {
				if(ds.get(i).getMasach().toLowerCase().trim().equals(masach.toLowerCase().trim())){
					long sl= ds.get(i).getSoluong()+(long)1;
					ds.get(i).setSoluong(sl);
					long g = ds.get(i).getGia();
					long tt = sl*g;
					ds.get(i).setThanhtien(tt);
					return;
				}
			}
			soluong=(long)1;
			ds.add(new giohangbean(masach, tensach, tacgia, soluong, gia, anh));
		}
	}
	public void Xoahang(String masach) throws Exception{
		int n = ds.size();
		for (int i = 0; i < n; i++) {
			if(ds.get(i).getMasach().toLowerCase().trim().equals(masach.toLowerCase().trim())) {
				ds.remove(i);
				break;
			}
		}
	}
	public void XoaALL() {
		ds.clear();
	}
	public Long Tongtien() throws Exception{
		Long tong=(long) 0;
		for (giohangbean gh : ds) {
			tong+= gh.getThanhtien();
		}
		return tong;
	}
	
	public void Sua(String masach, int soLuongThayDoi) throws Exception {
	    int n = ds.size();
	    for (int i = 0; i < n; i++) {
	        if (ds.get(i).getMasach().toLowerCase().trim().equals(masach.toLowerCase().trim())) {
	            long soLuongHienTai = ds.get(i).getSoluong();
	            long soLuongMoi = soLuongHienTai + soLuongThayDoi;

	            if (soLuongMoi >= 0) {
	                ds.get(i).setSoluong(soLuongMoi);
	                ds.get(i).setThanhtien(ds.get(i).getSoluong() * ds.get(i).getGia());
	            } else {
	                // Nếu số lượng mới là số âm, bạn có thể xử lý tùy theo yêu cầu của bạn ở đây.
	                // Ví dụ: Ghi log hoặc ném một ngoại lệ.
	                throw new Exception("Số lượng không hợp lệ");
	            }
	            break;
	        }
	    }
	}



}
