USE [QLBanHang]
GO
INSERT [dbo].[KHACH_HANG] ([MAKH], [HOTEN], [GIOITINH], [DTHOAI], [DIACHI]) VALUES (N'213212    ', N'Nguyễn Tuấn Thanh', N'Nữ', NULL, NULL)
INSERT [dbo].[KHACH_HANG] ([MAKH], [HOTEN], [GIOITINH], [DTHOAI], [DIACHI]) VALUES (N'3213232   ', N'Nguyễn Phúc Thịnh', N'Nam', NULL, NULL)
INSERT [dbo].[KHACH_HANG] ([MAKH], [HOTEN], [GIOITINH], [DTHOAI], [DIACHI]) VALUES (N'3265489   ', N'Bành Thị Hoa', N'Nữ', NULL, NULL)
INSERT [dbo].[KHACH_HANG] ([MAKH], [HOTEN], [GIOITINH], [DTHOAI], [DIACHI]) VALUES (N'465321    ', N'Nguyễn Ngọc Trâm', N'Nữ', NULL, NULL)
INSERT [dbo].[KHACH_HANG] ([MAKH], [HOTEN], [GIOITINH], [DTHOAI], [DIACHI]) VALUES (N'5462122   ', N'Đỗ Thị Lời', N'Nữ', NULL, NULL)
INSERT [dbo].[KHACH_HANG] ([MAKH], [HOTEN], [GIOITINH], [DTHOAI], [DIACHI]) VALUES (N'987941    ', N'Nguyễn Anh Hoàng', N'Nam', NULL, NULL)
GO
INSERT [dbo].[HOA_DON] ([MAHD], [NGAYLAP], [MAKH]) VALUES (N'1         ', NULL, NULL)
INSERT [dbo].[HOA_DON] ([MAHD], [NGAYLAP], [MAKH]) VALUES (N'2         ', NULL, NULL)
INSERT [dbo].[HOA_DON] ([MAHD], [NGAYLAP], [MAKH]) VALUES (N'3         ', NULL, NULL)
INSERT [dbo].[HOA_DON] ([MAHD], [NGAYLAP], [MAKH]) VALUES (N'4         ', NULL, NULL)
INSERT [dbo].[HOA_DON] ([MAHD], [NGAYLAP], [MAKH]) VALUES (N'5         ', NULL, NULL)
INSERT [dbo].[HOA_DON] ([MAHD], [NGAYLAP], [MAKH]) VALUES (N'6         ', NULL, NULL)
GO
INSERT [dbo].[SAN_PHAM] ([MASP], [TENSP], [NGAYSX], [DONGIA]) VALUES (N'1         ', N'sp1', NULL, NULL)
INSERT [dbo].[SAN_PHAM] ([MASP], [TENSP], [NGAYSX], [DONGIA]) VALUES (N'2         ', N'sp2', NULL, NULL)
INSERT [dbo].[SAN_PHAM] ([MASP], [TENSP], [NGAYSX], [DONGIA]) VALUES (N'3         ', N'sp3', NULL, NULL)
INSERT [dbo].[SAN_PHAM] ([MASP], [TENSP], [NGAYSX], [DONGIA]) VALUES (N'4         ', N'sp4', NULL, NULL)
INSERT [dbo].[SAN_PHAM] ([MASP], [TENSP], [NGAYSX], [DONGIA]) VALUES (N'5         ', N'sp5', NULL, NULL)
INSERT [dbo].[SAN_PHAM] ([MASP], [TENSP], [NGAYSX], [DONGIA]) VALUES (N'6         ', N'sp6', NULL, NULL)
GO
INSERT [dbo].[CT_HOA_DON] ([MAHD], [MASP], [SOLUONG], [DONGIA]) VALUES (N'1         ', N'1         ', 20, NULL)
INSERT [dbo].[CT_HOA_DON] ([MAHD], [MASP], [SOLUONG], [DONGIA]) VALUES (N'2         ', N'2         ', 30, NULL)
INSERT [dbo].[CT_HOA_DON] ([MAHD], [MASP], [SOLUONG], [DONGIA]) VALUES (N'3         ', N'3         ', 45, NULL)
INSERT [dbo].[CT_HOA_DON] ([MAHD], [MASP], [SOLUONG], [DONGIA]) VALUES (N'4         ', N'4         ', 20, NULL)
INSERT [dbo].[CT_HOA_DON] ([MAHD], [MASP], [SOLUONG], [DONGIA]) VALUES (N'5         ', N'5         ', 110, NULL)
INSERT [dbo].[CT_HOA_DON] ([MAHD], [MASP], [SOLUONG], [DONGIA]) VALUES (N'6         ', N'6         ', 22, NULL)
GO
