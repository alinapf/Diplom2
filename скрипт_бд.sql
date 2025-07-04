USE [VeterinaryClinic]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09.06.2025 13:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 09.06.2025 13:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[appointment_id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NULL,
	[doctor_id] [int] NULL,
	[service_id] [int] NULL,
	[status] [nvarchar](20) NULL,
	[date] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[notes] [text] NULL,
	[diagnosis] [text] NULL,
	[prescription] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 09.06.2025 13:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[phone] [nvarchar](15) NULL,
	[address] [nvarchar](200) NULL,
	[pet_name] [nvarchar](100) NULL,
	[pet_type] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 09.06.2025 13:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[doctor_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[name] [nvarchar](100) NOT NULL,
	[specialization] [nvarchar](100) NOT NULL,
	[rating] [int] NOT NULL,
	[bio] [text] NULL,
	[photo_url] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorSchedules]    Script Date: 09.06.2025 13:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorSchedules](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_id] [int] NOT NULL,
	[day_of_week] [tinyint] NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[is_working_day] [bit] NULL,
	[schedule_type] [int] NOT NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 09.06.2025 13:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[action] [text] NOT NULL,
	[timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordResetCodes]    Script Date: 09.06.2025 13:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordResetCodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[IsUsed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 09.06.2025 13:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_id] [int] NULL,
	[client_id] [int] NULL,
	[appointment_id] [int] NULL,
	[rating] [int] NULL,
	[comment] [text] NULL,
	[created_at] [datetime] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 09.06.2025 13:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [text] NULL,
	[specialization] [nvarchar](100) NOT NULL,
	[duration_minutes] [int] NOT NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09.06.2025 13:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([appointment_id], [client_id], [doctor_id], [service_id], [status], [date], [time], [notes], [diagnosis], [prescription]) VALUES (1, 1, 1, 1, N'завершено', CAST(N'2023-05-01' AS Date), CAST(N'10:00:00' AS Time), N'Плановый осмотр', NULL, NULL)
INSERT [dbo].[Appointments] ([appointment_id], [client_id], [doctor_id], [service_id], [status], [date], [time], [notes], [diagnosis], [prescription]) VALUES (2, 2, 2, 3, N'завершено', CAST(N'2023-05-02' AS Date), CAST(N'11:00:00' AS Time), N'Операция по удалению опухоли', NULL, NULL)
INSERT [dbo].[Appointments] ([appointment_id], [client_id], [doctor_id], [service_id], [status], [date], [time], [notes], [diagnosis], [prescription]) VALUES (3, 1, 1, 2, N'запланировано', CAST(N'2023-06-01' AS Date), CAST(N'14:00:00' AS Time), N'Плановая вакцинация', NULL, NULL)
INSERT [dbo].[Appointments] ([appointment_id], [client_id], [doctor_id], [service_id], [status], [date], [time], [notes], [diagnosis], [prescription]) VALUES (6, 3, 1, 1, N'запланировано', CAST(N'2025-06-06' AS Date), CAST(N'12:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([appointment_id], [client_id], [doctor_id], [service_id], [status], [date], [time], [notes], [diagnosis], [prescription]) VALUES (7, 3, 1, 1, N'запланировано', CAST(N'2025-06-06' AS Date), CAST(N'15:30:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([appointment_id], [client_id], [doctor_id], [service_id], [status], [date], [time], [notes], [diagnosis], [prescription]) VALUES (8, 4, 1, 1, N'запланировано', CAST(N'2025-06-06' AS Date), CAST(N'11:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([appointment_id], [client_id], [doctor_id], [service_id], [status], [date], [time], [notes], [diagnosis], [prescription]) VALUES (11, 4, 2, 3, N'запланировано', CAST(N'2025-06-12' AS Date), CAST(N'14:30:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([appointment_id], [client_id], [doctor_id], [service_id], [status], [date], [time], [notes], [diagnosis], [prescription]) VALUES (12, 4, 1, 1, N'запланировано', CAST(N'2025-06-11' AS Date), CAST(N'14:00:00' AS Time), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([client_id], [user_id], [name], [phone], [address], [pet_name], [pet_type]) VALUES (1, 4, N'Иван Иванов', N'1234567890', N'ул. Ленина, 10', N'Барсик', N'Кот')
INSERT [dbo].[Clients] ([client_id], [user_id], [name], [phone], [address], [pet_name], [pet_type]) VALUES (2, 5, N'Петр Петров', N'2345678901', N'ул. Пушкина, 5', N'Шарик', N'Собака')
INSERT [dbo].[Clients] ([client_id], [user_id], [name], [phone], [address], [pet_name], [pet_type]) VALUES (3, 6, N'Сидор Милер', N'+73456789012', N'Пищерова 6', N'Пети', N'Кот')
INSERT [dbo].[Clients] ([client_id], [user_id], [name], [phone], [address], [pet_name], [pet_type]) VALUES (4, 7, N'Мария Никонова', N'+74567890123', N'Пищерова 1', N'Варин', N'Овчарка')
INSERT [dbo].[Clients] ([client_id], [user_id], [name], [phone], [address], [pet_name], [pet_type]) VALUES (5, 8, N'Ксения Рикет', N'+73456789012', N'Булинскова 6', N'Сима', N'Кошка')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([doctor_id], [user_id], [name], [specialization], [rating], [bio], [photo_url]) VALUES (1, 2, N'Смирнов А.А.', N'Терапевт', 4, N'Опытный ветеринар-терапевт с 10-летним стажем', N'/images/doctors/1.jpg')
INSERT [dbo].[Doctors] ([doctor_id], [user_id], [name], [specialization], [rating], [bio], [photo_url]) VALUES (2, 3, N'Иванова Е.В.', N'Хирург', 5, N'Специалист по сложным хирургическим операциям', N'/images/doctors/2.jpg')
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[DoctorSchedules] ON 

INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (1, 1, 1, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, 0, NULL)
INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (2, 1, 2, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, 0, NULL)
INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (3, 1, 3, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, 0, NULL)
INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (4, 1, 4, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, 0, NULL)
INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (5, 1, 5, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, 0, NULL)
INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (6, 2, 1, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, 0, NULL)
INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (7, 2, 2, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, 0, NULL)
INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (8, 2, 3, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, 0, NULL)
INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (9, 2, 4, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, 0, NULL)
INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (10, 2, 5, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, 0, NULL)
INSERT [dbo].[DoctorSchedules] ([schedule_id], [doctor_id], [day_of_week], [start_time], [end_time], [is_working_day], [schedule_type], [date]) VALUES (11, 2, 6, CAST(N'10:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[DoctorSchedules] OFF
GO
SET IDENTITY_INSERT [dbo].[PasswordResetCodes] ON 

INSERT [dbo].[PasswordResetCodes] ([Id], [Email], [Code], [ExpirationDate], [IsUsed]) VALUES (1, N'covalemon@gmail.com', N'3EB935', CAST(N'2025-06-06T05:09:17.623' AS DateTime), 0)
INSERT [dbo].[PasswordResetCodes] ([Id], [Email], [Code], [ExpirationDate], [IsUsed]) VALUES (2, N'covalemon@gmail.com', N'497160', CAST(N'2025-06-06T05:24:30.437' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PasswordResetCodes] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([review_id], [doctor_id], [client_id], [appointment_id], [rating], [comment], [created_at], [status]) VALUES (1, 1, 1, 1, 5, N'Отличный врач, все объяснил и помог', CAST(N'2025-06-01T23:33:52.210' AS DateTime), N'Одобрено')
INSERT [dbo].[Reviews] ([review_id], [doctor_id], [client_id], [appointment_id], [rating], [comment], [created_at], [status]) VALUES (2, 2, 2, 2, 4, N'Операция прошла успешно, но долго ждали', CAST(N'2025-06-01T23:33:52.210' AS DateTime), N'На модерации')
INSERT [dbo].[Reviews] ([review_id], [doctor_id], [client_id], [appointment_id], [rating], [comment], [created_at], [status]) VALUES (3, 1, 3, NULL, 4, N'dct uel', CAST(N'2025-06-05T11:20:06.673' AS DateTime), N'Одобрено')
INSERT [dbo].[Reviews] ([review_id], [doctor_id], [client_id], [appointment_id], [rating], [comment], [created_at], [status]) VALUES (5, 1, 3, NULL, 1, N'dfdfdf', CAST(N'2025-06-05T11:20:38.363' AS DateTime), N'Одобрено')
INSERT [dbo].[Reviews] ([review_id], [doctor_id], [client_id], [appointment_id], [rating], [comment], [created_at], [status]) VALUES (6, 1, 4, NULL, 3, N'Очень хороший врач, но к сожалению не успели помочь((', CAST(N'2025-06-05T14:49:32.000' AS DateTime), N'Одобрено')
INSERT [dbo].[Reviews] ([review_id], [doctor_id], [client_id], [appointment_id], [rating], [comment], [created_at], [status]) VALUES (7, 2, 4, NULL, 4, N'123123123', CAST(N'2025-06-05T15:00:02.960' AS DateTime), N'Одобрено')
INSERT [dbo].[Reviews] ([review_id], [doctor_id], [client_id], [appointment_id], [rating], [comment], [created_at], [status]) VALUES (8, 1, 4, NULL, 2, N'все гуд', CAST(N'2025-06-08T18:54:21.590' AS DateTime), N'На модерации')
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([service_id], [name], [description], [specialization], [duration_minutes], [price]) VALUES (1, N'Консультация терапевта', N'Первичный осмотр животного', N'Терапевт', 30, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([service_id], [name], [description], [specialization], [duration_minutes], [price]) VALUES (2, N'Вакцинация', N'Проведение плановой вакцинации', N'Терапевт', 30, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([service_id], [name], [description], [specialization], [duration_minutes], [price]) VALUES (3, N'Хирургическая операция', N'Проведение хирургического вмешательства', N'Хирург', 120, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([service_id], [name], [description], [specialization], [duration_minutes], [price]) VALUES (4, N'Стоматологический осмотр', N'Осмотр полости рта и зубов', N'Стоматолог', 30, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([service_id], [name], [description], [specialization], [duration_minutes], [price]) VALUES (5, N'Ультразвуковое исследование', N'УЗИ внутренних органов', N'Кардиолог', 60, CAST(3500.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role]) VALUES (1, N'admin', N'admin@clinic.com', N'AQAAAAIAAYagAAAAEGREdFqoSRE1uXSXhpk1zfG/S21Zu/N2Onxhjo5hUJP8OxRjOXhp6NuAYI394IUtvQ==', N'Админ')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role]) VALUES (2, N'doctor1', N'doctor1@clinic.com', N'AQAAAAIAAYagAAAAEPu57Sen44PbVwW0Mv2NxwVO6eHZNfLbDI2NA/49sOHYO1D2tqp1Xcz10TdLWeQGPA==', N'Врач')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role]) VALUES (3, N'doctor2', N'doctor2@clinic.com', N'AQAAAAIAAYagAAAAEPu57Sen44PbVwW0Mv2NxwVO6eHZNfLbDI2NA/49sOHYO1D2tqp1Xcz10TdLWeQGPA==', N'Врач')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role]) VALUES (4, N'client1', N'client1@example.com', N'AQAAAAIAAYagAAAAEPu57Sen44PbVwW0Mv2NxwVO6eHZNfLbDI2NA/49sOHYO1D2tqp1Xcz10TdLWeQGPA==', N'Клиент')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role]) VALUES (5, N'client2', N'client2@example.com', N'AQAAAAIAAYagAAAAEPu57Sen44PbVwW0Mv2NxwVO6eHZNfLbDI2NA/49sOHYO1D2tqp1Xcz10TdLWeQGPA==', N'Клиент')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role]) VALUES (6, N'client3', N'client3@gmail.com', N'AQAAAAIAAYagAAAAEGREdFqoSRE1uXSXhpk1zfG/S21Zu/N2Onxhjo5hUJP8OxRjOXhp6NuAYI394IUtvQ==', N'Клиент')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role]) VALUES (7, N'client', N'covalemon@gmail.com', N'AQAAAAIAAYagAAAAEM+BBMtz5HLxp2GHz07rv/YdPEWZdi5sJrlXNwWPzdrJEmlyfB9ugH9l66TDLfO+dw==', N'Клиент')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role]) VALUES (8, N'Viaty', N'Viaty@gmail.com', N'AQAAAAIAAYagAAAAED/4HcthZ+hUQC+2Cv8EHlPyxONHFMfKy436ls1N16o1fkD0LN0F5CSA48VfIuR3bg==', N'Клиент')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[DoctorSchedules] ADD  DEFAULT ((1)) FOR [is_working_day]
GO
ALTER TABLE [dbo].[DoctorSchedules] ADD  DEFAULT ((0)) FOR [schedule_type]
GO
ALTER TABLE [dbo].[Logs] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[PasswordResetCodes] ADD  DEFAULT ((0)) FOR [IsUsed]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Reviews] ADD  CONSTRAINT [DF_Reviews_status]  DEFAULT ('На модерации') FOR [status]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT ((30)) FOR [duration_minutes]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Clients] FOREIGN KEY([client_id])
REFERENCES [dbo].[Clients] ([client_id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Clients]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Doctors] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctors] ([doctor_id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Doctors]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Services] FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([service_id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Services]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Users]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Users]
GO
ALTER TABLE [dbo].[DoctorSchedules]  WITH CHECK ADD  CONSTRAINT [FK_DoctorSchedules_Doctors] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctors] ([doctor_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DoctorSchedules] CHECK CONSTRAINT [FK_DoctorSchedules_Doctors]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_Users]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Appointments] FOREIGN KEY([appointment_id])
REFERENCES [dbo].[Appointments] ([appointment_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Appointments]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Clients] FOREIGN KEY([client_id])
REFERENCES [dbo].[Clients] ([client_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Clients]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Doctors] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctors] ([doctor_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Doctors]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [CK_Appointments_Status] CHECK  (([status]='отменено' OR [status]='завершено' OR [status]='запланировано' OR [status]='перенесено'))
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [CK_Appointments_Status]
GO
ALTER TABLE [dbo].[DoctorSchedules]  WITH CHECK ADD  CONSTRAINT [CK_DoctorSchedules_DayOfWeek] CHECK  (([day_of_week]>=(1) AND [day_of_week]<=(7)))
GO
ALTER TABLE [dbo].[DoctorSchedules] CHECK CONSTRAINT [CK_DoctorSchedules_DayOfWeek]
GO
ALTER TABLE [dbo].[DoctorSchedules]  WITH CHECK ADD  CONSTRAINT [CK_DoctorSchedules_Time] CHECK  (([end_time]>[start_time]))
GO
ALTER TABLE [dbo].[DoctorSchedules] CHECK CONSTRAINT [CK_DoctorSchedules_Time]
GO
ALTER TABLE [dbo].[DoctorSchedules]  WITH CHECK ADD  CONSTRAINT [CK_ScheduleType] CHECK  (([schedule_type]=(1) OR [schedule_type]=(0)))
GO
ALTER TABLE [dbo].[DoctorSchedules] CHECK CONSTRAINT [CK_ScheduleType]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [CK_Reviews_Rating] CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [CK_Reviews_Rating]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [CK_Reviews_status] CHECK  (([status]='Одобрено' OR [status]='На модерации'))
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [CK_Reviews_status]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [CK_Services_Duration] CHECK  (([duration_minutes]>(0)))
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [CK_Services_Duration]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_Role] CHECK  (([role]='Админ' OR [role]='Врач' OR [role]='Клиент'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_Role]
GO
