----q1:

--declare @nom varchar(20), @prenom varchar(20);
--declare cur1 cursor for select nom, prenom  from Passager;
--begin
--	open cur1;
--	fetch next from cur1 into @nom, @prenom;
--	while @@FETCH_STATUS=0
--	begin
--		print concat(@nom, ' ', @prenom);
--		fetch next from cur1 into @nom, @prenom;
--	end
--	close cur1;
--	deallocate cur1;
--end

----q2:

--declare @pil int, @codePost int;
--declare @nomp varchar(20);
--declare cur2 cursor for select pil#, nom, CodePostal from pilote;
--begin
--	open cur2;
--	fetch next from cur2 into @pil, @nomp, @codePost;
--	while @@FETCH_STATUS=0
--	begin
--		print 'Le numero pilote '+convert(varchar(20),@pil)+' portant nom '+@nomp+' '+convert(varchar(20),@codePost);
--		fetch next from cur2 into @pil, @nomp, @codePost;
--	end
--	close cur2;
--	deallocate cur2;
--end

----q3:

--declare @nompilote varchar(20), @numvol int, @villedep varchar(20), @villearriv varchar(20);
--declare cur3 cursor for select nom, vol#, villedepart, villearrivee from pilote join vol on  pil#=pilote;
--begin
--	open cur3;
--	fetch next from cur3 into @nompilote, @numvol, @villedep, @villearriv;
--	while @@FETCH_STATUS=0
--	begin
--		print 'Le pilote : '+@nompilote+' a les vols suivants :';
--		print 'Vol N° : '+convert(varchar(20),@numvol);
--		print @villedep+' - '+@villearriv;
--		fetch next from cur3 into @nompilote, @numvol, @villedep, @villearriv;
--	end
--	close cur3;
--	deallocate cur3;
--end

----q4:

--declare @pass int, @vol int, @datevol date, @numpl int, @prix float;
--declare cur4 cursor for select pas#, vol, datevol, numplace, prix from AffecteVol right join Passager on passager=pas#;
--begin
--	open cur4;
--	fetch next from cur4 into @pass, @vol, @datevol, @numpl, @prix;
--	while @@FETCH_STATUS=0
--	begin
--		if(@vol is null)
--		begin
--			print 'Num passager : '+convert(varchar(20),@pass);
--			print 'Aucune réservation !';
--		end
--		else
--		begin
--			print 'Num Passager : '+convert(varchar(20),@pass);
--			print 'Vol : '+convert(varchar(20),@vol)+' date_vol : '+convert(varchar(20),@datevol)+' Num place : '+convert(varchar(20),@numpl)+' Prix : '+convert(varchar(20),@prix);
--		end
--		fetch next from cur4 into @pass, @vol, @datevol, @numpl, @prix;
--	end
--	close cur4;
--	deallocate cur4;
--end

--q5:

--declare @pas int, @nom varchar(20), @prenom varchar(20), @ville varchar(20)
--declare cur5 cursor for select pas#, nom, prenom, ville from Passager where pas# in (select passager from AffecteVol);
--begin
--	open cur5;
--	fetch next from cur5 into @pas, @nom, @prenom, @ville;
--	while @@FETCH_STATUS=0
--	begin
--		print convert(varchar(20),@pas)+' '+@nom+' '+@prenom+' '+@ville;
--		fetch next from cur5 into @pas, @nom, @prenom, @ville;
--	end
--	close cur5;
--	deallocate cur5;
--end

--q6:

declare @sal money;
declare cur6 cursor for select SalaireBrut from pilote;
begin
	open cur6;
	fetch next from cur6 into @sal;
	while @@FETCH_STATUS=0
	begin
		if(@sal<2000)
		begin
			update pilote set @sal=@sal*1.2;
		end
		if(@sal>2000)
		begin
			update pilote set @sal=@sal*1.1;
		end
		fetch next from cur6 into @sal;
	end
	close cur6;
	deallocate cur6;
end
