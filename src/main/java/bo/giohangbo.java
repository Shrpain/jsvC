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
	
	public void XoaMuc(int index) {
	    if (ds != null && index >= 0 && index < ds.size()) {
	        ds.remove(index);
	    }
	}
	
	public void Cong(String masach) throws Exception{
		int n = ds.size();
		for (int i = 0; i < n; i++) {
			if(ds.get(i).getMasach().toLowerCase().trim().equals(masach.toLowerCase().trim())) {
				long a = ds.get(i).getSoluong();
				ds.get(i).setSoluong(a+1);
				ds.get(i).setThanhtien(ds.get(i).getSoluong()*ds.get(i).getGia());
				break;
			}
		}
	}
	public void tru(String masach) throws Exception{
		int n = ds.size();
		for (int i = 0; i < n; i++) {
			if(ds.get(i).getMasach().toLowerCase().trim().equals(masach.toLowerCase().trim())) {
				long a = ds.get(i).getSoluong();
				if(a>0) {
					ds.get(i).setSoluong(a-1);
					ds.get(i).setThanhtien(ds.get(i).getSoluong()*ds.get(i).getGia());
					break;
				}else { if(a==0){
					Xoahang(masach);
					}
				}
			}
		}
	}
	
	public Long Tongtien() throws Exception{
		Long tong=(long) 0;
		for (giohangbean gh : ds) {
			tong+= gh.getThanhtien();
		}
		return tong;
	}


}
