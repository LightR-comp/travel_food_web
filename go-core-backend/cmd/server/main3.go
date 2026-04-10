package main

import (
	"fmt"
	"log"
	"os"

	// Thay "go-core-backend" bằng tên module trong file go.mod của bạn
	"go-core-backend/internal/handlers"
	"go-core-backend/internal/services"
)

func main() {
	// 1. THIET LAP MOI TRUONG
	// Thay bang API Key that cua ban
	os.Setenv("GOONG_API_KEY", "PHfxdwZaHgOePAYrrtupmEcLmQIJFlCponyoBPMz")

	client := services.NewGMapsClient()
	if client.APIKey == "" {
		log.Fatal("❌ Loi: Chua thiet lap API Key trong bien moi truong.")
	}

	fmt.Println("=========================================================")
	fmt.Println("🚀 HE THONG KIEM THU: TIM KIEM & CHUAN HOA DIA DIEM")
	fmt.Println("=========================================================")

	// --- BUOC 1: XAC DINH VI TRI TRUONG DH KHOA HOC TU NHIEN (LAM TAM) ---
	mocViTri := "Đại học Khoa học Tự nhiên TP.HCM"
	fmt.Printf("🔍 Buoc 1: Dang xac dinh toa do moc: '%s'...\n", mocViTri)

	// Goi Autocomplete de lay ID truong (truyen 0,0,0 vi chua co tam)
	resMoc, err := client.Autocomplete(mocViTri, 1, 0, 0, 0)
	if err != nil || len(resMoc.Predictions) == 0 {
		log.Fatal("❌ Khong tim thay toa do truong KHTN. Kiem tra lai API Key.")
	}

	// Lay chi tiet de co Lat/Lng chinh xac
	chiTietMoc, _ := client.GetPlaceDetail(resMoc.Predictions[0].PlaceID)
	latTam := chiTietMoc.Result.Geometry.Location.Lat
	lngTam := chiTietMoc.Result.Geometry.Location.Lng

	fmt.Printf("✅ Da xac dinh tam tai: %f, %f\n", latTam, lngTam)
	fmt.Println("---------------------------------------------------------")

	// --- BUOC 2: TIM 10 QUAN AN XUNG QUANH BAN KINH 1KM ---
	tuKhoa := "Jollibee"
	banKinh := 5000 // 5km
	fmt.Printf("🔍 Buoc 2: Tim kiem '%s' trong ban kinh %dm xung quanh truong...\n", tuKhoa, banKinh)

	// Goi Autocomplete voi toa do tam va ban kinh
	danhSachGoiY, err := client.Autocomplete(tuKhoa, 5, latTam, lngTam, banKinh)
	if err != nil || len(danhSachGoiY.Predictions) == 0 {
		log.Fatal("❌ Khong tim thay quan nao xung quanh khu vuc nay.")
	}

	// --- BUOC 3: DUYET DANH SACH, GOI HANDLER CHUAN HOA & IN KET QUA ---
	fmt.Println("👨‍🍳 Buoc 3: Dang chuan hoa du lieu cau truc (Main/Secondary Text)...")
	fmt.Println("---------------------------------------------------------")

	for i, p := range danhSachGoiY.Predictions {
		// Goi Detail de lay toa do thuc te cua tung quan
		chiTietQuan, err := client.GetPlaceDetail(p.PlaceID)
		if err != nil {
			continue
		}

		// GOI HANDLER: Truyen them StructuredFormatting (MainText, SecondaryText)
		duLieuSach := handlers.StandardizeData(
			chiTietQuan,
			p.StructuredFormatting.MainText,
			p.StructuredFormatting.SecondaryText,
			latTam,
			lngTam,
		)
		// LỌC NGHIÊM NGẶT: Chỉ hiển thị nếu khoảng cách <= 1.0 km
		if duLieuSach.Distance > 1.0 {
			// Quán này API ưu tiên nhưng nó nằm ngoài 1km -> Bỏ qua!
			continue
		}
		// HIEN THI KET QUA
		fmt.Printf("[%d] 🏠 %s\n", i+1, duLieuSach.Name)
		fmt.Printf("    📍 Khu vuc:   %s\n", duLieuSach.SecondaryAddr)
		fmt.Printf("    📮 Dia chi:   %s\n", duLieuSach.FullAddress)
		fmt.Printf("    🌐 Toa do:    %.6f, %.6f\n", duLieuSach.Lat, duLieuSach.Lng)
		fmt.Printf("    🛣️  Cach moc:  %.2f km | 🕒 %s\n", duLieuSach.Distance, duLieuSach.Status)
		fmt.Printf("    💰 Gia dinh muc: %s VNĐ\n", duLieuSach.Price)
		fmt.Println("---------------------------------------------------------")
	}

	fmt.Println("✅ Hoan thanh quy trinh kiem tra.")
}
