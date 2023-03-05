/* =================
Table: projectimage

Columns:
imgID varchar(35) PK 
imgName varchar(10) 
imgType char(4) 
imgInfo text 
indexIn int 
forProject varchar(35)

=======================
  
Related Tables:

Target project (forProject → projectId) 
On Update CASCADE 
On Delete CASCADE

=======================

Foreign Key: developerId

Definition:
Target member (developerId → memberId) 
On Update CASCADE 
On Delete RESTRICT
======================= */