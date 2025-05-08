SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `chi_tiet_don_hang` (
  `ma_dh` int(11) NOT NULL,
  `ma_sp` int(11) NOT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `gia_ban` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `chi_tiet_don_hang` (`ma_dh`, `ma_sp`, `so_luong`, `gia_ban`) VALUES
(1, 1, 1, 15000000.00),
(1, 2, 2, 500000.00),
(2, 3, 1, 1200000.00),
(3, 4, 2, 1800000.00),
(5, 5, 1, 2000000.00);

CREATE TABLE `don_hang` (
  `id` int(11) NOT NULL,
  `ma_kh` int(11) DEFAULT NULL,
  `ngay_dat` date DEFAULT NULL,
  `tong_tien` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `don_hang` (`id`, `ma_kh`, `ngay_dat`, `tong_tien`) VALUES
(1, 1, '2024-04-01', 16000000.00),
(2, 2, '2024-04-05', 1200000.00),
(3, 3, '2024-04-07', 3600000.00),
(5, 1, '2024-04-12', 2000000.00);

CREATE TABLE `khach_hang` (
  `id` int(11) NOT NULL,
  `ten_kh` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sdt` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `khach_hang` (`id`, `ten_kh`, `email`, `sdt`) VALUES
(1, 'Nguyễn Văn Ý', 'y.nguyen@example.com', '0909000001'),
(2, 'Trần Thị Hoa', 'hoa.tran@example.com', '0909000002'),
(3, 'Lê Minh Tuấn', 'tuan.le@example.com', '0909000003'),
(4, 'Phạm Văn An', 'an.pham@example.com', '0909000004'),
(5, 'Hoàng Thị Lan', 'lan.hoang@example.com', '0909000005');

CREATE TABLE `san_pham` (
  `id` int(11) NOT NULL,
  `ten_sp` varchar(255) DEFAULT NULL,
  `gia` decimal(10,2) DEFAULT NULL,
  `so_luong_ton` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `san_pham` (`id`, `ten_sp`, `gia`, `so_luong_ton`) VALUES
(1, 'Laptop Dell', 15000000.00, 10),
(2, 'Chuột Logitech', 500000.00, 100),
(3, 'Bàn phím cơ', 1200000.00, 50),
(4, 'Tai nghe Sony', 1800000.00, 30),
(5, 'Ổ cứng SSD', 2000000.00, 40);

ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`ma_dh`,`ma_sp`),
  ADD KEY `ma_sp` (`ma_sp`);

ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ma_kh` (`ma_kh`);

ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `don_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `khach_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `san_pham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `chi_tiet_don_hang_ibfk_1` FOREIGN KEY (`ma_dh`) REFERENCES `don_hang` (`id`),
  ADD CONSTRAINT `chi_tiet_don_hang_ibfk_2` FOREIGN KEY (`ma_sp`) REFERENCES `san_pham` (`id`);

ALTER TABLE `don_hang`
  ADD CONSTRAINT `don_hang_ibfk_1` FOREIGN KEY (`ma_kh`) REFERENCES `khach_hang` (`id`);
COMMIT;
