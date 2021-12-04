CREATE DATABASE IdentitySrv;
USE IdentitySrv;

CREATE TABLE ApiClaims(
	Id int NOT NULL AUTO_INCREMENT,
	Type nvarchar(200) NOT NULL,
	ApiResourceId int NOT NULL,
 CONSTRAINT PK_ApiClaims PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ApiProperties(
	Id int NOT NULL AUTO_INCREMENT,
	`Key` nvarchar(250) NOT NULL,
	`Value` nvarchar(2000) NOT NULL,
	ApiResourceId int NOT NULL,
 CONSTRAINT PK_ApiProperties PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ApiResources(
	Id int NOT NULL AUTO_INCREMENT,
	Enabled bit NOT NULL,
	Name nvarchar(200) NOT NULL,
	DisplayName nvarchar(200) NULL,
	Description nvarchar(1000) NULL,
	Created datetime NOT NULL,
	Updated datetime NULL,
	LastAccessed datetime NULL,
	NonEditable bit NOT NULL,
 CONSTRAINT PK_ApiResources PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ApiScopeClaims(
	Id int NOT NULL AUTO_INCREMENT,
	Type nvarchar(200) NOT NULL,
	ApiScopeId int NOT NULL,
 CONSTRAINT PK_ApiScopeClaims PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ApiScopes(
	Id int NOT NULL AUTO_INCREMENT,
	Name nvarchar(200) NOT NULL,
	DisplayName nvarchar(200) NULL,
	Description nvarchar(1000) NULL,
	Required bit NOT NULL,
	Emphasize bit NOT NULL,
	ShowInDiscoveryDocument bit NOT NULL,
	ApiResourceId int NOT NULL,
 CONSTRAINT PK_ApiScopes PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ApiSecrets(
	Id int NOT NULL AUTO_INCREMENT,
	Description nvarchar(1000) NULL,
	Value nvarchar(4000) NOT NULL,
	Expiration datetime NULL,
	Type nvarchar(250) NOT NULL,
	Created datetime NOT NULL,
	ApiResourceId int NOT NULL,
 CONSTRAINT PK_ApiSecrets PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ClientClaims(
	Id int NOT NULL AUTO_INCREMENT,
	Type nvarchar(250) NOT NULL,
	Value nvarchar(250) NOT NULL,
	ClientId int NOT NULL,
 CONSTRAINT PK_ClientClaims PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ClientCorsOrigins(
	Id int NOT NULL AUTO_INCREMENT,
	Origin nvarchar(150) NOT NULL,
	ClientId int NOT NULL,
 CONSTRAINT PK_ClientCorsOrigins PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ClientGrantTypes(
	Id int NOT NULL AUTO_INCREMENT,
	GrantType nvarchar(250) NOT NULL,
	ClientId int NOT NULL,
 CONSTRAINT PK_ClientGrantTypes PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ClientIdPRestrictions(
	Id int NOT NULL AUTO_INCREMENT,
	Provider nvarchar(200) NOT NULL,
	ClientId int NOT NULL,
 CONSTRAINT PK_ClientIdPRestrictions PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ClientPostLogoutRedirectUris(
	Id int NOT NULL AUTO_INCREMENT,
	PostLogoutRedirectUris nvarchar(2000) NOT NULL,
	ClientId int NOT NULL,
 CONSTRAINT PK_ClientPostLoutRedirectUris PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ClientProperties(
	Id int NOT NULL AUTO_INCREMENT,
	`Key` nvarchar(250) NOT NULL,
	`Value` nvarchar(2000) NOT NULL,
	ClientId int NOT NULL,
 CONSTRAINT PK_ClientProperties PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ClientRedirectUris(
	Id int NOT NULL AUTO_INCREMENT,
	RedirectUri nvarchar(2000) NOT NULL,
	ClientId int NOT NULL,
 CONSTRAINT PK_ClientRedirectUris PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE Clients(
	Id int NOT NULL AUTO_INCREMENT,
	Enabled bit NOT NULL,
	ClientId nvarchar(200) NOT NULL,
	ProtocolType nvarchar(200) NOT NULL,
	RequireClientSecret bit NOT NULL,
	ClientName nvarchar(200) NULL,
	Description nvarchar(1000) NULL,
	ClientUri nvarchar(2000) NULL,
	LoUri nvarchar(2000) NULL,
	RequireConsent bit NOT NULL,
	AllowRememberConsent bit NOT NULL,
	AlwaysIncludeUserClaimsInIdToken bit NOT NULL,
	RequirePkce bit NOT NULL,
	AllowPlainTextPkce bit NOT NULL,
	AllowAccessTokensViaBrowser bit NOT NULL,
	FrontChannelLoutUri nvarchar(2000) NULL,
	FrontChannelLoutSessionRequired bit NOT NULL,
	BackChannelLoutUri nvarchar(2000) NULL,
	BackChannelLoutSessionRequired bit NOT NULL,
	AllowOfflineAccess bit NOT NULL,
	IdentityTokenLifetime int NOT NULL,
	AccessTokenLifetime int NOT NULL,
	AuthorizationCodeLifetime int NOT NULL,
	ConsentLifetime int NULL,
	AbsoluteRefreshTokenLifetime int NOT NULL,
	SlidingRefreshTokenLifetime int NOT NULL,
	RefreshTokenUsage int NOT NULL,
	UpdateAccessTokenClaimsOnRefresh bit NOT NULL,
	RefreshTokenExpiration int NOT NULL,
	AccessTokenType int NOT NULL,
	EnableLocalLogin bit NOT NULL,
	IncludeJwtId bit NOT NULL,
	AlwaysSendClientClaims bit NOT NULL,
	ClientClaimsPrefix nvarchar(200) NULL,
	PairWiseSubjectSalt nvarchar(200) NULL,
	Created datetime NOT NULL,
	Updated datetime NULL,
	LastAccessed datetime NULL,
	UserSsoLifetime int NULL,
	UserCodeType nvarchar(100) NULL,
	DeviceCodeLifetime int NOT NULL,
	NonEditable bit NOT NULL,
 CONSTRAINT PK_Clients PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ClientScopes(
	Id int NOT NULL AUTO_INCREMENT,
	Scope nvarchar(200) NOT NULL,
	ClientId int NOT NULL,
 CONSTRAINT PK_ClientScopes PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE ClientSecrets(
	Id int NOT NULL AUTO_INCREMENT,
	Description nvarchar(2000) NULL,
	Value nvarchar(4000) NOT NULL,
	Expiration datetime NULL,
	Type nvarchar(250) NOT NULL,
	Created datetime NOT NULL,
	ClientId int NOT NULL,
 CONSTRAINT PK_ClientSecrets PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE DeviceCodes(
	UserCode nvarchar(200) NOT NULL,
	DeviceCode nvarchar(200) NOT NULL,
	SubjectId nvarchar(200) NULL,
	ClientId nvarchar(200) NOT NULL,
	CreationTime datetime NOT NULL,
	Expiration datetime NOT NULL,
	`Data` nvarchar(2000) NOT NULL,
 CONSTRAINT PK_DeviceCodes PRIMARY KEY CLUSTERED 
(
	UserCode ASC
)
);

CREATE TABLE IdentityClaims(
	Id int NOT NULL AUTO_INCREMENT,
	Type nvarchar(200) NOT NULL,
	IdentityResourceId int NOT NULL,
 CONSTRAINT PK_IdentityClaims PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE IdentityProperties(
	Id int NOT NULL AUTO_INCREMENT,
	`Key` nvarchar(250) NOT NULL,
	`Value` nvarchar(2000) NOT NULL,
	IdentityResourceId int NOT NULL,
 CONSTRAINT PK_IdentityProperties PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE IdentityResources(
	Id int NOT NULL AUTO_INCREMENT,
	Enabled bit NOT NULL,
	Name nvarchar(200) NOT NULL,
	DisplayName nvarchar(200) NULL,
	Description nvarchar(1000) NULL,
	Required bit NOT NULL,
	Emphasize bit NOT NULL,
	ShowInDiscoveryDocument bit NOT NULL,
	Created datetime NOT NULL,
	Updated datetime NULL,
	NonEditable bit NOT NULL,
 CONSTRAINT PK_IdentityResources PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

CREATE TABLE PersistedGrants(
	`Key` nvarchar(200) NOT NULL,
	Type nvarchar(50) NOT NULL,
	SubjectId nvarchar(200) NULL,
	ClientId nvarchar(200) NOT NULL,
	CreationTime datetime NOT NULL,
	Expiration datetime NULL,
	`Data` nvarchar(2000) NOT NULL,
 CONSTRAINT PK_PersistedGrants PRIMARY KEY CLUSTERED 
(
	`Key` ASC
)
);

CREATE TABLE User(
	Id int NOT NULL AUTO_INCREMENT,
	Username varchar(100) NOT NULL,
	PasswordHash varchar(2000) NOT NULL,
	NormalizedUserName nvarchar(2000) NULL,
	Email varchar(2000) NOT NULL,
	PhoneNumber varchar(2000) NULL,
	NormalizedEmail nvarchar(2000) NULL,
	EmailConfirmed bit NOT NULL,
	SecurityStamp nvarchar(2000) NULL,
	ConcurrencyStamp nvarchar(2000) NULL,
	PhoneNumberConfirmed bit NULL,
	TwoFactorEnabled bit NOT NULL,
	LockoutEnd datetime NULL,
	LockoutEnabled bit NOT NULL,
	AccessFailedCount int NOT NULL,
	CreatedOn datetime NOT NULL,
	ModifiedOn datetime NOT NULL,
 CONSTRAINT PK_User PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);


INSERT INTO Clients VALUES 
(1, 1, N'ClientUI', N'oidc', 1, N'ClientUI', NULL, NULL, NULL, 0, 1, 0, 0, 0, 1, NULL, 1, NULL, 1, 0, 3600, 600, 300, NULL, 2592000, 1296000, 1, 1, 1, 0, 1, 0, 0, N'client_', NULL, CAST(N'2021-06-12T16:16:16' AS DateTime), NULL, NULL, NULL, NULL, 300, 0),
(2, 1, N'ClientAPI', N'oidc', 1, N'ClientAPI', NULL, NULL, NULL, 0, 1, 0, 0, 0, 1, NULL, 1, NULL, 1, 0, 3600, 600, 300, NULL, 2592000, 1296000, 1, 1, 1, 0, 1, 0, 0, N'client_', NULL, CAST(N'2021-06-12T16:16:16' AS DateTime), NULL, NULL, NULL, NULL, 300, 0);

INSERT INTO ClientSecrets VALUES
(1, NULL, N'xtJPEXz3ykrx+rJfsdy2MmW8MVDx0ICL77lg4ZE08LA=', NULL, N'SharedSecret', CAST(N'2021-06-12T16:16:16' AS DateTime), 2);

INSERT INTO ApiResources VALUES
(1, 1, N'APIBusiness', N'APIBusiness', NULL, CAST(N'2021-06-12T16:16:16' AS DateTime), NULL, NULL, 0),
(2, 1, N'PasswordIntrospection', N'Password Introspection', NULL, CAST(N'2021-06-12T16:16:16' AS DateTime), NULL, NULL, 0);

INSERT INTO ApiScopes VALUES
(1, N'APIBusiness', N'APIBusiness', NULL, 0, 0, 1, 1),
(2, N'PasswordIntrospection', N'Password Introspection', NULL, 0, 0, 1, 2);

INSERT INTO ApiSecrets VALUES
(1, NULL, N'n+ftS7NBU22dGsV7AXXQvEmkcwyEx+uy/JaHkrQxmc0=', NULL, 'SharedSecret', '2021-06-12T16:16:16', 2);

INSERT INTO ClientCorsOrigins VALUES
(1, N'http://localhost:4200', 1);

INSERT INTO ClientGrantTypes VALUES
(1, N'implicit', 1),
(2, N'client_credentials', 2);

INSERT INTO ClientPostLogoutRedirectUris VALUES
(1, N'http://localhost:4200', 1);

INSERT INTO ClientRedirectUris VALUES
(1, N'http://localhost:4200/login', 1),
(2, N'http://localhost:4200/silent-refresh.html', 1);

INSERT INTO ClientScopes VALUES
(1, N'openid', 1),
(2, N'profile', 1);

INSERT INTO IdentityResources VALUES
(1, 1, N'openid', N'User identifier', NULL, 1, 0, 1, CAST(N'2021-06-12T16:16:16' AS DateTime), NULL, 0),
(2, 1, N'profile', N'User profile', N'User profile information', 0, 1, 1, CAST(N'2021-06-12T16:16:16' AS DateTime), NULL, 0);
 
INSERT INTO IdentityClaims VALUES
(1, N'sub', 1), 
(2, N'name', 2);