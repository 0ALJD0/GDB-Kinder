/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     1/23/2022 4:42:18 PM                         */
/*==============================================================*/

/*
drop index PERTENECE_FK;

drop index ACTIVIDAD_PK;

drop table ACTIVIDAD;

drop index ALERGIAS_PK;

drop table ALERGIAS;

drop index ANO_LECTIVO_PK;

drop table ANO_LECTIVO;

drop index EMPLEA_FK;

drop index EMPLEA2_FK;

drop index EMPLEA_PK;

drop table EMPLEA;

drop index POSEE_FK;

drop index ESTADO_SALUD_PK;

drop table ESTADO_SALUD;

drop index GENERO_PK;

drop table GENERO;

drop index MATERIAL_PK;

drop table MATERIAL;

drop index RELATIONSHIP_30_FK;

drop index RELATIONSHIP_24_FK;

drop index MATRICULA_PK;

drop table MATRICULA;

drop index MEDICAMENTO_PK;

drop table MEDICAMENTO;

drop index NACIONALIDAD_PK;

drop table NACIONALIDAD;

drop index PRESENTA_UNA_FK;

drop index PRESENTAN_UNA_FK;

drop index POSEE_UN_GENERO_FK;

drop index TIENEN_NACIONALIDAD_FK;

drop index NINIO_PK;

drop table NINIO;

drop index POSEE_UNA_NACIONALIDAD___FK;

drop index POSEE_UN_GENERO___FK;

drop index PADRE_PK;

drop table PADRE;

drop index TIENE_MACIONALIDAD_FK;

drop index POSEE_UN_GENEROO_FK;

drop index PROPONE_FK;

drop index PROFESIONAL_PK;

drop table PROFESIONAL;

drop index RELATIONSHIP_29_FK;

drop index PROGRAMA_PK;

drop table PROGRAMA;

drop index RELACION_PK;

drop table RELACION;

drop index RELATIONSHIP_15_FK;

drop index RELATIONSHIP_16_FK;

drop index RELATIONSHIP_15_PK;

drop table RELATIONSHIP_15;

drop index RELATIONSHIP_31_FK;

drop index RELATIONSHIP_23_FK;

drop index RELATIONSHIP_21_FK;

drop index RENDIMIENTO_PK;

drop table RENDIMIENTO;

drop index SALUD_ALERGIAS_RELATION_FK;

drop index SALUD_ALERGIAS_RELATION2_FK;

drop index SALUD_ALERGIAS_RELATION_PK;

drop table SALUD_ALERGIAS_RELATION;

drop index SALUD_MEDICAMENT_RELATION_FK;

drop index SALUD_MEDICAMENT_RELATION2_FK;

drop index SALUD_MEDICAMENT_RELATION_PK;

drop table SALUD_MEDICAMENT_RELATION;

drop index TALLA_VESTIMENTA_PK;

drop table TALLA_VESTIMENTA;

drop index TALLA_ZAPATO_PK;

drop table TALLA_ZAPATO;

drop index TIPO_RENDIMIENTO_PK;

drop table TIPO_RENDIMIENTO;

drop index MANTIENE_UNA_RELACION_DE_FK;

drop index POSEE_UN_GENERO__FK;

drop index TIENEN_NACIONALIDAD__FK;

drop index TUTOR_PK;

drop table TUTOR;

drop index TUTORES_NINIOS_RELATION_FK;

drop index TUTORES_NINIOS_RELATION2_FK;

drop index TUTORES_NINIOS_RELATION_PK;

drop table TUTORES_NINIOS_RELATION;*/

/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
create table ACTIVIDAD (
   ID_ACTIVIDAD         SERIAL               not null,
   ID_PROGRAMA          INT4                 not null,
   NOMBRE_AVTIVI        VARCHAR(60)          not null,
   DESCRIPCION_ACTIVI   TEXT                 not null,
   DURACION_ACTIVI      INT4                 not null,
   FINALIZADO           BOOL                 not null,
   constraint PK_ACTIVIDAD primary key (ID_ACTIVIDAD)
);

/*==============================================================*/
/* Index: ACTIVIDAD_PK                                          */
/*==============================================================*/
create unique index ACTIVIDAD_PK on ACTIVIDAD (
ID_ACTIVIDAD
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create  index PERTENECE_FK on ACTIVIDAD (
ID_PROGRAMA
);

/*==============================================================*/
/* Table: ALERGIAS                                              */
/*==============================================================*/
create table ALERGIAS (
   ID_ALERGIA           SERIAL               not null,
   NOMBRE_ALERGIA       VARCHAR(30)          not null,
   constraint PK_ALERGIAS primary key (ID_ALERGIA)
);

/*==============================================================*/
/* Index: ALERGIAS_PK                                           */
/*==============================================================*/
create unique index ALERGIAS_PK on ALERGIAS (
ID_ALERGIA
);

/*==============================================================*/
/* Table: ANO_LECTIVO                                           */
/*==============================================================*/
create table ANO_LECTIVO (
   ID_ANO_LECTIVO       SERIAL               not null,
   ANO                  VARCHAR(4)           not null,
   constraint PK_ANO_LECTIVO primary key (ID_ANO_LECTIVO)
);

/*==============================================================*/
/* Index: ANO_LECTIVO_PK                                        */
/*==============================================================*/
create unique index ANO_LECTIVO_PK on ANO_LECTIVO (
ID_ANO_LECTIVO
);

/*==============================================================*/
/* Table: EMPLEA                                                */
/*==============================================================*/
create table EMPLEA (
   ID_MATERIAL          INT4                 not null,
   ID_ACTIVIDAD         INT4                 not null,
   constraint PK_EMPLEA primary key (ID_MATERIAL, ID_ACTIVIDAD)
);

/*==============================================================*/
/* Index: EMPLEA_PK                                             */
/*==============================================================*/
create unique index EMPLEA_PK on EMPLEA (
ID_MATERIAL,
ID_ACTIVIDAD
);

/*==============================================================*/
/* Index: EMPLEA2_FK                                            */
/*==============================================================*/
create  index EMPLEA2_FK on EMPLEA (
ID_ACTIVIDAD
);

/*==============================================================*/
/* Index: EMPLEA_FK                                             */
/*==============================================================*/
create  index EMPLEA_FK on EMPLEA (
ID_MATERIAL
);

/*==============================================================*/
/* Table: ESTADO_SALUD                                          */
/*==============================================================*/
create table ESTADO_SALUD (
   ID_SALUD_STAT        SERIAL               not null,
   ID_NINIO             INT4                 not null,
   ULTIMA_FECHA_ENFERMO DATE                 not null,
   DIAGNOSTICO          TEXT                 null,
   DOCTOR_TRATANTE      VARCHAR(60)          null,
   constraint PK_ESTADO_SALUD primary key (ID_SALUD_STAT)
);

/*==============================================================*/
/* Index: ESTADO_SALUD_PK                                       */
/*==============================================================*/
create unique index ESTADO_SALUD_PK on ESTADO_SALUD (
ID_SALUD_STAT
);

/*==============================================================*/
/* Index: POSEE_FK                                              */
/*==============================================================*/
create  index POSEE_FK on ESTADO_SALUD (
ID_NINIO
);

/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
create table GENERO (
   ID_GENERO            SERIAL               not null,
   NOMBRE_GENERO        VARCHAR(30)          not null,
   constraint PK_GENERO primary key (ID_GENERO)
);

/*==============================================================*/
/* Index: GENERO_PK                                             */
/*==============================================================*/
create unique index GENERO_PK on GENERO (
ID_GENERO
);

/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
create table MATERIAL (
   ID_MATERIAL          SERIAL               not null,
   NOMBRE_MATERIAL      VARCHAR(30)          null,
   constraint PK_MATERIAL primary key (ID_MATERIAL)
);

/*==============================================================*/
/* Index: MATERIAL_PK                                           */
/*==============================================================*/
create unique index MATERIAL_PK on MATERIAL (
ID_MATERIAL
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
create table MATRICULA (
   ID_MATRICULA         SERIAL               not null,
   ID_NINIO             INT4                 not null,
   ID_ANO_LECTIVO       INT4                 not null,
   PRECIO_MATRICULA     INT4                 not null,
   constraint PK_MATRICULA primary key (ID_MATRICULA)
);

/*==============================================================*/
/* Index: MATRICULA_PK                                          */
/*==============================================================*/
create unique index MATRICULA_PK on MATRICULA (
ID_MATRICULA
);

/*==============================================================*/
/* Index: RELATIONSHIP_24_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_24_FK on MATRICULA (
ID_NINIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_30_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_30_FK on MATRICULA (
ID_ANO_LECTIVO
);

/*==============================================================*/
/* Table: MEDICAMENTO                                           */
/*==============================================================*/
create table MEDICAMENTO (
   ID_MEDICAMENTO       SERIAL               not null,
   NOMBRE_MEDICAMENTO   VARCHAR(30)          not null,
   DESCRIPTION_MEDICAMENTO TEXT                 not null,
   constraint PK_MEDICAMENTO primary key (ID_MEDICAMENTO)
);

/*==============================================================*/
/* Index: MEDICAMENTO_PK                                        */
/*==============================================================*/
create unique index MEDICAMENTO_PK on MEDICAMENTO (
ID_MEDICAMENTO
);

/*==============================================================*/
/* Table: NACIONALIDAD                                          */
/*==============================================================*/
create table NACIONALIDAD (
   ID_NACIONALIDAD      SERIAL               not null,
   NOMBRE_NACIONALIDAD  VARCHAR(30)          not null,
   constraint PK_NACIONALIDAD primary key (ID_NACIONALIDAD)
);

/*==============================================================*/
/* Index: NACIONALIDAD_PK                                       */
/*==============================================================*/
create unique index NACIONALIDAD_PK on NACIONALIDAD (
ID_NACIONALIDAD
);

/*==============================================================*/
/* Table: NINIO                                                 */
/*==============================================================*/
create table NINIO (
   ID_NINIO             SERIAL               not null,
   ID_NACIONALIDAD      INT4                 not null,
   ID_GENERO            INT4                 not null,
   ID_TALLA_ZAPATO      INT4                 not null,
   ID_TALLA_VESTIMENTA  INT4                 not null,
   CI_NINIO             VARCHAR(10)          not null,
   NOMBRE_NINIO         VARCHAR(30)          not null,
   APELLIDO_NINIO       VARCHAR(30)          not null,
   NACIMIENTO_DATE      DATE                 not null,
   ESTADO_MATRICULA     BOOL                 not null,
   constraint PK_NINIO primary key (ID_NINIO)
);

/*==============================================================*/
/* Index: NINIO_PK                                              */
/*==============================================================*/
create unique index NINIO_PK on NINIO (
ID_NINIO
);

/*==============================================================*/
/* Index: TIENEN_NACIONALIDAD_FK                                */
/*==============================================================*/
create  index TIENEN_NACIONALIDAD_FK on NINIO (
ID_NACIONALIDAD
);

/*==============================================================*/
/* Index: POSEE_UN_GENERO_FK                                    */
/*==============================================================*/
create  index POSEE_UN_GENERO_FK on NINIO (
ID_GENERO
);

/*==============================================================*/
/* Index: PRESENTAN_UNA_FK                                      */
/*==============================================================*/
create  index PRESENTAN_UNA_FK on NINIO (
ID_TALLA_ZAPATO
);

/*==============================================================*/
/* Index: PRESENTA_UNA_FK                                       */
/*==============================================================*/
create  index PRESENTA_UNA_FK on NINIO (
ID_TALLA_VESTIMENTA
);

/*==============================================================*/
/* Table: PADRE                                                 */
/*==============================================================*/
create table PADRE (
   ID_PADRE             SERIAL               not null,
   ID_GENERO            INT4                 not null,
   ID_NACIONALIDAD      INT4                 not null,
   NOMBRE_PADRE         VARCHAR(30)          not null,
   APELLIDO_PADRE       VARCHAR(30)          not null,
   CI_PADRE             VARCHAR(10)          not null,
   DIRECCION_PADRE      VARCHAR(30)          not null,
   TELEFONO_PADRE       VARCHAR(10)          not null,
   DOMICILIO_PADRE      VARCHAR(30)          not null,
   constraint PK_PADRE primary key (ID_PADRE)
);

/*==============================================================*/
/* Index: PADRE_PK                                              */
/*==============================================================*/
create unique index PADRE_PK on PADRE (
ID_PADRE
);

/*==============================================================*/
/* Index: POSEE_UN_GENERO___FK                                  */
/*==============================================================*/
create  index POSEE_UN_GENERO___FK on PADRE (
ID_GENERO
);

/*==============================================================*/
/* Index: POSEE_UNA_NACIONALIDAD___FK                           */
/*==============================================================*/
create  index POSEE_UNA_NACIONALIDAD___FK on PADRE (
ID_NACIONALIDAD
);

/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
create table PROFESIONAL (
   ID_PROF              SERIAL               not null,
   ID_ACTIVIDAD         INT4                 not null,
   ID_GENERO            INT4                 not null,
   ID_NACIONALIDAD      INT4                 not null,
   NOMBRES_PROF         VARCHAR(30)          not null,
   APELLIDOS_PROF       VARCHAR(30)          not null,
   CI_PROF              VARCHAR(10)          not null,
   DIRECCION_PROF       VARCHAR(60)          not null,
   TELEFONO_PROF        VARCHAR(10)          not null,
   NO_CERTIFI_SENECYT   CHAR(15)             not null,
   constraint PK_PROFESIONAL primary key (ID_PROF)
);

/*==============================================================*/
/* Index: PROFESIONAL_PK                                        */
/*==============================================================*/
create unique index PROFESIONAL_PK on PROFESIONAL (
ID_PROF
);

/*==============================================================*/
/* Index: PROPONE_FK                                            */
/*==============================================================*/
create  index PROPONE_FK on PROFESIONAL (
ID_ACTIVIDAD
);

/*==============================================================*/
/* Index: POSEE_UN_GENEROO_FK                                   */
/*==============================================================*/
create  index POSEE_UN_GENEROO_FK on PROFESIONAL (
ID_GENERO
);

/*==============================================================*/
/* Index: TIENE_MACIONALIDAD_FK                                 */
/*==============================================================*/
create  index TIENE_MACIONALIDAD_FK on PROFESIONAL (
ID_NACIONALIDAD
);

/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
create table PROGRAMA (
   ID_PROGRAMA          SERIAL               not null,
   ID_ANO_LECTIVO       INT4                 not null,
   NOMBRE_PROGRAMA      VARCHAR(60)          not null,
   constraint PK_PROGRAMA primary key (ID_PROGRAMA)
);

/*==============================================================*/
/* Index: PROGRAMA_PK                                           */
/*==============================================================*/
create unique index PROGRAMA_PK on PROGRAMA (
ID_PROGRAMA
);

/*==============================================================*/
/* Index: RELATIONSHIP_29_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_29_FK on PROGRAMA (
ID_ANO_LECTIVO
);

/*==============================================================*/
/* Table: RELACION                                              */
/*==============================================================*/
create table RELACION (
   ID_PARENTESCO        SERIAL               not null,
   NOMBRE_PARENTESCO    VARCHAR(30)          not null,
   constraint PK_RELACION primary key (ID_PARENTESCO)
);

/*==============================================================*/
/* Index: RELACION_PK                                           */
/*==============================================================*/
create unique index RELACION_PK on RELACION (
ID_PARENTESCO
);

/*==============================================================*/
/* Table: RELATIONSHIP_15                                       */
/*==============================================================*/
create table RELATIONSHIP_15 (
   ID_PADRE             INT4                 not null,
   ID_NINIO             INT4                 not null,
   constraint PK_RELATIONSHIP_15 primary key (ID_PADRE, ID_NINIO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_PK                                    */
/*==============================================================*/
create unique index RELATIONSHIP_15_PK on RELATIONSHIP_15 (
ID_PADRE,
ID_NINIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on RELATIONSHIP_15 (
ID_NINIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on RELATIONSHIP_15 (
ID_PADRE
);

/*==============================================================*/
/* Table: RENDIMIENTO                                           */
/*==============================================================*/
create table RENDIMIENTO (
   ID_RENDIMIENTO       SERIAL               not null,
   ID_ACTIVIDAD         INT4                 not null,
   ID_TIPO_RENDIMIENT   INT4                 not null,
   ID_NINIO             INT4                 not null,
   OBSERVACIONES        TEXT                 not null,
   constraint PK_RENDIMIENTO primary key (ID_RENDIMIENTO)
);

/*==============================================================*/
/* Index: RENDIMIENTO_PK                                        */
/*==============================================================*/
create unique index RENDIMIENTO_PK on RENDIMIENTO (
ID_RENDIMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_21_FK on RENDIMIENTO (
ID_ACTIVIDAD
);

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_23_FK on RENDIMIENTO (
ID_TIPO_RENDIMIENT
);

/*==============================================================*/
/* Index: RELATIONSHIP_31_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_31_FK on RENDIMIENTO (
ID_NINIO
);

/*==============================================================*/
/* Table: SALUD_ALERGIAS_RELATION                               */
/*==============================================================*/
create table SALUD_ALERGIAS_RELATION (
   ID_ALERGIA           INT4                 not null,
   ID_SALUD_STAT        INT4                 not null,
   constraint PK_SALUD_ALERGIAS_RELATION primary key (ID_ALERGIA, ID_SALUD_STAT)
);

/*==============================================================*/
/* Index: SALUD_ALERGIAS_RELATION_PK                            */
/*==============================================================*/
create unique index SALUD_ALERGIAS_RELATION_PK on SALUD_ALERGIAS_RELATION (
ID_ALERGIA,
ID_SALUD_STAT
);

/*==============================================================*/
/* Index: SALUD_ALERGIAS_RELATION2_FK                           */
/*==============================================================*/
create  index SALUD_ALERGIAS_RELATION2_FK on SALUD_ALERGIAS_RELATION (
ID_SALUD_STAT
);

/*==============================================================*/
/* Index: SALUD_ALERGIAS_RELATION_FK                            */
/*==============================================================*/
create  index SALUD_ALERGIAS_RELATION_FK on SALUD_ALERGIAS_RELATION (
ID_ALERGIA
);

/*==============================================================*/
/* Table: SALUD_MEDICAMENT_RELATION                             */
/*==============================================================*/
create table SALUD_MEDICAMENT_RELATION (
   ID_MEDICAMENTO       INT4                 not null,
   ID_SALUD_STAT        INT4                 not null,
   constraint PK_SALUD_MEDICAMENT_RELATION primary key (ID_MEDICAMENTO, ID_SALUD_STAT)
);

/*==============================================================*/
/* Index: SALUD_MEDICAMENT_RELATION_PK                          */
/*==============================================================*/
create unique index SALUD_MEDICAMENT_RELATION_PK on SALUD_MEDICAMENT_RELATION (
ID_MEDICAMENTO,
ID_SALUD_STAT
);

/*==============================================================*/
/* Index: SALUD_MEDICAMENT_RELATION2_FK                         */
/*==============================================================*/
create  index SALUD_MEDICAMENT_RELATION2_FK on SALUD_MEDICAMENT_RELATION (
ID_SALUD_STAT
);

/*==============================================================*/
/* Index: SALUD_MEDICAMENT_RELATION_FK                          */
/*==============================================================*/
create  index SALUD_MEDICAMENT_RELATION_FK on SALUD_MEDICAMENT_RELATION (
ID_MEDICAMENTO
);

/*==============================================================*/
/* Table: TALLA_VESTIMENTA                                      */
/*==============================================================*/
create table TALLA_VESTIMENTA (
   ID_TALLA_VESTIMENTA  SERIAL               not null,
   NUMERO_TALLA         DECIMAL(4)           not null,
   constraint PK_TALLA_VESTIMENTA primary key (ID_TALLA_VESTIMENTA)
);

/*==============================================================*/
/* Index: TALLA_VESTIMENTA_PK                                   */
/*==============================================================*/
create unique index TALLA_VESTIMENTA_PK on TALLA_VESTIMENTA (
ID_TALLA_VESTIMENTA
);

/*==============================================================*/
/* Table: TALLA_ZAPATO                                          */
/*==============================================================*/
create table TALLA_ZAPATO (
   ID_TALLA_ZAPATO      SERIAL               not null,
   NUMERO_TALLA         DECIMAL(4)           not null,
   constraint PK_TALLA_ZAPATO primary key (ID_TALLA_ZAPATO)
);

/*==============================================================*/
/* Index: TALLA_ZAPATO_PK                                       */
/*==============================================================*/
create unique index TALLA_ZAPATO_PK on TALLA_ZAPATO (
ID_TALLA_ZAPATO
);

/*==============================================================*/
/* Table: TIPO_RENDIMIENTO                                      */
/*==============================================================*/
create table TIPO_RENDIMIENTO (
   ID_TIPO_RENDIMIENT   SERIAL               not null,
   NOMBRE_RENDIMIENT    VARCHAR(20)          not null,
   constraint PK_TIPO_RENDIMIENTO primary key (ID_TIPO_RENDIMIENT)
);

/*==============================================================*/
/* Index: TIPO_RENDIMIENTO_PK                                   */
/*==============================================================*/
create unique index TIPO_RENDIMIENTO_PK on TIPO_RENDIMIENTO (
ID_TIPO_RENDIMIENT
);

/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
create table TUTOR (
   ID_TUTOR             SERIAL               not null,
   ID_NACIONALIDAD      INT4                 not null,
   ID_GENERO            INT4                 not null,
   ID_PARENTESCO        INT4                 not null,
   NOMBRE_TUTOR         VARCHAR(30)          not null,
   APELLIDO_TUTOR       VARCHAR(30)          not null,
   CI_TUTOR             VARCHAR(10)          not null,
   DIRECCION_TUTOR      VARCHAR(30)          not null,
   TELEFONO_TUTOR       VARCHAR(10)          not null,
   DOMICILIO_TUTOR      VARCHAR(30)          not null,
   MOTIVO               TEXT                 null,
   constraint PK_TUTOR primary key (ID_TUTOR)
);

/*==============================================================*/
/* Index: TUTOR_PK                                              */
/*==============================================================*/
create unique index TUTOR_PK on TUTOR (
ID_TUTOR
);

/*==============================================================*/
/* Index: TIENEN_NACIONALIDAD__FK                               */
/*==============================================================*/
create  index TIENEN_NACIONALIDAD__FK on TUTOR (
ID_NACIONALIDAD
);

/*==============================================================*/
/* Index: POSEE_UN_GENERO__FK                                   */
/*==============================================================*/
create  index POSEE_UN_GENERO__FK on TUTOR (
ID_GENERO
);

/*==============================================================*/
/* Index: MANTIENE_UNA_RELACION_DE_FK                           */
/*==============================================================*/
create  index MANTIENE_UNA_RELACION_DE_FK on TUTOR (
ID_PARENTESCO
);

/*==============================================================*/
/* Table: TUTORES_NINIOS_RELATION                               */
/*==============================================================*/
create table TUTORES_NINIOS_RELATION (
   ID_NINIO             INT4                 not null,
   ID_TUTOR             INT4                 not null,
   constraint PK_TUTORES_NINIOS_RELATION primary key (ID_NINIO, ID_TUTOR)
);

/*==============================================================*/
/* Index: TUTORES_NINIOS_RELATION_PK                            */
/*==============================================================*/
create unique index TUTORES_NINIOS_RELATION_PK on TUTORES_NINIOS_RELATION (
ID_NINIO,
ID_TUTOR
);

/*==============================================================*/
/* Index: TUTORES_NINIOS_RELATION2_FK                           */
/*==============================================================*/
create  index TUTORES_NINIOS_RELATION2_FK on TUTORES_NINIOS_RELATION (
ID_TUTOR
);

/*==============================================================*/
/* Index: TUTORES_NINIOS_RELATION_FK                            */
/*==============================================================*/
create  index TUTORES_NINIOS_RELATION_FK on TUTORES_NINIOS_RELATION (
ID_NINIO
);

alter table ACTIVIDAD
   add constraint FK_ACTIVIDA_PERTENECE_PROGRAMA foreign key (ID_PROGRAMA)
      references PROGRAMA (ID_PROGRAMA)
      on delete restrict on update restrict;

alter table EMPLEA
   add constraint FK_EMPLEA_EMPLEA_MATERIAL foreign key (ID_MATERIAL)
      references MATERIAL (ID_MATERIAL)
      on delete restrict on update restrict;

alter table EMPLEA
   add constraint FK_EMPLEA_EMPLEA2_ACTIVIDA foreign key (ID_ACTIVIDAD)
      references ACTIVIDAD (ID_ACTIVIDAD)
      on delete restrict on update restrict;

alter table ESTADO_SALUD
   add constraint FK_ESTADO_S_POSEE_NINIO foreign key (ID_NINIO)
      references NINIO (ID_NINIO)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_NINIO foreign key (ID_NINIO)
      references NINIO (ID_NINIO)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_ANO_LECT foreign key (ID_ANO_LECTIVO)
      references ANO_LECTIVO (ID_ANO_LECTIVO)
      on delete restrict on update restrict;

alter table NINIO
   add constraint FK_NINIO_POSEE_UN__GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO)
      on delete restrict on update restrict;

alter table NINIO
   add constraint FK_NINIO_PRESENTAN_TALLA_ZA foreign key (ID_TALLA_ZAPATO)
      references TALLA_ZAPATO (ID_TALLA_ZAPATO)
      on delete restrict on update restrict;

alter table NINIO
   add constraint FK_NINIO_PRESENTA__TALLA_VE foreign key (ID_TALLA_VESTIMENTA)
      references TALLA_VESTIMENTA (ID_TALLA_VESTIMENTA)
      on delete restrict on update restrict;

alter table NINIO
   add constraint FK_NINIO_TIENEN_NA_NACIONAL foreign key (ID_NACIONALIDAD)
      references NACIONALIDAD (ID_NACIONALIDAD)
      on delete restrict on update restrict;

alter table PADRE
   add constraint FK_PADRE_POSEE_UNA_NACIONAL foreign key (ID_NACIONALIDAD)
      references NACIONALIDAD (ID_NACIONALIDAD)
      on delete restrict on update restrict;

alter table PADRE
   add constraint FK_PADRE_POSEE_UN__GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO)
      on delete restrict on update restrict;

alter table PROFESIONAL
   add constraint FK_PROFESIO_POSEE_UN__GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO)
      on delete restrict on update restrict;

alter table PROFESIONAL
   add constraint FK_PROFESIO_PROPONE_ACTIVIDA foreign key (ID_ACTIVIDAD)
      references ACTIVIDAD (ID_ACTIVIDAD)
      on delete restrict on update restrict;

alter table PROFESIONAL
   add constraint FK_PROFESIO_TIENE_MAC_NACIONAL foreign key (ID_NACIONALIDAD)
      references NACIONALIDAD (ID_NACIONALIDAD)
      on delete restrict on update restrict;

alter table PROGRAMA
   add constraint FK_PROGRAMA_RELATIONS_ANO_LECT foreign key (ID_ANO_LECTIVO)
      references ANO_LECTIVO (ID_ANO_LECTIVO)
      on delete restrict on update restrict;

alter table RELATIONSHIP_15
   add constraint FK_RELATION_RELATIONS_PADRE foreign key (ID_PADRE)
      references PADRE (ID_PADRE)
      on delete restrict on update restrict;

alter table RELATIONSHIP_15
   add constraint FK_RELATION_RELATIONS_NINIO foreign key (ID_NINIO)
      references NINIO (ID_NINIO)
      on delete restrict on update restrict;

alter table RENDIMIENTO
   add constraint FK_RENDIMIE_RELATIONS_ACTIVIDA foreign key (ID_ACTIVIDAD)
      references ACTIVIDAD (ID_ACTIVIDAD)
      on delete restrict on update restrict;

alter table RENDIMIENTO
   add constraint FK_RENDIMIE_RELATIONS_TIPO_REN foreign key (ID_TIPO_RENDIMIENT)
      references TIPO_RENDIMIENTO (ID_TIPO_RENDIMIENT)
      on delete restrict on update restrict;

alter table RENDIMIENTO
   add constraint FK_RENDIMIE_RELATIONS_NINIO foreign key (ID_NINIO)
      references NINIO (ID_NINIO)
      on delete restrict on update restrict;

alter table SALUD_ALERGIAS_RELATION
   add constraint FK_SALUD_AL_SALUD_ALE_ALERGIAS foreign key (ID_ALERGIA)
      references ALERGIAS (ID_ALERGIA)
      on delete restrict on update restrict;

alter table SALUD_ALERGIAS_RELATION
   add constraint FK_SALUD_AL_SALUD_ALE_ESTADO_S foreign key (ID_SALUD_STAT)
      references ESTADO_SALUD (ID_SALUD_STAT)
      on delete restrict on update restrict;

alter table SALUD_MEDICAMENT_RELATION
   add constraint FK_SALUD_ME_SALUD_MED_MEDICAME foreign key (ID_MEDICAMENTO)
      references MEDICAMENTO (ID_MEDICAMENTO)
      on delete restrict on update restrict;

alter table SALUD_MEDICAMENT_RELATION
   add constraint FK_SALUD_ME_SALUD_MED_ESTADO_S foreign key (ID_SALUD_STAT)
      references ESTADO_SALUD (ID_SALUD_STAT)
      on delete restrict on update restrict;

alter table TUTOR
   add constraint FK_TUTOR_MANTIENE__RELACION foreign key (ID_PARENTESCO)
      references RELACION (ID_PARENTESCO)
      on delete restrict on update restrict;

alter table TUTOR
   add constraint FK_TUTOR_POSEE_UN__GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO)
      on delete restrict on update restrict;

alter table TUTOR
   add constraint FK_TUTOR_TIENEN_NA_NACIONAL foreign key (ID_NACIONALIDAD)
      references NACIONALIDAD (ID_NACIONALIDAD)
      on delete restrict on update restrict;

alter table TUTORES_NINIOS_RELATION
   add constraint FK_TUTORES__TUTORES_N_NINIO foreign key (ID_NINIO)
      references NINIO (ID_NINIO)
      on delete restrict on update restrict;

alter table TUTORES_NINIOS_RELATION
   add constraint FK_TUTORES__TUTORES_N_TUTOR foreign key (ID_TUTOR)
      references TUTOR (ID_TUTOR)
      on delete restrict on update restrict;


BEGIN;
--INSERTANDO DATOS DE GENEROS Y NACIONALIDADES--
INSERT INTO GENERO (NOMBRE_GENERO) VALUES ('Masculino'), ('Femenino');
INSERT INTO NACIONALIDAD (NOMBRE_NACIONALIDAD) VALUES ('Peruana'),('Colombiana'),('Ecuatoriana');
--INSERTANDO TALLAS DE VESTIMENTA Y ZAPATO--
INSERT INTO TALLA_VESTIMENTA (NUMERO_TALLA) VALUES (98),(100),(102),(104),(106);
INSERT INTO TALLA_ZAPATO (NUMERO_TALLA) VALUES (20),(22),(24);
--INSERTANDO DATOS EN RELACION--
INSERT INTO RELACION (NOMBRE_PARENTESCO) VALUES ('TÍO/A'), ('ABUELO/A'),('HERMANO/A'),('PRIMO/A'),('PADRINO/A');
--INSERTANDO DATOS EN ALERGIAS Y MEDICAMENTOS--
INSERT INTO ALERGIAS (NOMBRE_ALERGIA) VALUES ('SARPULLIDO'),('INTOLERANCIA A LACTOSA'),('ACAROS DEL POLVO'),('POLEN'),('MOHO'),('MASCOTAS');
INSERT INTO MEDICAMENTO (NOMBRE_MEDICAMENTO,DESCRIPTION_MEDICAMENTO) VALUES ('ACETAMINOFENO','Reducir molestias, dolores, fiebre en niños con resfriados'),
('AMOXICILINA','Medicamento para las infecciones por microrganismos'),('LORATADINA','Tratamiento para la rino conjuntivitis y urticaria crónica');
INSERT INTO ANO_LECTIVO (ANO) VALUES ('2018'),('2019'),('2020'),('2021');
INSERT INTO PROGRAMA (NOMBRE_PROGRAMA,ID_ANO_LECTIVO) VALUES ('Desarrollo intelectual',1),('Desarrollo emocional',1),('Desarrollo motriz',1),
															('Desarrollo intelectual',2),('Desarrollo emocional',2),('Desarrollo motriz',2),
															('Desarrollo intelectual',3),('Desarrollo emocional',3),('Desarrollo motriz',3),
															('Desarrollo intelectual',4),('Desarrollo emocional',4),('Desarrollo motriz',4);
INSERT INTO TIPO_RENDIMIENTO (NOMBRE_RENDIMIENT) VALUES ('REGULAR'),('BUENO'),('EXCELENTE');
INSERT INTO ACTIVIDAD (ID_PROGRAMA,NOMBRE_AVTIVI,DESCRIPCION_ACTIVI,DURACION_ACTIVI,FINALIZADO) VALUES (1,'PREGUNTAS Y RESPUESTAS','EL PROFESOR PROPONDRÁ ALGUNAS PREGUNTAS SENCILLAS PARA QUE LOS NIÑOS LA RESPONDAN Y SE LLEVEN UN PREMIO',1,FALSE),
												(2,'CUENTO','LEER UN CUENTO EN CONJUNTO PARA RECONOCER EMOCIONES Y FOMENTAR EL AMOR A LOS LIBROS',6,FALSE),
												(3,'BAILAR','SE LES DISPONDRÁN A LOS NIÑOS CANCIONES INFANTILES PARA QUE SE EJERCITEN Y DIVIERTAN USANDO MÁSCARAS COLORIDAS',3,FALSE),
												(1,'JUEGO DE MEMORIA','SE COLOCARAN CARTAS CON IMAGENES DE ANIMALES Y LOS NIÑOS BUSCARAN AQUELLAS QUE SEAN IGUALES',2,FALSE),
												(4,'DICCIONARIO EMOCIONES','CONSISTE EN COGER VARIAS FOTOGRAFÍAS CON PERSONAS, NIÑOS O PERSONAJES EXPRESANDO UNA EMOCIÓN Y LOS NIÑOS DEBEN IDENTIFICAR LA EMOCIÓN Y CLASIFICAR LAS IMÁGENES.',2,FALSE),
												(5,'SALTAR LA CUERDA','LOS NIÑOS TENDRÁN A SU DISPOSICIÓN UNA CUERDA CON LAS QUE HARÁN UNA RUTINA DE SALTOS',2,FALSE),
												(6,'VOCALES','PRACTICAR LAS VOCALES, TANTO SU ESCRITURA COMO SU PRONUNCIACION',4,FALSE),
												(4,'MUSICA','SE COLOCARAN MUSICAS DISTINTAS Y SE PREGUNTARA QUE TIPO DE EMOCIONES LES HACE SENTIR ESAS MUSICAS',1,FALSE),
												(7,'ATARSE LOS CORDONES','SE LES ENSEÑARÁ A LOS NIÑOS DIFERENTES NUDOS PARA ATAR SUS ZAPATOS',2,FALSE),
												(8,'LETRAS CON PLASTILINA','LOS NIÑOST ENDRÁN PLASTILINAS CON LAS QUE CREARÁN LAS LETRAS DEL ABECEDARIO',1,FALSE),
												(9,'PINTURA','EN ESTA ACTIVIDAD DEJAREMOS QUE PINTEN LIBREMENTE LAS EMOCIONES QUE SIENTEN',1,FALSE),
												(10,'EQUILIBRIO','SE PARARÁN EN UNA PIERNA Y EL QUE AGUANTE MÁS TIEMPO PODRÁ TOMAR LA COLADA',1,FALSE),
												(11,'NUMEROS','CONTAR LOS NUMEROS DE LO 1 AL 10 PARA SU DESAROLLO  INTELECTUAL',5,FALSE),
												(12,'MIMICA','SE PREPARAN VARIAS TARJETAS Y SE ESCRIBE EN ELLAS DIFERENTES EMOCIONES, LUEGO EL NIÑO COGE UNA TARJETA Y DEBE REPRESENTAR LA EMOCIÓN MÍMICAMENTE.',2,FALSE),
												(10,'CARRETILLA','LOS NIÑOS SE TOMARAN LAS PIERNAS Y ALZARAN HACIENDO FORMA DE CARRETILLA Y HARÁN CARRERAS',1,FALSE);
INSERT INTO MATERIAL (NOMBRE_MATERIAL) VALUES ('CUADERNO'),('LAPIZ'),('BORRADOR'),('ACUARELA'),('PINCEL'),('MANDÍL'),('PARLANTE BLUETOOTH'),('LIBRO'),('TARJETAS'),('PLASTILINA'),('FOTOGRAFÍAS'),('CUERDA PARA SALTAR'),('MÁSCARAS'),('LLEVAR ZAPATOS');
INSERT INTO PROFESIONAL (ID_ACTIVIDAD,ID_GENERO,ID_NACIONALIDAD, NOMBRES_PROF,APELLIDOS_PROF, CI_PROF,DIRECCION_PROF,TELEFONO_PROF,NO_CERTIFI_SENECYT) VALUES
											(1,1,2,'RONNY LAURIANO', 'BARREIRA CARREÑO','1254726531','CALLE 2 Y AV 4','0984563212','VILLA 1'),
											(2,1,3,'LAURIANO CHRISTIAN','CARREÑO MENENDEZ','1456547892','CALLE 3 Y AV 5','0984253618','VILLA 2'),
											(3,2,2,'CLAUDIA EMILIA','SMITH FIGUEROA','1457893214','CALLE 5 Y AV 7','0961982573','VILLA 3'),
											(4,1,1,'PEDRO EMILIO','ARCE PONCE','1458627891','CALLE 4 Y AV 6','0994562137','VILLA 4'),
											(5,2,3,'CYNTHYA RUPERTA','COPIANO DOLORES','1234567890','CALLE 6 Y AV 8','0984561233','VILLA 5'),
											(6,2,1,'RUPERTA CRISTINA','DOLORES COPIANO','1548457893','CALLE 7 Y AV 9','0984562571','VILLA 6'),
											(7,1,2,'CARLOS MANUEL','VILLAGRÁN CORTÉS','1452638795','CALLE 8 Y AV 10','0987453211','VILLA 7'),
											(8,1,3,'RAMÓN GILBERTO','VALDÉZ MONTESDEOCA','1365894753','CALLE 9 Y AV 11','0985623145','VILLA 8'),
											(9,2,1,'CRISTINA MELISSA','AGUILER DARNI','1524896521','CALLE 10 Y AV 12','0921564562','VILLA 9'),
											(10,1,2,'BORIS LEONEL','LOOR BARRETO','1456213759','CALLE 11 Y AV 13','0985243216','VILLA 10'),
											(11,1,1,'MIGUEL ANGEL','POZO VERA','1234756827','CALLE 12 Y AV 14','0987562456','VILLA 11'),
											(12,2,3,'VALENTINA VALERIA','MAYORGA YAMBAE','1425687951','CALLE 13 Y AV 15','0956248723','VILLA 12'),
											(13,2,2,'LUCY MARY','FREEMAN SMITH','1234569510','CALLE 14 Y AV 16','0945213685','VILLA 13'),
											(14,1,2,'CAROLINA JULIETA','MDRANDA VERA','1456328942','CALLE 15 Y AV 17','0986521427','VILLA 14'),
											(15,2,1,'MATILDA LAURA','BARRIGA MEZA','1452368524','CALLE 16 Y AV 18','0985243697','VILLA 15');
											
INSERT INTO EMPLEA (ID_MATERIAL,ID_ACTIVIDAD) VALUES (1,1),(2,1),(3,1),	(8,2),(7,3),(9,4),(11,5),(12,6),(1,7),(2,7),(3,7),(7,8),(14,9),(10,10),(4,11),(5,11),(6,11),(1,13),(2,13),(3,13),(9,14);									

INSERT INTO PADRE (ID_GENERO,ID_NACIONALIDAD,NOMBRE_PADRE,APELLIDO_PADRE,CI_PADRE,DIRECCION_PADRE,TELEFONO_PADRE,DOMICILIO_PADRE) VALUES
												(1,1,'FLORENTINO FERNANDO','CARDENAS BARRE','1234132523','COSTA AZUL','0958746859','VILLA 1'),
												(2,2,'TATIANA MARIA','BARRE CARDENAS','1342132525','LOS ESTEROS','0988646850','VILLA 2'),
												(1,3,'JAIME FERNANDO','DUARTE LOPEZ','1450132527','COSTA AZUL','0918546841','VILLA 3'),
												(2,1,'MONSERRATE ANA','LUCAS DUARTE','1558132529','LOS ESTEROS','0948446832','VILLA 4'),
												(1,2,'PETER DIEGO','LOPEZ ORDOÑEZ','1666132531','LA AURORA','0978346823','VILLA 5'),
												(2,3,'MARIA ANTONIA','ORDOÑEZ FLORES','1774132533','LAS MARIAS','0908246814','VILLA 6'),
												(1,1,'FERNANDO PETER','FLORES CHICA','1882132535','JOCAY','0938146805','VILLA 7'),
												(2,2,'MARIA JOSE','GUERRERO RIVERA','1990132537','LAS CUMBRES','0968046796','VILLA 8'),
												(1,3,'DIEGO HERNANDO','CHICA LOOR','2098132539','15 DE SEPTIEMBRE','0997946787','VILLA 9'),
												(2,1,'MARCELA ANTONIA','CARDONA CARDENAS','2206132541','CORDOVA','0927846778','VILLA 10'),
												(1,2,'MIKEL JAIME','RIVERA DUARTE','2314132543','SAN JUAN','0957746769','VILLA 11'),
												(2,3,'NANA MONSERRATE','PAEZ VERA','2422132545','SAN MATEO','0987646760','VILLA 12'),
												(1,1,'HERNANDO MARIO','MONTIEL PAEZ','2530132547','COSTA AZUL','0917546751','VILLA 13'),
												(2,2,'ROBERTA ANA','ALVARADO CHICA','2638132549','LOS ESTEROS','0947446742','VILLA 14'),
												(1,3,'MARIO PEDRO','LOOR RIVERA','2746132551','ALTAGRACIA','0977346733','VILLA 15'),
												(2,1,'FLORENTINA MARIA','VERA GUERRERO','2854132553','ALTAMIRA','0907246724','VILLA 16'),
												(1,2,'ALEJANDRO BRYAN','PONCE ARCE','2962132555','SAN MATEO','0917546751','VILLA 17'),
												(2,3,'ESTHER LAIDY','PEREZ BECERRA','3070132557','COSTA AZUL','0947446742','VILLA 18'),
												(1,1,'ERICK MATEO','BRIONES NAVARRO','3178132559','LOS ESTEROS','0977346733','VILLA 19'),
												(2,2,'ZARA JUDITH','PAREJO JARA','3286132561','ALTAGRACIA','0907246724','VILLA 20'),
												(1,3,'DANIEL LEO','PAZ MERA','3394132563','ALTAMIRA','0917546751','VILLA 21'),
												(2,1,'MAITÉ ANA','MONTES MARTIN','3502132565','SAN MATEO','0947446742','VILLA 22'),
												(1,2,'DARIO DAVID','MOREIRA SILVA','3610132567','COSTA AZUL','0977346733','VILLA 23'),
												(2,3,'VANESA ALARCÍ','MARTINEZ MOREIRA','3718132569','LOS ESTEROS','0907246724','VILLA 24');

INSERT INTO NINIO (ID_NACIONALIDAD,ID_GENERO,ID_TALLA_ZAPATO,ID_TALLA_VESTIMENTA,CI_NINIO,NOMBRE_NINIO,APELLIDO_NINIO,NACIMIENTO_DATE,ESTADO_MATRICULA) VALUES
												(1,1,1,1,'1301234537','ALEXIS LENIN','CARDENAS GALLEGO','2015-01-06',FALSE),
												(1,2,2,2,'1301324538','EMILIA MARIA','BARRE SIERRA','2015-01-07',FALSE),
												(1,1,3,3,'1301414539','IAN BRYAN','DUARTE MARQUEZ','2015-01-08',FALSE),
												(1,2,1,4,'1301504540','ISABEL ZOE','LUCAS MERCHAN','2014-01-09',FALSE),
												(1,1,2,5,'1301594541','MIGUEL ANGEL','LOPEZ PERELLO','2014-01-10',FALSE),
												(1,2,3,1,'1301684542','DIANA ANDREA','ORDOÑEZ PORTUGAS','2014-01-11',FALSE),
												(1,1,1,2,'1301774543','NOAH DANIEL','FLORES BELMONTE','2016-01-12',FALSE),
												(1,2,2,3,'1301864544','GALDYS DANIELA','GUERRERO COBOS','2016-01-13',FALSE),
												(1,1,3,4,'1301954545','TEODORO LEONEL','CHICA CASTILLA','2016-01-14',FALSE),
												(1,2,1,5,'1302044546','MARIA INES','CARDONA OLIVARES','2015-01-15',FALSE),
												(1,1,2,1,'1302134547','GREGORIO ARIEL','RIVERA NARVAEZ','2015-01-16',FALSE),
												(1,2,3,2,'1302224548','AVELINA MISHEL','PAEZ OLIVIERA','2015-01-17',FALSE),
												(1,1,1,3,'1302314549','ENRIC JUAN','MONTIEL JARA','2017-01-18',FALSE),
												(1,2,2,4,'1302404550','RAMONA SOFIA','ALVARADO BARROS','2017-01-19',FALSE),
												(1,1,3,5,'1302494551','POL MARIO','LOOR GALVAN','2017-01-20',FALSE),
												(1,2,1,1,'1302584552','PALOMA JOHANA','VERA CAMACHO','2016-01-21',FALSE),
												(1,1,2,2,'1302674553','OMAR ZEUS','PONCE SILVESTRE','2016-01-22',FALSE),
												(1,2,3,3,'1302764554','AIMAR ROSMARY','PEREZ CHEN','2016-01-23',FALSE),
												(1,1,1,4,'1302854555','ALEXANDER DAVID','BRIONES PAREJA','2018-01-24',FALSE),
												(1,2,2,5,'1302944556','DAMARIS CARLA','PAREJO PEÑARRIETA','2018-01-25',FALSE),
												(1,1,3,1,'1303034557','MAXIMO DORIAN','PAZ MARTIN','2018-01-26',FALSE),
												(1,2,1,2,'1303124558','ASCENSION AZUCENA','MONTES NOVOA','2017-01-27',FALSE),
												(1,1,2,3,'1303214559','ABRHAM JOSE','MOREIRA MALDONADO','2017-01-28',FALSE),
												(1,2,3,4,'1303304560','SOFIA SHEILA','MARTINEZ FONSECA','2017-01-29',FALSE);
INSERT INTO ESTADO_SALUD (ID_NINIO, ULTIMA_FECHA_ENFERMO,DIAGNOSTICO,DOCTOR_TRATANTE) VALUES 
												(1,'2018-01-02','EL NIÑO PRESENTABA SINTOMAS DEUNA FUERTE ALERGÍA','DR. MARCELO MILÁN'),
												(2,'2018-01-03','LA NIÑA PRESENTABA SINTOMAS DEUNA FUERTE ALERGÍA','DR. MARCELO MILÁN'),
												(3,'2018-01-04','EL NIÑO PRESENTABA SINTOMAS DEUNA FUERTE ALERGÍA','DR. MARCELO MILÁN'),
												(4,'2018-01-01','LA NIÑA PRESENTABA SINTOMAS DEUNA FUERTE ALERGÍA','DR. MARCELO MILÁN'),
												(5,'2018-01-05','EL NIÑO PRESENTABA SINTOMAS DEUNA FUERTE ALERGÍA','DR. MARCELO MILÁN'),
												(6,'2018-01-06','LA NIÑA PRESENTABA SINTOMAS DEUNA FUERTE ALERGÍA','DR. MARCELO MILÁN'),
												(7,'2017-02-23','EL NIÑO HA ESTADO CON FUERTE FIEBRE DEBIDO A SU ALERGÍA AL POLÉN','DR. MEDARDO SILVA'),
												(8,'2017-02-24','LA NIÑA HA ESTADO CON FUERTE FIEBRE DEBIDO A SU ALERGÍA AL POLÉN','DR. MEDARDO SILVA'),
												(9,'2017-02-25','EL NIÑO HA ESTADO CON FUERTE FIEBRE DEBIDO A SU ALERGÍA AL POLÉN','DR. MEDARDO SILVA'),
												(10,'2017-02-22','LA NIÑA HA ESTADO CON FUERTE FIEBRE DEBIDO A SU ALERGÍA AL POLÉN','DR. MEDARDO SILVA'),
												(11,'2017-02-26','EL NIÑO HA ESTADO CON FUERTE FIEBRE DEBIDO A SU ALERGÍA AL POLÉN','DR. MEDARDO SILVA'),
												(12,'2017-02-27','LA NIÑA HA ESTADO CON FUERTE FIEBRE DEBIDO A SU ALERGÍA AL POLÉN','DR. MEDARDO SILVA'),
												(13,'2018-05-06','EL NIÑO SUFRIÓ DE UN RECIENTE SALPULLIDO DEBIDO A SU ALERGÍA AL CALOR','DR. WILLIAM GUILLERM'),
												(14,'2018-05-07','LA NIÑA SUFRIÓ DE UN RECIENTE SALPULLIDO DEBIDO A SU ALERGÍA AL CALOR','DR. WILLIAM GUILLERM'),
												(15,'2018-05-08','EL NIÑO SUFRIÓ DE UN RECIENTE SALPULLIDO DEBIDO A SU ALERGÍA AL CALOR','DR. WILLIAM GUILLERM'),
												(16,'2018-05-05','LA NIÑA SUFRIÓ DE UN RECIENTE SALPULLIDO DEBIDO A SU ALERGÍA AL CALOR','DR. WILLIAM GUILLERM'),
												(17,'2018-05-09','EL NIÑO SUFRIÓ DE UN RECIENTE SALPULLIDO DEBIDO A SU ALERGÍA AL CALOR','DR. WILLIAM GUILLERM'),
												(18,'2018-05-10','LA NIÑA SUFRIÓ DE UN RECIENTE SALPULLIDO DEBIDO A SU ALERGÍA AL CALOR','DR. WILLIAM GUILLERM'),
												(19,'2020-06-01','EL BEBÉ SE ENCUENTRA  BIEN PERO PODRÍA ENPEORAR','DR.PEDRO  PICAPIEDRA'),
												(20,'2020-06-03','LA BEBÉ SE ENCUENTRA  BIEN PERO PODRÍA ENPEORAR','DR.PEDRO  PICAPIEDRA'),
												(21,'2020-06-04','EL BEBÉ SE ENCUENTRA  BIEN PERO PODRÍA ENPEORAR','DR.PEDRO  PICAPIEDRA'),
												(22,'2020-06-05','LA BEBÉ SE ENCUENTRA  BIEN PERO PODRÍA ENPEORAR','DR.PEDRO  PICAPIEDRA'),
												(23,'2020-06-06','EL BEBÉ SE ENCUENTRA  BIEN PERO PODRÍA ENPEORAR','DR.PEDRO  PICAPIEDRA'),
												(24,'2020-06-07','LA BEBÉ SE ENCUENTRA  BIEN PERO PODRÍA ENPEORAR','DR.PEDRO  PICAPIEDRA');
INSERT INTO SALUD_ALERGIAS_RELATION (ID_ALERGIA,ID_SALUD_STAT) VALUES
									(1,1),(2,2),(1,2),(3,3),(4,4),(5,5),(6,6),(1,7),(2,8),(3,8),(3,9),(4,10),(5,11),
									(6,12),(1,13),(2,14),(4,14),(3,15),(4,16),(5,17),(6,18),(1,19),(2,20),(6,20),(3,21),
									(4,22),(5,23),(6,24);
INSERT INTO SALUD_MEDICAMENT_RELATION (ID_MEDICAMENTO,ID_SALUD_STAT) VALUES
									(1,1),(2,2),(3,3),(1,3),(1,4),(2,5),(3,6),(1,7),(2,8),(3,9),(1,10),(2,11),(3,12),
									(1,13),(2,14),(1,14),(3,15),(1,16),(2,17),(3,17),(3,18),(1,19),(2,20),(3,20),(3,21),
									(1,22),(2,23),(3,24);
INSERT INTO TUTOR (ID_GENERO,ID_NACIONALIDAD,ID_PARENTESCO,NOMBRE_TUTOR,APELLIDO_TUTOR,CI_TUTOR,DIRECCION_TUTOR,TELEFONO_TUTOR,DOMICILIO_TUTOR,MOTIVO) VALUES
												(1,1,1,'FERNANDO FLORENTINO','CARDENAS BARRE','1234132523','COSTA AZUL','0958746859','VILLA 1','LOS PADRES POR TRABAJO NO PUEDEN ESTARCON EL NIÑO'),
												(2,2,2,'MARIA TATIANA','BARRE CARDENAS','1342132525','LOS ESTEROS','0988646850','VILLA 2','NO POSEE PADRE Y SU MADRE ESTÁ EN UN MANICOMIO'),
												(1,3,3,'FERNANDO JAIME','DUARTE LOPEZ','1450132527','COSTA AZUL','0918546841','VILLA 3','SUS PADRES SE LO DEJARON ENCARGADO, Y SE FUERON A OTRO PAÍS POR TRABAJO'),
												(2,1,4,'ANA MONSERRATE','LUCAS DUARTE','1558132529','LOS ESTEROS','0948446832','VILLA 4','SUS PADRES FALLECIERON EN UN ACCIDENTE DONDE SE QUEMÓ LA CASA'),
												(1,2,5,'DIEGO PETER','LOPEZ ORDOÑEZ','1666132531','LA AURORA','0978346823','VILLA 5','NO POSEE PADRE Y SU MADRE ESTÁ EN UN MANICOMIO'),
												(2,3,1,'ANTONIA MARIA','ORDOÑEZ FLORES','1774132533','LAS MARIAS','0908246814','VILLA 6','SUS PADRES FALLECIERON EN UN ACCIDENTE DONDE SE QUEMÓ LA CASA'),
												(1,1,2,'PETER FERNANDO','FLORES CHICA','1882132535','JOCAY','0938146805','VILLA 7','NO POSEE PADRE Y SU MADRE ESTÁ EN UN MANICOMIO');
INSERT INTO TUTORES_NINIOS_RELATION (ID_NINIO,ID_TUTOR) VALUES (1,1),(6,2),(11,3),(18,4),(17,5),(23,6),(24,7);
INSERT INTO RELATIONSHIP_15 (ID_PADRE,ID_NINIO) VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),
												(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(16,16),
												(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),
												(24,24);
INSERT INTO RENDIMIENTO (ID_ACTIVIDAD,ID_NINIO,ID_TIPO_RENDIMIENT,OBSERVACIONES) VALUES
												(1,1,1,'EL NIÑO NO RINDIÓ BIEN'),(2,1,2,'EL NIÑO RINDIÓ BIEN'),(3,1,3,'EL NIÑO RINDIÓ EXCELENTE'),(4,1,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(1,2,1,'EL NIÑO NO RINDIÓ BIEN'),(2,2,2,'EL NIÑO RINDIÓ BIEN'),(3,2,3,'EL NIÑO RINDIÓ EXCELENTE'),(4,2,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(1,3,1,'EL NIÑO NO RINDIÓ BIEN'),(2,3,2,'EL NIÑO RINDIÓ BIEN'),(3,3,3,'EL NIÑO RINDIÓ EXCELENTE'),(4,3,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(1,4,1,'EL NIÑO NO RINDIÓ BIEN'),(2,4,2,'EL NIÑO RINDIÓ BIEN'),(3,4,3,'EL NIÑO RINDIÓ EXCELENTE'),(4,4,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(1,5,1,'EL NIÑO NO RINDIÓ BIEN'),(2,5,2,'EL NIÑO RINDIÓ BIEN'),(3,5,3,'EL NIÑO RINDIÓ EXCELENTE'),(4,5,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(1,6,1,'EL NIÑO NO RINDIÓ BIEN'),(2,6,2,'EL NIÑO RINDIÓ BIEN'),(3,6,3,'EL NIÑO RINDIÓ EXCELENTE'),(4,6,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(5,7,1,'EL NIÑO NO RINDIÓ BIEN'),(6,7,2,'EL NIÑO RINDIÓ BIEN'),(7,7,3,'EL NIÑO RINDIÓ EXCELENTE'),(8,7,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(5,8,1,'EL NIÑO NO RINDIÓ BIEN'),(6,8,2,'EL NIÑO RINDIÓ BIEN'),(7,8,3,'EL NIÑO RINDIÓ EXCELENTE'),(8,8,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(5,9,1,'EL NIÑO NO RINDIÓ BIEN'),(6,9,2,'EL NIÑO RINDIÓ BIEN'),(7,9,3,'EL NIÑO RINDIÓ EXCELENTE'),(8,9,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(5,10,1,'EL NIÑO NO RINDIÓ BIEN'),(6,10,2,'EL NIÑO RINDIÓ BIEN'),(7,10,3,'EL NIÑO RINDIÓ EXCELENTE'),(8,10,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(5,11,1,'EL NIÑO NO RINDIÓ BIEN'),(6,11,2,'EL NIÑO RINDIÓ BIEN'),(7,11,3,'EL NIÑO RINDIÓ EXCELENTE'),(8,11,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(5,12,1,'EL NIÑO NO RINDIÓ BIEN'),(6,12,2,'EL NIÑO RINDIÓ BIEN'),(7,12,3,'EL NIÑO RINDIÓ EXCELENTE'),(8,12,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(9,13,1,'EL NIÑO NO RINDIÓ BIEN'),(10,13,2,'EL NIÑO RINDIÓ BIEN'),(11,13,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(9,14,1,'EL NIÑO NO RINDIÓ BIEN'),(10,14,2,'EL NIÑO RINDIÓ BIEN'),(11,14,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(9,15,1,'EL NIÑO NO RINDIÓ BIEN'),(10,15,2,'EL NIÑO RINDIÓ BIEN'),(11,15,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(9,16,1,'EL NIÑO NO RINDIÓ BIEN'),(10,16,2,'EL NIÑO RINDIÓ BIEN'),(11,16,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(9,17,1,'EL NIÑO NO RINDIÓ BIEN'),(10,17,2,'EL NIÑO RINDIÓ BIEN'),(11,17,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(9,18,1,'EL NIÑO NO RINDIÓ BIEN'),(10,18,2,'EL NIÑO RINDIÓ BIEN'),(11,18,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(12,19,1,'EL NIÑO NO RINDIÓ BIEN'),(13,19,2,'EL NIÑO RINDIÓ BIEN'),(14,19,3,'EL NIÑO RINDIÓ EXCELENTE'),(15,19,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(12,20,1,'EL NIÑO NO RINDIÓ BIEN'),(13,20,2,'EL NIÑO RINDIÓ BIEN'),(14,20,3,'EL NIÑO RINDIÓ EXCELENTE'),(15,20,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(12,21,1,'EL NIÑO NO RINDIÓ BIEN'),(13,21,2,'EL NIÑO RINDIÓ BIEN'),(14,21,3,'EL NIÑO RINDIÓ EXCELENTE'),(15,21,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(12,22,1,'EL NIÑO NO RINDIÓ BIEN'),(13,22,2,'EL NIÑO RINDIÓ BIEN'),(14,22,3,'EL NIÑO RINDIÓ EXCELENTE'),(15,22,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(12,23,1,'EL NIÑO NO RINDIÓ BIEN'),(13,23,2,'EL NIÑO RINDIÓ BIEN'),(14,23,3,'EL NIÑO RINDIÓ EXCELENTE'),(15,23,3,'EL NIÑO RINDIÓ EXCELENTE'),
												(12,24,1,'EL NIÑO NO RINDIÓ BIEN'),(13,24,2,'EL NIÑO RINDIÓ BIEN'),(14,24,3,'EL NIÑO RINDIÓ EXCELENTE'),(15,24,3,'EL NIÑO RINDIÓ EXCELENTE');
INSERT INTO MATRICULA (ID_ANO_LECTIVO,ID_NINIO,PRECIO_MATRICULA) VALUES
												(1,1,10),
												(1,2,10),
												(1,3,10),
												(1,4,10),
												(1,5,10),
												(1,6,10),
												(2,7,10),
												(2,8,10),
												(2,9,10),
												(2,10,10),
												(2,11,10),
												(2,12,10),
												(3,13,10),
												(3,14,10),
												(3,15,10),
												(3,16,10),
												(3,17,10),
												(3,18,10),
												(4,19,10),
												(4,20,10),
												(4,21,10),
												(4,22,10),
												(4,23,10),
												(4,24,10);

COMMIT;


/*TRIGGER 1
-El kínder solo acepta infantes para los programas entre los 3
y 4 años de edad (se debe hacer con trigger,).
*/
--creación de funcion
CREATE OR REPLACE FUNCTION TG_IMPIDENINOS() RETURNS TRIGGER
AS
$$
    DECLARE
        MAX_EDAD INT := 4;
        MIN_EDAD INT := 3;
        EDAD INT;
        ANO_LECT VARCHAR;

    BEGIN	
        SELECT MAX(ANO) INTO ANO_LECT FROM ANO_LECTIVO;
        EDAD = (CAST(ANO_LECT AS DOUBLE PRECISION) - EXTRACT(YEAR FROM NEW.NACIMIENTO_DATE)); 
        IF( EDAD > MAX_EDAD OR EDAD < MIN_EDAD) THEN
            RAISE EXCEPTION 'ERROR AL INGRESAR AL NIÑO!! ES UN KINDER SOLO SE ACEPTA NIÑOS DE 3 Y 4 AÑOS';
        END IF;
        RETURN NEW;
    END;
    $$
    LANGUAGE PLPGSQL;
--creación del trigger
CREATE TRIGGER TG_IMPIDENINOS
BEFORE
INSERT ON NINIO
FOR EACH ROW
EXECUTE PROCEDURE TG_IMPIDENINOS();
--DATO DE PRUEBA
/*
--NIÑO MAYOR DE EDAD (5 AÑOS)
INSERT INTO NINIO (ID_NACIONALIDAD,ID_GENERO,ID_TALLA_ZAPATO,ID_TALLA_VESTIMENTA,
				   CI_NINIO,NOMBRE_NINIO,APELLIDO_NINIO,NACIMIENTO_DATE) VALUES
(1,1,1,1,'1301231537','LENIN ALEXIS','GALLEGO CARDENAS','2016-01-06');
--NIÑO MENOR DE EDAD (2 AÑOS)
INSERT INTO NINIO (ID_NACIONALIDAD,ID_GENERO,ID_TALLA_ZAPATO,ID_TALLA_VESTIMENTA,
				   CI_NINIO,NOMBRE_NINIO,APELLIDO_NINIO,NACIMIENTO_DATE) VALUES
(1,1,1,1,'1301231537','LENIN ALEXIS','GALLEGO CARDENAS','2019-01-06');*/


/*
TRIGGER 2
- Trigger que impida que un estudiante sea matriculado varias veces en una misma actividad programada. 
*/
CREATE OR REPLACE FUNCTION TG_IMPIDE_MATRICULA() RETURNS TRIGGER
AS
$$
    DECLARE
        MAX_MAT INT := 1;
        NUM INT;

    BEGIN
        --YA AHORA SI ESO
        SELECT COUNT(ID_MATRICULA) INTO NUM FROM MATRICULA 
        WHERE ID_NINIO = NEW.ID_NINIO AND ID_ANO_LECTIVO = NEW.ID_ANO_LECTIVO;

        IF(NUM>=MAX_MAT) THEN
            RAISE EXCEPTION 'SOLO SE PUEDE MATRICULAR UNA VEZ';
        END IF;
        RETURN NEW;
    END;
    $$
    LANGUAGE PLPGSQL;

--creación del trigger
CREATE TRIGGER TG_IMPIDE_MATRICULA
BEFORE
INSERT ON MATRICULA
FOR EACH ROW
EXECUTE PROCEDURE TG_IMPIDE_MATRICULA();
--DATO DE PRUEBA
--ESTOY INTENTANDO INGRESAR UN NIÑO QUE YA FUÉ INSCRITO A ESA ACTIVIDAD:
/*
INSERT INTO MATRICULA (ID_ACTIVIDAD,ID_NINIO,ESTADO_MATRICULA,PRECIO_MATRICULA) VALUES
												(1,1,TRUE,10);*/
												
/*
TRIGGER 3
-No permitir que se ingrese un año que no sea el actual
*/
--creación de funcion
CREATE OR REPLACE FUNCTION TG_ANIOACTUAL() RETURNS TRIGGER
AS
$$
    DECLARE
       
        ANO_INST VARCHAR;
        ANO_LECT DATE = CURRENT_DATE;
		AN VARCHAR;

    BEGIN	
        AN=EXTRACT(YEAR FROM ANO_LECT);
		
        ANO_INST=NEW.ANO;
        IF( AN != ANO_INST ) THEN
            RAISE EXCEPTION 'EL AÑO INGREADO DEBE SE IGUAL AL ACTUAL %',AN;
        END IF;
        RETURN NEW;
    END;
    $$
    LANGUAGE PLPGSQL;
--creación del trigger
CREATE TRIGGER TG_ANIOACTUAL
BEFORE
INSERT ON ANO_LECTIVO
FOR EACH ROW
EXECUTE PROCEDURE TG_ANIOACTUAL();
--Creando el anño actual (2022)
INSERT INTO ANO_LECTIVO (ANO) VALUES ('2022');
--Creando niños que nuevos que se hayan matriculado pero no cancelado
--lo que significa que no ha acabado el año lectivo
INSERT INTO NINIO (ID_NACIONALIDAD,ID_GENERO,ID_TALLA_ZAPATO,ID_TALLA_VESTIMENTA,CI_NINIO,NOMBRE_NINIO,APELLIDO_NINIO,NACIMIENTO_DATE,ESTADO_MATRICULA) VALUES
												(1,1,1,1,'1301234537','ALBERTO LENIN','CARDENAS GALLEGO','2018-01-06',TRUE),
												(2,2,1,1,'1301234537','ESTER CALDO','LEINAS TORRES','2018-01-06',TRUE),
												(3,1,1,1,'1301234537','ALBERTO CELIN','CALDO RUPERIO','2018-01-06',TRUE),
												(1,2,1,1,'1301234537','LUCAS MATEO','CEVALLOS BALDA','2018-01-06',TRUE	);
												

/*
	CONSULTA NIÑOS CON MATRICULADA ACTIVA O SIN PAGAR(TRUE)
	select  id_ninio as ID, apellido_ninio || ' ' || nombre_ninio  as nombres from ninio WHERE ESTADO_MATRICULA=TRUE
	
	CONSULTA NIÑOS QUE PERTENEZCAN AL AÑO LECTIVO 2021
	select  n.id_ninio as ID, n.apellido_ninio || ' ' ||n.nombre_ninio as nombre  from ninio n 
	inner join matricula mat on n.id_ninio=mat.id_ninio 
	inner join ano_lectivo an on mat.id_ano_lectivo=an.id_ano_lectivo 
	where an.ano='2021';
	
	CONSULTA ACTIVIDADES QUE NO ESTEN FINALIZADAS Y QUE SEAN DEL 2021
	select act.id_actividad as id, act.nombre_avtivi as nombre from actividad act 
	inner join programa pro on act.id_programa=pro.id_programa 
	inner join ano_lectivo an on pro.id_ano_lectivo=an.id_ano_lectivo 
	where an.ano=\'2021\' and act.finalizado=FALSE;
	
	CONSULTA DE LOS TIPOS DE RENDIMIENTOS (BUENO, EXCELENTE,REGULAR)
	select tip.id_tipo_rendimient as id, tip.nombre_rendimient as nombre from tipo_rendimiento tip;
	
*/
/*
select * from tutor;
SELECT * FROM PADRE; 
select * from ano_lectivo
select * from ninio
SELECT * FROM MATRICULA; */


