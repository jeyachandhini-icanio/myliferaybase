create table Employee (
	uuid_ VARCHAR(75) null,
	empId LONG not null primary key,
	name VARCHAR(75) null,
	companyId LONG,
	userId LONG,
	userName VARCHAR(75) null,
	createDate DATE null,
	modifiedDate DATE null
);