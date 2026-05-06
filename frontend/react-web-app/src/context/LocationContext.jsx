import React, { createContext, useState, useEffect, useContext } from "react";

// 1. Khởi tạo Context
const LocationContext = createContext();

// 2. Tạo Provider component
export const LocationProvider = ({ children }) => {
  const [location, setLocation] = useState({
    lat: null,
    lon: null,
    loading: true,
    error: null,
  });

  // Hàm lấy vị trí thực tế từ trình duyệt
  const getGeoLocation = () => {
    if (!navigator.geolocation) {
      setLocation((prev) => ({
        ...prev,
        loading: false,
        error: "Trình duyệt không hỗ trợ định vị",
      }));
      return;
    }

    navigator.geolocation.getCurrentPosition(
      (position) => {
        setLocation({
          lat: position.coords.latitude,
          lon: position.coords.longitude,
          loading: false,
          error: null,
        });
      },
      (error) => {
        setLocation((prev) => ({
          ...prev,
          loading: false,
          error: "Không thể lấy vị trí: " + error.message,
        }));
      },
    );
  };

  // Tự động lấy vị trí khi lần đầu load app
  useEffect(() => {
    getGeoLocation();
  }, []);

  return (
    <LocationContext.Provider
      value={{ ...location, refreshLocation: getGeoLocation }}
    >
      {children}
    </LocationContext.Provider>
  );
};

// 3. Custom hook để dùng ở các Component khác
export const useLocation = () => {
  const context = useContext(LocationContext);
  if (!context) {
    throw new Error("useLocation phải được đặt trong LocationProvider");
  }
  return context;
};
