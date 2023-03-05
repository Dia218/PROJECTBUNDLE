/* =====================
Table: project

Columns:
projectId varchar(30) PK 
developerId varchar(20) 
projectName varchar(20) 
projectNameEn varchar(20) 
description text 
category varchar(10) 
condition char(10) 
releasedate date 
github varchar(50) 
projectIndex int

========================

Foreign Key: developerId

Definition:
Target member (developerId → memberId) 
On Update CASCADE 
On Delete RESTRICT
======================== */