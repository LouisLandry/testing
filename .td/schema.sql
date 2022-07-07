-- dpi object definition
CREATE FOREIGN TABLE dpi, EXTERNAL SECURITY DEFINER TRUSTED tio (
 	location varchar(2048) character set unicode casespecific,
 	htimestamp varchar(255),
 	teid varchar(255),
 	dst_ip varchar(255),
 	dst_port varchar(255),
 	src_ip varchar(255),
 	src_port varchar(255),
 	hmethod varchar(255),
 	hversion varchar(255),
 	h_name1 varchar(255),
 	h_name2 varchar(255),
 	h_name3 varchar(255),
 	h_name4 varchar(255),
 	content_type varchar(512),
 	url varchar(2048),
 	refer varchar(2048),
 	hbytes varchar(25)
 ) USING (
 	LOCATION('/S3/s3.us-west-1.amazonaws.com/tio-antares-nos-uswest1/dpi/')
 	STOREDAS('PARQUET')
 );

-- READ_PATH_PARQUET object definition
CREATE FUNCTION MAPPING READ_PATH_PARQUET
FOR READ_NOS EXTERNAL SECURITY DEFINER TRUSTED tio
USING
LOCATION ('/S3/path/to/data.parquet'),
RETURNTYPE ('NOSREAD_PARQUET_SCHEMA'),
STOREDAS('PARQUET'),
FULLSCAN('TRUE'),
ANY IN TABLE;

-- READ_PATH_CSV object definition
CREATE FUNCTION MAPPING READ_PATH_CSV
FOR READ_NOS EXTERNAL SECURITY DEFINER TRUSTED tio
USING
LOCATION ('/S3/path/to/data.csv'),
RETURNTYPE ('NOSREAD_RECORD'),
ANY IN TABLE;
