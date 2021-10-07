create table Facultati(
    Facultate_id number(4) primary key,
    Nume_facultate varchar2(30),
    Adresa varchar(50),
    Loc_national number(4)
);

create table Profesor(
    Profesor_id number(4) primary key,
    Facultate_id number(4)
    Nume_profesor varchar2(10),
    Prenume_profesor varchar2(15),
    Data_angajare date,
    Email_profesor varchar2(30),
    constraint fk_facultate_profesor foreign key (Facultate_id) references facultati(Facultate_id)
);

create table Facultate_Profesori(
    Facultate_id number(4);
    Profesor_id number(4);
    Absolvent varchar2(3);
    Nr_premii number(2);
    constraint pk_fac_prof primary key(Facultate_id, Profesor_id)
);

create table Specializari(
    Specializare_id number(4) primary key,
    Facultate_id number(4),
    Specializare_nume varchar2(15),
    Durata number(1),
    Probabilitate_angajare number(4,2),
    constraint fk_fac_spec foreign key (Facultate_id) references facultati(Facultate_id)
);

create table Cursuri(
    Curs_id number(4) primary key,
    Rata_promovabilitate number(4,2),
    Pauza varchar2(3)
);

create table Specializare_Cursuri(
    Specializare_id number(4),
    Curs_id number(4),
    Durata number(3),
    An_implementare number(4),
    constraint pk_spec_curs primary key(Specializare_id,Curs_id)
);

create table Serii(
    Serie_id number(4) primary key,
    Numar_serie number(2),
    Nume_sef_serie varchar2(15),
    Email_serie varchar2(25),
    Specializare_id number(4),
    constraint fk_spec_ser foreign key (Specializare_id) references specializari(Specializare_id)
);

create table Preda(
    Profesor_id number(4),
    Curs_id number(4),
    Serie_id number(4),
    Sala varchar2(25),
    Frecventa number(2),
    constraint pk_preda primary key(Profesor_id,Curs_id,Serie_id)
);

create table Grupe(
    Grupa_id number(4) primary key,
    Numar_grupa number(3),
    Nume_sef_grupa varchar2(15),
    Email_grupa varchar2(30),
    Serie_id number(4),
    constraint fk_ser_gr foreign key (Serie_id) references serii(Serie_id)
);

create table Studenti(
    Student_id number(4) primary key,
    Nume_student varchar2(15),
    Prenume_student varchar2(15),
    Data_nastere date,
    Grupa_id number(4),
    Forma_invatamant varchar2(15),
    Medie_student number(3,2),
    Data_admis date,
    constraint fk_gr_stud foreign key (Grupa_id) references grupe(Grupa_id)
);

create table Firme_Partenere(
    Firma_id number(4),
    Nume_firma varchar2(20),
    Grad_de_intelegere number(4,2),
    Facultate_id number(4),
    constraint fk_fac_firma foreign key (Facultate_id) references facultati(Facultate_id)
);

create table Asociatii_studentesti(
    Asociatie_id number(4),
    Nume_asociatie varchar2(45),
    Nume_reprezentant varchar2(15),
    Facultate_id number(4),
    constraint fk_fac_asoc foreign key (Facultate_id) references facultati(Facultate_id)
);
/*-------------------------------------------------------------------------------*/
insert into facultati(facultate_id, nume_facultate,adresa,loc_national)
values(1,'Facultatea de Matematica-Info','Universitate',1);
insert into facultati(facultate_id, nume_facultate,adresa,loc_national)
values(2,'Facultatea de Biologie','Gradina Botanica',3);
insert into facultati(facultate_id, nume_facultate,adresa,loc_national)
values(3,'Facultatea de Jurnalism','Universitate',10);
insert into facultati(facultate_id, nume_facultate,adresa,loc_national)
values(4,'Facultatea de Limbi Straine','Universitate',9);
insert into facultati(facultate_id, nume_facultate,adresa,loc_national)
values(5,'Facultatea de Filozofie','Grozavesti',12);

insert into profesor(profesor_id,facultate_id,nume_profesor,prenume_profesor,data_angajare,email_profesor)
values(10,1,'Pop','Ionel',to_date('06-06-2002','dd-mm-yyyy'),'pop.ionel@unibuc.ro');
insert into profesor(profesor_id,facultate_id,nume_profesor,prenume_profesor,data_angajare,email_profesor)
values(11,2,'Popa','Ionela',to_date('06-06-2005','dd-mm-yyyy'),'popa.ionela@unibuc.ro');
insert into profesor(profesor_id,facultate_id,nume_profesor,prenume_profesor,data_angajare,email_profesor)
values(12,3,'Magda','Ana',to_date('06-09-2012','dd-mm-yyyy'),'ana.magda@unibuc.ro');
insert into profesor(profesor_id,facultate_id,nume_profesor,prenume_profesor,data_angajare,email_profesor)
values(13,4,'Anton','Margel',to_date('06-06-2019','dd-mm-yyyy'),'margel.anton@unibuc.ro');
insert into profesor(profesor_id,facultate_id,nume_profesor,prenume_profesor,data_angajare,email_profesor)
values(14,5,'Mugur','Alexandru',to_date('08-12-1998','dd-mm-yyyy'),'mugur_alexandru@unibuc.ro');

insert into Facultate_Profesori(facultate_id,profesor_id,absolvent,nr_premii)
values(1,10,'da',5);
insert into Facultate_Profesori(facultate_id,profesor_id,absolvent,nr_premii)
values(1,14,'nu',0);
insert into Facultate_Profesori(facultate_id,profesor_id,absolvent,nr_premii)
values(2,11,'nu',7);
insert into Facultate_Profesori(facultate_id,profesor_id,absolvent,nr_premii)
values(2,13,'nu',1);
insert into Facultate_Profesori(facultate_id,profesor_id,absolvent,nr_premii)
values(3,12,'da',1);
insert into Facultate_Profesori(facultate_id,profesor_id,absolvent,nr_premii)
values(3,13,'nu',0);
insert into Facultate_Profesori(facultate_id,profesor_id,absolvent,nr_premii)
values(4,13,'da',19);
insert into Facultate_Profesori(facultate_id,profesor_id,absolvent,nr_premii)
values(5,14,'da',12);
insert into Facultate_Profesori(facultate_id,profesor_id,absolvent,nr_premii)
values(5,13,'nu',4);
insert into Facultate_Profesori(facultate_id,profesor_id,absolvent,nr_premii)
values(2,10,'nu',2);

insert into specializari(specializare_id,facultate_id,specializare_nume,durata,probabilitate_angajare)
values(21,1,'cti',4,96.70);
insert into specializari(specializare_id,facultate_id,specializare_nume,durata,probabilitate_angajare)
values(22,1,'informatica',3,99.36);
insert into specializari(specializare_id,facultate_id,specializare_nume,durata,probabilitate_angajare)
values(23,2,'microorganisme',3,70.02);
insert into specializari(specializare_id,facultate_id,specializare_nume,durata,probabilitate_angajare)
values(24,3,'media digitala',3,82.52);
insert into specializari(specializare_id,facultate_id,specializare_nume,durata,probabilitate_angajare)
values(25,4,'engleza-rusa',3,91.22);
insert into specializari(specializare_id,facultate_id,specializare_nume,durata,probabilitate_angajare)
values(26,4,'chineza-araba',3,40.94);
insert into specializari(specializare_id,facultate_id,specializare_nume,durata,probabilitate_angajare)
values(27,5,'filozofie',3,22.08);

insert into cursuri(curs_id,rata_promovabilitate,pauza)
values(31,82,'nu');
insert into cursuri(curs_id,rata_promovabilitate,pauza)
values(32,40,'nu');
insert into cursuri(curs_id,rata_promovabilitate,pauza)
values(33,97.99,'da');
insert into cursuri(curs_id,rata_promovabilitate,pauza)
values(34,50,'da');
insert into cursuri(curs_id,rata_promovabilitate,pauza)
values(35,91.25,'nu');
insert into cursuri(curs_id,rata_promovabilitate,pauza)
values(36,87.41,'da');

insert into specializare_cursuri(specializare_id,curs_id,durata,an_implementare)
values(21,31,100,2015);
insert into specializare_cursuri(specializare_id,curs_id,durata,an_implementare)
values(22,31,100,2014);
insert into specializare_cursuri(specializare_id,curs_id,durata,an_implementare)
values(22,32,100,2018);
insert into specializare_cursuri(specializare_id,curs_id,durata,an_implementare)
values(23,33,100,2007);
insert into specializare_cursuri(specializare_id,curs_id,durata,an_implementare)
values(24,34,100,2011);
insert into specializare_cursuri(specializare_id,curs_id,durata,an_implementare)
values(24,33,100,2020);
insert into specializare_cursuri(specializare_id,curs_id,durata,an_implementare)
values(25,35,100,2018);
insert into specializare_cursuri(specializare_id,curs_id,durata,an_implementare)
values(26,36,100,2016);
insert into specializare_cursuri(specializare_id,curs_id,durata,an_implementare)
values(26,35,100,2016);
insert into specializare_cursuri(specializare_id,curs_id,durata,an_implementare)
values(27,35,100,2020);

insert into serii(serie_id,numar_serie,nume_sef_serie,email_serie,specializare_id)
values(800,16,'Dragut','seria16@serie.unibuc.ro',21);
insert into serii(serie_id,numar_serie,nume_sef_serie,email_serie,specializare_id)
values(801,13,'Emanuel','seria13@serie.unibuc.ro',22);
insert into serii(serie_id,numar_serie,nume_sef_serie,email_serie,specializare_id)
values(802,14,'Balaur','seria14@serie.unibuc.ro',22);
insert into serii(serie_id,numar_serie,nume_sef_serie,email_serie,specializare_id)
values(803,20,'Lazar','seria20@serie.unibuc.ro',23);
insert into serii(serie_id,numar_serie,nume_sef_serie,email_serie,specializare_id)
values(804,30,'Paiu','seria30@serie.unibuc.ro',24);
insert into serii(serie_id,numar_serie,nume_sef_serie,email_serie,specializare_id)
values(805,40,'Pop','seria40@serie.unibuc.ro',25);
insert into serii(serie_id,numar_serie,nume_sef_serie,email_serie,specializare_id)
values(806,41,'Ionescu','seria41@serie.unibuc.ro',25);
insert into serii(serie_id,numar_serie,nume_sef_serie,email_serie,specializare_id)
values(807,42,'Ionescu','seria42@serie.unibuc.ro',26);
insert into serii(serie_id,numar_serie,nume_sef_serie,email_serie,specializare_id)
values(808,50,'Dragut','seria50@serie.unibuc.ro',27);

insert into preda(profesor_id,curs_id,serie_id,sala,frecventa)
values(10,31,800,'amfiteatrul 1',1);
insert into preda(profesor_id,curs_id,serie_id,sala,frecventa)
values(10,31,801,'sala google',2);
insert into preda(profesor_id,curs_id,serie_id,sala,frecventa)
values(11,33,803,'sala 40',1);
insert into preda(profesor_id,curs_id,serie_id,sala,frecventa)
values(10,33,803,'amfiteatrul bio',1);
insert into preda(profesor_id,curs_id,serie_id,sala,frecventa)
values(12,34,804,'amfiteatrul 2',2);
insert into preda(profesor_id,curs_id,serie_id,sala,frecventa)
values(13,35,805,'amfiteatrul 1',1);
insert into preda(profesor_id,curs_id,serie_id,sala,frecventa)
values(13,35,806,'amfiteatrul 1',1);
insert into preda(profesor_id,curs_id,serie_id,sala,frecventa)
values(14,35,808,'amfiteatrul 1',1);
insert into preda(profesor_id,curs_id,serie_id,sala,frecventa)
values(14,35,801,'amfiteatrul 1',1);
insert into preda(profesor_id,curs_id,serie_id,sala,frecventa)
values(14,35,802,'amfiteatrul 1',1);

insert into grupe(grupa_id,numar_grupa,nume_sef_grupa,email_grupa,serie_id)
values(901,161,'Mihalcea','grupa161@grupa.unibuc.ro,80',800);
insert into grupe(grupa_id,numar_grupa,nume_sef_grupa,email_grupa,serie_id)
values(902,162,'Mihaila','grupa162@grupa.unibuc.ro,80',800);
insert into grupe(grupa_id,numar_grupa,nume_sef_grupa,email_grupa,serie_id)
values(903,201,'Iepure','grupa201@grupa.unibuc.ro,80',803);
insert into grupe(grupa_id,numar_grupa,nume_sef_grupa,email_grupa,serie_id)
values(904,301,'Stan','grupa301@grupa.unibuc.ro,80',804);
insert into grupe(grupa_id,numar_grupa,nume_sef_grupa,email_grupa,serie_id)
values(905,401,'Stanescu','grupa401@grupa.unibuc.ro,80',805);
insert into grupe(grupa_id,numar_grupa,nume_sef_grupa,email_grupa,serie_id)
values(906,402,'Popescu','grupa402@grupa.unibuc.ro,80',805);
insert into grupe(grupa_id,numar_grupa,nume_sef_grupa,email_grupa,serie_id)
values(907,411,'Pop','grupa411@grupa.unibuc.ro,80',806);
insert into grupe(grupa_id,numar_grupa,nume_sef_grupa,email_grupa,serie_id)
values(908,501,'Chelaru','grupa501@grupa.unibuc.ro,80',807);

insert into studenti(student_id,nume_student,prenume_student,data_nastere,grupa_id,forma_invatamant,medie_student,data_admis)
values(1000,'Escobar','Paul',to_date('08-12-2001','dd-mm-yyyy'),901,'buget',9.12,to_date('30-07-2020','dd-mm-yyyy'));
insert into studenti(student_id,nume_student,prenume_student,data_nastere,grupa_id,forma_invatamant,medie_student,data_admis)
values(1001,'Rugina','Andrei',to_date('08-08-2000','dd-mm-yyyy'),901,'taxa',8.74,to_date('29-07-2020','dd-mm-yyyy'));
insert into studenti(student_id,nume_student,prenume_student,data_nastere,grupa_id,forma_invatamant,medie_student,data_admis)
values(1002,'Mihai','Irina',to_date('11-12-1999','dd-mm-yyyy'),902,'buget',9.98,to_date('31-07-2020','dd-mm-yyyy'));
insert into studenti(student_id,nume_student,prenume_student,data_nastere,grupa_id,forma_invatamant,medie_student,data_admis)
values(1002,'Begu','Maria',to_date('08-12-2001','dd-mm-yyyy'),903,'taxa',7.80,to_date('30-07-2020','dd-mm-yyyy'));
insert into studenti(student_id,nume_student,prenume_student,data_nastere,grupa_id,forma_invatamant,medie_student,data_admis)
values(1003,'Bratu','Vlad',to_date('03-01-2002','dd-mm-yyyy'),907,'buget',9.02,to_date('30-07-2020','dd-mm-yyyy'));
insert into studenti(student_id,nume_student,prenume_student,data_nastere,grupa_id,forma_invatamant,medie_student,data_admis)
values(1004,'Andries','Alexanda',to_date('08-04-2001','dd-mm-yyyy'),906,'buget',8.68,to_date('14-09-2019','dd-mm-yyyy'));
insert into studenti(student_id,nume_student,prenume_student,data_nastere,grupa_id,forma_invatamant,medie_student,data_admis)
values(1005,'Almas','Alexandru',to_date('08-07-2000','dd-mm-yyyy'),906,'taxa',6.12,to_date('29-07-2019','dd-mm-yyyy'));
insert into studenti(student_id,nume_student,prenume_student,data_nastere,grupa_id,forma_invatamant,medie_student,data_admis)
values(1006,'Panaite','Aurelian',to_date('09-09-1999','dd-mm-yyyy'),908,'buget',9.71,to_date('31-07-2018','dd-mm-yyyy'));


--ex.13

create sequence sec_firme
start with 2000;

create sequence sec_firme
start with 2000;

insert into Firme_partenere(firma_id, nume_firma,grad_de_intelegere,facultate_id)
values( sec_firme.NEXTVAL ,'Bitdefender',80,1);
insert into Firme_partenere(firma_id, nume_firma,grad_de_intelegere,facultate_id)
values( sec_firme.nextval ,'Gradina Botanica',97.56,2);
insert into Firme_partenere(firma_id, nume_firma,grad_de_intelegere,facultate_id)
values( sec_firme.nextval ,'Monitorul oficial',54,3);
insert into Firme_partenere(firma_id, nume_firma,grad_de_intelegere,facultate_id)
values( sec_firme.nextval,'Thales',91.14,4);
insert into Firme_partenere(firma_id, nume_firma,grad_de_intelegere,facultate_id)
values(sec_firme.nextval,'Carturesti',67.18,5);

create sequence sec_asoc
increment by 100
start with 3000;
 insert into asociatii_studentesti(asociatie_id,nume_asociatie,nume_reprezentant,facultate_id)
 values(sec_asoc.nextval ,'ASMI','Grigorescu',1);
  insert into asociatii_studentesti(asociatie_id,nume_asociatie,nume_reprezentant,facultate_id)
 values( sec_asoc.nextval ,'ASB','Petrache',2);
  insert into asociatii_studentesti(asociatie_id,nume_asociatie,nume_reprezentant,facultate_id)
 values(sec_asoc.nextval ,'ASJ','Teodor',3);
  insert into asociatii_studentesti(asociatie_id,nume_asociatie,nume_reprezentant,facultate_id)
 values(sec_asoc.nextval,'ASLS','Minodora',4);
  insert into asociatii_studentesti(asociatie_id,nume_asociatie,nume_reprezentant,facultate_id)
 values(sec_asoc.nextval,'ASF','Paulescu',5);


