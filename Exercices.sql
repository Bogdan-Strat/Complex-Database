--ex. 11
--1. Afisati studentii care sunt la buget la facultatea de biologie ordonati alfabetic
select s.nume_student,s.prenume_student
from grupe g join studenti s on (s.grupa_id=g.grupa_id)
      join serii ser on(ser.serie_id=g.serie_id)
     join specializari spec on(spec.specializare_id=ser.specializare_id)
     join facultati f on(spec.facultate_id=f.facultate_id)
where lower(f.nume_facultate)='facultatea de biologie'
group by s.nume_student,s.prenume_student,s.forma_invatamant
having lower(s.forma_invatamant)='buget'
order by 1,2;

--2
--Afisati specializarile la care nu este niciun student

select specializare_nume
from specializari
where specializare_nume not in
(select  spec.specializare_nume
from studenti s join grupe g on(s.grupa_id=g.grupa_id)
                 join serii ser on(ser.serie_id=g.serie_id)
                 join specializari spec on(spec.specializare_id=ser.specializare_id));


--3.Sa se ordoneze studentii dupa medie sau dupa forma de invatamant.
select nume_student,prenume_student
from studenti
order by decode('m','fi',forma_invatamant,'m',nvl(medie_student,6) desc;
select c.curs_id
from cursuri 
where c.curs_id>(select spec.specializare_nume
                 from specializari spec join specializare_cursuri sc on(sc.specializare_id=spec.specializare_id)
                                        join cursuri c on(c.curs_id=sc.curs_id)
                 where c.rata_promovabilitate>avg(c.)

--4. Afiseaza daca studentii au peste 20 de ani sau nu
select upper(nume_student), data_nastere,
case when round(months_between(sysdate,data_nastere))>240 then 'Are peste 20 de ani'
else 'Are sub 20 de ani'
end as varsta
from studenti;

--5. Sa se afiseze numele profesorilor care sunt angajati dupa 2004 si care predau la cel putin 2 serii diferite. Sa se ordoneze datele alfabetic
with numar_predari as (select prof.nume_profesor profes,count(distinct p.serie_id) predari
      from profesor prof join preda p on (p.profesor_id=prof.profesor_id)
      group by prof.nume_profesor
      having count(distinct p.serie_id)>=2
       )
select prof.nume_profesor
from profesor prof join numar_predari np on (np.profes=prof.nume_profesor)
where to_char(prof.data_angajare,'yyyy')>2004
order by 1;


--ex.12
update studenti
set medie_student=(select avg(nvl(medie_student,6)) from studenti)
where medie_student=(select min(nvl(medie_student,6)) from studenti where medie_student<>null) ;

update cursuri
set rata_promovabilitate=rata_promovabilitate+1
where curs_id in (select curs_id 
                from cursuri
                where pauza='da');
                
update facultati
set loc_national=loc_national-1
where loc_national<(select avg(loc_national) from facultati);


--ex. 14
create view vizualizare_compusa as
select s.nume_student, s.medie_student,s.forma_invatamant,g.grupa_id,g.nume_sef_grupa
from studenti s join grupe g on (g.grupa_id=s.grupa_id)
group by s.nume_student, s.medie_student,s.forma_invatamant,g.grupa_id,g.nume_sef_grupa;


--LMD permisa
select grupa_id,avg(nvl(medie_student,6))
from vizualizare_compusa
group by grupa_id;

--LMD nepermisa
update vizualizare_compusa
set forma_invatamant='taxa'
where medie_student=null;


--ex.16
--outer-join
--Afisati studentii care au media mai mare ca 9 si care sunt la facultatea de biologie
select s.nume_student,s.prenume_student, s.medie_student
from grupe g full outer join studenti s on (s.grupa_id=g.grupa_id)
      full outer join serii ser on(ser.serie_id=g.serie_id)
     full outer join specializari spec on(spec.specializare_id=ser.specializare_id)
    full outer join facultati f on(spec.facultate_id=f.facultate_id)
where lower(f.nume_facultate)='facultatea de biologie'
group by s.nume_student,s.prenume_student,s.medie_student
having s.medie_student>9;

--division
--Afisati id-ul profesorilor care au luat premii la cel putin 2 facultati.
select p.profesor_id
from profesor p
where p.profesor_id in (select fp.profesor_id
                    from facultate_profesori fp
                    group by fp.profesor_id
                    having count(distinct fp.nr_premii)>=2);


--Afisati id-ul profesorilor care predau in sala ggoogle.
select profesor_id
from profesor 
where profesor_id in (select profesor_id
                        from preda
                        where sala in (select sala
                                        from preda
                                        where sala='google'));
