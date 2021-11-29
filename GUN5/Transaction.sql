use master
go
CREATE DATABASE Banka
go
use Banka
go

create table Hesaplar(
	Id int identity primary key,
	AdSoyad nvarchar(50) not null,
	Bakiye decimal(12,3) default 0,
)

insert into Hesaplar values ('Mesut',5000)
insert into Hesaplar values ('Oguzhan',1000)
insert into Hesaplar values ('Berna',7500)
insert into Hesaplar values ('Gizem',1500)


alter proc sp_havale_yap
@aliciId int,
@gondericiId int,
@tutar decimal(12,3)
as
begin
	BEGIN TRY
	BEGIN TRAN HavaleTran
	if exists (select * from Hesaplar where Id=@gondericiId)
		begin 
			update Hesaplar set Bakiye-= @tutar where Id = @gondericiId
		end
	else 
		begin
			raiserror('Gonderici bulunamadi.',16,1)
		end
	if exists (select * from Hesaplar where Id=@aliciId)
		begin 
			update Hesaplar set Bakiye-= @tutar where Id = @aliciId
		end
	else
	   begin
	        raiserror('Alici bulunamadi.',16,1)
		end
	COMMIT TRAN HavaleTran
		END TRY
		BEGIN CATCH
			print (ERROR_MESSAGE())
		END CATCH
end

select * from Hesaplar

exec sp_havale_yap 2,3,1500
exec sp_havale_yap 23,1,5000
exec sp_havale_yap 1,23,5000000

