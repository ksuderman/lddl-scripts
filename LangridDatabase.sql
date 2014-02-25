--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acceptableremoteaddress; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE acceptableremoteaddress (
    address character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone
);


ALTER TABLE public.acceptableremoteaddress OWNER TO langrid;

--
-- Name: accesslimit; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE accesslimit (
    limittype integer NOT NULL,
    period integer NOT NULL,
    servicegridid character varying(255) NOT NULL,
    serviceid character varying(255) NOT NULL,
    usergridid character varying(255) NOT NULL,
    userid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    limitcount integer NOT NULL
);


ALTER TABLE public.accesslimit OWNER TO langrid;

--
-- Name: accesslog; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE accesslog (
    id integer NOT NULL,
    address character varying(255),
    agent character varying(255),
    callnest integer NOT NULL,
    calltree text,
    datetime timestamp without time zone,
    faultcode character varying(255),
    faultstring text,
    host character varying(255),
    nodeid character varying(255),
    nodelocalid integer NOT NULL,
    protocolid character varying(255),
    referer character varying(255),
    requestbytes integer NOT NULL,
    requesturi character varying(255),
    responsebytes integer NOT NULL,
    responsecode integer NOT NULL,
    responsemillis bigint NOT NULL,
    serviceandnodegridid character varying(255),
    serviceid character varying(255),
    usergridid character varying(255),
    userid character varying(255)
);


ALTER TABLE public.accesslog OWNER TO langrid;

--
-- Name: accessright; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE accessright (
    servicegridid character varying(255) NOT NULL,
    serviceid character varying(255) NOT NULL,
    usergridid character varying(255) NOT NULL,
    userid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    permitted boolean NOT NULL
);


ALTER TABLE public.accessright OWNER TO langrid;

--
-- Name: accessstat; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE accessstat (
    basedatetime timestamp without time zone NOT NULL,
    nodeid character varying(255) NOT NULL,
    period integer NOT NULL,
    serviceandnodegridid character varying(255) NOT NULL,
    serviceid character varying(255) NOT NULL,
    usergridid character varying(255) NOT NULL,
    userid character varying(255) NOT NULL,
    accesscount integer NOT NULL,
    lastaccessdatetime timestamp without time zone,
    requestbytes bigint NOT NULL,
    responsebytes bigint NOT NULL,
    responsemillis bigint NOT NULL
);


ALTER TABLE public.accessstat OWNER TO langrid;

--
-- Name: domain; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE domain (
    domainid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    description character varying(255),
    domainname character varying(255),
    ownerusergridid character varying(255),
    owneruserid character varying(255)
);


ALTER TABLE public.domain OWNER TO langrid;

--
-- Name: federation; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE federation (
    sourcegridid character varying(255) NOT NULL,
    targetgridid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    connected boolean NOT NULL,
    requesting boolean NOT NULL,
    sourcegridname character varying(255),
    tagetgridname character varying(255),
    targetgridaccesstoken character varying(255),
    targetgridhomepageurlclazz character varying(255),
    targetgridhomepageurlstringvalue character varying(255),
    targetgridorganization character varying(255),
    targetgriduserid character varying(255)
);


ALTER TABLE public.federation OWNER TO langrid;

--
-- Name: grid; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE grid (
    gridid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    autoapproveenabled boolean NOT NULL,
    commercialuseallowed boolean NOT NULL,
    gridname character varying(255),
    hosted boolean NOT NULL,
    operatoruserid character varying(255),
    url text
);


ALTER TABLE public.grid OWNER TO langrid;

--
-- Name: grid_domain; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE grid_domain (
    grid_gridid character varying(255) NOT NULL,
    supporteddomains_domainid character varying(255) NOT NULL
);


ALTER TABLE public.grid_domain OWNER TO langrid;

--
-- Name: gridattribute; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE gridattribute (
    gridid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    value text
);


ALTER TABLE public.gridattribute OWNER TO langrid;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: langrid
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO langrid;

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: langrid
--

SELECT pg_catalog.setval('hibernate_sequence', 1, false);


--
-- Name: invocation; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE invocation (
    invocationname character varying(255) NOT NULL,
    ownerservicegridid character varying(255) NOT NULL,
    ownerserviceid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    domainid character varying(255),
    servicegridid character varying(255),
    serviceid character varying(255),
    servicename character varying(255),
    servicetypeid character varying(255)
);


ALTER TABLE public.invocation OWNER TO langrid;

--
-- Name: news; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE news (
    id integer NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    contents text,
    gridid character varying(255),
    nodeid character varying(255),
    nodelocalid integer NOT NULL
);


ALTER TABLE public.news OWNER TO langrid;

--
-- Name: node; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE node (
    gridid character varying(255) NOT NULL,
    nodeid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    accesstoken character varying(255),
    active boolean NOT NULL,
    cpu character varying(255),
    memory character varying(255),
    mirror boolean NOT NULL,
    nodename character varying(255),
    os character varying(255),
    owneruserid character varying(255),
    owneruserorganization character varying(255),
    specialnotes character varying(255),
    urlclazz character varying(255),
    urlstringvalue character varying(255)
);


ALTER TABLE public.node OWNER TO langrid;

--
-- Name: nodeattribute; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE nodeattribute (
    gridid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    nodeid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    value text
);


ALTER TABLE public.nodeattribute OWNER TO langrid;

--
-- Name: operationrequest; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE operationrequest (
    id integer NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    requesteduserid character varying(255),
    contents text,
    gridid character varying(255),
    nodeid character varying(255),
    nodelocalid integer NOT NULL,
    targetid character varying(255),
    targettype integer
);


ALTER TABLE public.operationrequest OWNER TO langrid;

--
-- Name: overuselimit; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE overuselimit (
    gridid character varying(255) NOT NULL,
    limittype integer NOT NULL,
    period integer NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    limitcount integer NOT NULL
);


ALTER TABLE public.overuselimit OWNER TO langrid;

--
-- Name: protocol; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE protocol (
    protocolid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    description character varying(255),
    ownerusergridid character varying(255),
    owneruserid character varying(255),
    protocolname character varying(255)
);


ALTER TABLE public.protocol OWNER TO langrid;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE resource (
    gridid character varying(255) NOT NULL,
    resourceid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    active boolean NOT NULL,
    approved boolean NOT NULL,
    copyrightinfo text,
    cpuinfo character varying(255),
    licenseinfo text,
    memoryinfo character varying(255),
    osinfo character varying(255),
    owneruserid character varying(255),
    resourcedescription text,
    resourcename character varying(255),
    resourcetypedomainid character varying(255),
    resourcetypeid character varying(255),
    specialnoteinfo text,
    visible boolean NOT NULL
);


ALTER TABLE public.resource OWNER TO langrid;

--
-- Name: resourceattribute; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE resourceattribute (
    gridid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    resourceid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    value text
);


ALTER TABLE public.resourceattribute OWNER TO langrid;

--
-- Name: resourcemetaattribute; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE resourcemetaattribute (
    attributeid character varying(255) NOT NULL,
    domainid character varying(255) NOT NULL,
    attributename character varying(255),
    description character varying(255)
);


ALTER TABLE public.resourcemetaattribute OWNER TO langrid;

--
-- Name: resourcetype; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE resourcetype (
    domainid character varying(255) NOT NULL,
    resourcetypeid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    description character varying(255),
    resourcetypename character varying(255)
);


ALTER TABLE public.resourcetype OWNER TO langrid;

--
-- Name: resourcetype_resourcemetaattribute; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE resourcetype_resourcemetaattribute (
    resourcetype_domainid character varying(255) NOT NULL,
    resourcetype_resourcetypeid character varying(255) NOT NULL,
    metaattributes_attributeid character varying(255) NOT NULL,
    metaattributes_domainid character varying(255) NOT NULL
);


ALTER TABLE public.resourcetype_resourcemetaattribute OWNER TO langrid;

--
-- Name: service; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE service (
    dtype character varying(31) NOT NULL,
    gridid character varying(255) NOT NULL,
    serviceid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    active boolean NOT NULL,
    alternateserviceid character varying(255),
    appauthkey character varying(255),
    approved boolean NOT NULL,
    containertype character varying(255),
    copyrightinfo character varying(255),
    federateduseallowed boolean NOT NULL,
    howtogetmembershipinfo text,
    instance oid,
    instancesize integer NOT NULL,
    instancetype integer,
    licenseinfo text,
    membersonly boolean NOT NULL,
    owneruserid character varying(255),
    resourceid character varying(255),
    servicedescription text,
    servicename character varying(255),
    servicetypedomainid character varying(255),
    servicetypeid character varying(255),
    streaming boolean,
    timeoutmillis integer NOT NULL,
    usealternateservice boolean NOT NULL,
    visible boolean NOT NULL,
    wrappersourcecodeurlclazz character varying(255),
    wrappersourcecodeurlstringvalue character varying(255),
    wsdl oid,
    deployed boolean,
    deployedid character varying(255)
);


ALTER TABLE public.service OWNER TO langrid;

--
-- Name: service_allowedappprovision; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE service_allowedappprovision (
    service_gridid character varying(255) NOT NULL,
    service_serviceid character varying(255) NOT NULL,
    element character varying(255)
);


ALTER TABLE public.service_allowedappprovision OWNER TO langrid;

--
-- Name: service_alloweduse; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE service_alloweduse (
    service_gridid character varying(255) NOT NULL,
    service_serviceid character varying(255) NOT NULL,
    element character varying(255)
);


ALTER TABLE public.service_alloweduse OWNER TO langrid;

--
-- Name: service_partnerservicenamespaceuris; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE service_partnerservicenamespaceuris (
    service_gridid character varying(255) NOT NULL,
    service_serviceid character varying(255) NOT NULL,
    element character varying(255)
);


ALTER TABLE public.service_partnerservicenamespaceuris OWNER TO langrid;

--
-- Name: serviceactionschedule; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE serviceactionschedule (
    id integer NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    actiontype integer,
    bookingdatetime timestamp without time zone,
    gridid character varying(255),
    isrelated boolean NOT NULL,
    nodeid character varying(255),
    nodelocalid integer NOT NULL,
    targetid character varying(255),
    targettype integer
);


ALTER TABLE public.serviceactionschedule OWNER TO langrid;

--
-- Name: serviceattribute; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE serviceattribute (
    gridid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    serviceid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    value text
);


ALTER TABLE public.serviceattribute OWNER TO langrid;

--
-- Name: servicedeployment; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE servicedeployment (
    gridid character varying(255) NOT NULL,
    nodeid character varying(255) NOT NULL,
    serviceid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    deployeddatetime timestamp without time zone,
    disabledbyerrordate timestamp without time zone,
    enabled boolean NOT NULL,
    servicepath character varying(255)
);


ALTER TABLE public.servicedeployment OWNER TO langrid;

--
-- Name: serviceendpoint; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE serviceendpoint (
    gridid character varying(255) NOT NULL,
    protocolid character varying(255) NOT NULL,
    serviceid character varying(255) NOT NULL,
    url text NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    authpassword character varying(255),
    authusername character varying(255),
    averesponsemillis bigint NOT NULL,
    disablereason text,
    disabledbyerrordate timestamp without time zone,
    enabled boolean NOT NULL,
    experience bigint NOT NULL
);


ALTER TABLE public.serviceendpoint OWNER TO langrid;

--
-- Name: serviceinterfacedefinition; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE serviceinterfacedefinition (
    id integer NOT NULL,
    definition oid,
    protocolid character varying(255),
    servicetype_domainid character varying(255),
    servicetype_servicetypeid character varying(255)
);


ALTER TABLE public.serviceinterfacedefinition OWNER TO langrid;

--
-- Name: servicemetaattribute; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE servicemetaattribute (
    attributeid character varying(255) NOT NULL,
    domainid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    attributename character varying(255),
    description character varying(255)
);


ALTER TABLE public.servicemetaattribute OWNER TO langrid;

--
-- Name: servicetype; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE servicetype (
    domainid character varying(255) NOT NULL,
    servicetypeid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    description text,
    servicetypename character varying(255)
);


ALTER TABLE public.servicetype OWNER TO langrid;

--
-- Name: servicetype_servicemetaattribute; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE servicetype_servicemetaattribute (
    servicetype_domainid character varying(255) NOT NULL,
    servicetype_servicetypeid character varying(255) NOT NULL,
    metaattributes_attributeid character varying(255) NOT NULL,
    metaattributes_domainid character varying(255) NOT NULL
);


ALTER TABLE public.servicetype_servicemetaattribute OWNER TO langrid;

--
-- Name: systemproperty; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE systemproperty (
    gridid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.systemproperty OWNER TO langrid;

--
-- Name: temporaryuser; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE temporaryuser (
    gridid character varying(255) NOT NULL,
    userid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    beginavailabledatetime timestamp without time zone,
    endavailabledatetime timestamp without time zone,
    parentuserid character varying(255),
    password character varying(255)
);


ALTER TABLE public.temporaryuser OWNER TO langrid;

--
-- Name: userattribute; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE userattribute (
    gridid character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    userid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    value text
);


ALTER TABLE public.userattribute OWNER TO langrid;

--
-- Name: userroles; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE userroles (
    gridid character varying(255) NOT NULL,
    rolename character varying(255) NOT NULL,
    userid character varying(255) NOT NULL
);


ALTER TABLE public.userroles OWNER TO langrid;

--
-- Name: users; Type: TABLE; Schema: public; Owner: langrid; Tablespace: 
--

CREATE TABLE users (
    gridid character varying(255) NOT NULL,
    userid character varying(255) NOT NULL,
    createddatetime timestamp without time zone,
    updateddatetime timestamp without time zone,
    abletocallservices boolean NOT NULL,
    address character varying(255),
    defaultappprovisiontype character varying(255),
    defaultusetype character varying(255),
    emailaddress character varying(255),
    homepageurlclazz character varying(255),
    homepageurlstringvalue character varying(255),
    organization character varying(255),
    password character varying(255),
    passwordchangeddate timestamp without time zone,
    representative character varying(255),
    visible boolean NOT NULL
);


ALTER TABLE public.users OWNER TO langrid;

--
-- Data for Name: acceptableremoteaddress; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: accesslimit; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: accesslog; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: accessright; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: accessstat; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: domain; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: federation; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: grid; Type: TABLE DATA; Schema: public; Owner: langrid
--

INSERT INTO grid VALUES ('lapps', '2013-12-03 16:21:33.57', '2013-12-03 16:21:33.57', true, false, 'lapps', true, 'operator', 'http://localhost:8080/service_manager');


--
-- Data for Name: grid_domain; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: gridattribute; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: invocation; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: langrid
--

INSERT INTO node VALUES ('lapps', 'anc', '2013-12-03 16:21:33.649', '2013-12-03 16:21:33.649', NULL, true, '4x8 2.6Ghz', '64GB', false, 'ANC-Node-1', 'Ubuntu 12.04.1 LTS', 'operator', NULL, 'None.', 'java.net.URL', 'http://localhost:8080/service_manager');


--
-- Data for Name: nodeattribute; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: operationrequest; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: overuselimit; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: protocol; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: resourceattribute; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: resourcemetaattribute; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: resourcetype; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: resourcetype_resourcemetaattribute; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: service_allowedappprovision; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: service_alloweduse; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: service_partnerservicenamespaceuris; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: serviceactionschedule; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: serviceattribute; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: servicedeployment; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: serviceendpoint; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: serviceinterfacedefinition; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: servicemetaattribute; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: servicetype; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: servicetype_servicemetaattribute; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: systemproperty; Type: TABLE DATA; Schema: public; Owner: langrid
--

INSERT INTO systemproperty VALUES ('lapps', 'passwordExpirationDays', '90');


--
-- Data for Name: temporaryuser; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: userattribute; Type: TABLE DATA; Schema: public; Owner: langrid
--



--
-- Data for Name: userroles; Type: TABLE DATA; Schema: public; Owner: langrid
--

INSERT INTO userroles VALUES ('lapps', 'langriduser', 'operator');
INSERT INTO userroles VALUES ('lapps', 'langridadmin', 'operator');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: langrid
--

INSERT INTO users VALUES ('lapps', 'operator', '2013-12-03 16:21:33.673', '2013-12-03 16:21:33.673', true, 'New York', 'CLIENT_CONTROL', 'NONPROFIT_USE', 'suderman@anc.org', 'java.net.URL', 'http://www.anc.org', 'American National Corpus', 'bc87235367eb9b67e1f5ffceb7a1e5506d2c3d92fc655b5b75b7b3892e7e7cdbc0f614147df2e89b44846f18f6d83c9246831b542b92ed5ad49cf1f6fbdcf73f', NULL, 'Keith Suderman', true);


--
-- Name: acceptableremoteaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY acceptableremoteaddress
    ADD CONSTRAINT acceptableremoteaddress_pkey PRIMARY KEY (address);


--
-- Name: accesslimit_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY accesslimit
    ADD CONSTRAINT accesslimit_pkey PRIMARY KEY (limittype, period, servicegridid, serviceid, usergridid, userid);


--
-- Name: accesslog_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY accesslog
    ADD CONSTRAINT accesslog_pkey PRIMARY KEY (id);


--
-- Name: accessright_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY accessright
    ADD CONSTRAINT accessright_pkey PRIMARY KEY (servicegridid, serviceid, usergridid, userid);


--
-- Name: accessstat_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY accessstat
    ADD CONSTRAINT accessstat_pkey PRIMARY KEY (basedatetime, nodeid, period, serviceandnodegridid, serviceid, usergridid, userid);


--
-- Name: domain_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY domain
    ADD CONSTRAINT domain_pkey PRIMARY KEY (domainid);


--
-- Name: federation_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY federation
    ADD CONSTRAINT federation_pkey PRIMARY KEY (sourcegridid, targetgridid);


--
-- Name: grid_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY grid
    ADD CONSTRAINT grid_pkey PRIMARY KEY (gridid);


--
-- Name: gridattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY gridattribute
    ADD CONSTRAINT gridattribute_pkey PRIMARY KEY (gridid, name);


--
-- Name: invocation_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY invocation
    ADD CONSTRAINT invocation_pkey PRIMARY KEY (invocationname, ownerservicegridid, ownerserviceid);


--
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: node_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY node
    ADD CONSTRAINT node_pkey PRIMARY KEY (gridid, nodeid);


--
-- Name: nodeattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY nodeattribute
    ADD CONSTRAINT nodeattribute_pkey PRIMARY KEY (gridid, name, nodeid);


--
-- Name: operationrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY operationrequest
    ADD CONSTRAINT operationrequest_pkey PRIMARY KEY (id);


--
-- Name: overuselimit_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY overuselimit
    ADD CONSTRAINT overuselimit_pkey PRIMARY KEY (gridid, limittype, period);


--
-- Name: protocol_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY protocol
    ADD CONSTRAINT protocol_pkey PRIMARY KEY (protocolid);


--
-- Name: resource_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (gridid, resourceid);


--
-- Name: resourceattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY resourceattribute
    ADD CONSTRAINT resourceattribute_pkey PRIMARY KEY (gridid, name, resourceid);


--
-- Name: resourcemetaattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY resourcemetaattribute
    ADD CONSTRAINT resourcemetaattribute_pkey PRIMARY KEY (attributeid, domainid);


--
-- Name: resourcetype_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY resourcetype
    ADD CONSTRAINT resourcetype_pkey PRIMARY KEY (domainid, resourcetypeid);


--
-- Name: resourcetype_resourcemetaattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY resourcetype_resourcemetaattribute
    ADD CONSTRAINT resourcetype_resourcemetaattribute_pkey PRIMARY KEY (resourcetype_domainid, resourcetype_resourcetypeid, metaattributes_attributeid, metaattributes_domainid);


--
-- Name: service_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT service_pkey PRIMARY KEY (gridid, serviceid);


--
-- Name: serviceactionschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY serviceactionschedule
    ADD CONSTRAINT serviceactionschedule_pkey PRIMARY KEY (id);


--
-- Name: serviceattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY serviceattribute
    ADD CONSTRAINT serviceattribute_pkey PRIMARY KEY (gridid, name, serviceid);


--
-- Name: servicedeployment_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY servicedeployment
    ADD CONSTRAINT servicedeployment_pkey PRIMARY KEY (gridid, nodeid, serviceid);


--
-- Name: serviceendpoint_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY serviceendpoint
    ADD CONSTRAINT serviceendpoint_pkey PRIMARY KEY (gridid, protocolid, serviceid, url);


--
-- Name: serviceinterfacedefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY serviceinterfacedefinition
    ADD CONSTRAINT serviceinterfacedefinition_pkey PRIMARY KEY (id);


--
-- Name: servicemetaattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY servicemetaattribute
    ADD CONSTRAINT servicemetaattribute_pkey PRIMARY KEY (attributeid, domainid);


--
-- Name: servicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY servicetype
    ADD CONSTRAINT servicetype_pkey PRIMARY KEY (domainid, servicetypeid);


--
-- Name: servicetype_servicemetaattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY servicetype_servicemetaattribute
    ADD CONSTRAINT servicetype_servicemetaattribute_pkey PRIMARY KEY (servicetype_domainid, servicetype_servicetypeid, metaattributes_attributeid, metaattributes_domainid);


--
-- Name: systemproperty_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY systemproperty
    ADD CONSTRAINT systemproperty_pkey PRIMARY KEY (gridid, name);


--
-- Name: temporaryuser_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY temporaryuser
    ADD CONSTRAINT temporaryuser_pkey PRIMARY KEY (gridid, userid);


--
-- Name: userattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY userattribute
    ADD CONSTRAINT userattribute_pkey PRIMARY KEY (gridid, name, userid);


--
-- Name: userroles_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY userroles
    ADD CONSTRAINT userroles_pkey PRIMARY KEY (gridid, rolename, userid);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: langrid; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (gridid, userid);


--
-- Name: fk138359b24397de4e; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY userroles
    ADD CONSTRAINT fk138359b24397de4e FOREIGN KEY (gridid, userid) REFERENCES users(gridid, userid);


--
-- Name: fk475482a99f50ea; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY service_alloweduse
    ADD CONSTRAINT fk475482a99f50ea FOREIGN KEY (service_gridid, service_serviceid) REFERENCES service(gridid, serviceid);


--
-- Name: fk47bee9a3769b0fc; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY nodeattribute
    ADD CONSTRAINT fk47bee9a3769b0fc FOREIGN KEY (gridid, nodeid) REFERENCES node(gridid, nodeid);


--
-- Name: fk75b47b4aae317d2a; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY serviceendpoint
    ADD CONSTRAINT fk75b47b4aae317d2a FOREIGN KEY (gridid, serviceid) REFERENCES service(gridid, serviceid);


--
-- Name: fk8a29bdd675664ba3; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY gridattribute
    ADD CONSTRAINT fk8a29bdd675664ba3 FOREIGN KEY (gridid) REFERENCES grid(gridid);


--
-- Name: fk93f1bfdd1ee372dd; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY grid_domain
    ADD CONSTRAINT fk93f1bfdd1ee372dd FOREIGN KEY (supporteddomains_domainid) REFERENCES domain(domainid);


--
-- Name: fk93f1bfdd2b95a2bc; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY grid_domain
    ADD CONSTRAINT fk93f1bfdd2b95a2bc FOREIGN KEY (grid_gridid) REFERENCES grid(gridid);


--
-- Name: fk96b87a9789e2063c; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY serviceinterfacedefinition
    ADD CONSTRAINT fk96b87a9789e2063c FOREIGN KEY (servicetype_domainid, servicetype_servicetypeid) REFERENCES servicetype(domainid, servicetypeid);


--
-- Name: fka57722f14397de4e; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY userattribute
    ADD CONSTRAINT fka57722f14397de4e FOREIGN KEY (gridid, userid) REFERENCES users(gridid, userid);


--
-- Name: fka588be0b87a4cbd5; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY service_partnerservicenamespaceuris
    ADD CONSTRAINT fka588be0b87a4cbd5 FOREIGN KEY (service_gridid, service_serviceid) REFERENCES service(gridid, serviceid);


--
-- Name: fkb0860387ae317d2a; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY serviceattribute
    ADD CONSTRAINT fkb0860387ae317d2a FOREIGN KEY (gridid, serviceid) REFERENCES service(gridid, serviceid);


--
-- Name: fkb825ec52244d194; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY servicetype_servicemetaattribute
    ADD CONSTRAINT fkb825ec52244d194 FOREIGN KEY (metaattributes_attributeid, metaattributes_domainid) REFERENCES servicemetaattribute(attributeid, domainid);


--
-- Name: fkb825ec5289e2063c; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY servicetype_servicemetaattribute
    ADD CONSTRAINT fkb825ec5289e2063c FOREIGN KEY (servicetype_domainid, servicetype_servicetypeid) REFERENCES servicetype(domainid, servicetypeid);


--
-- Name: fkbba77f3aae317d2a; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY servicedeployment
    ADD CONSTRAINT fkbba77f3aae317d2a FOREIGN KEY (gridid, serviceid) REFERENCES service(gridid, serviceid);


--
-- Name: fkc487fcd29f50ea; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY service_allowedappprovision
    ADD CONSTRAINT fkc487fcd29f50ea FOREIGN KEY (service_gridid, service_serviceid) REFERENCES service(gridid, serviceid);


--
-- Name: fkde7454b0f16056f9; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY invocation
    ADD CONSTRAINT fkde7454b0f16056f9 FOREIGN KEY (ownerservicegridid, ownerserviceid) REFERENCES service(gridid, serviceid);


--
-- Name: fkf0fbfc123ea0cd14; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY resourcetype_resourcemetaattribute
    ADD CONSTRAINT fkf0fbfc123ea0cd14 FOREIGN KEY (resourcetype_domainid, resourcetype_resourcetypeid) REFERENCES resourcetype(domainid, resourcetypeid);


--
-- Name: fkf0fbfc12dbe76963; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY resourcetype_resourcemetaattribute
    ADD CONSTRAINT fkf0fbfc12dbe76963 FOREIGN KEY (metaattributes_attributeid, metaattributes_domainid) REFERENCES resourcemetaattribute(attributeid, domainid);


--
-- Name: fkfe52f60e6d276c14; Type: FK CONSTRAINT; Schema: public; Owner: langrid
--

ALTER TABLE ONLY resourceattribute
    ADD CONSTRAINT fkfe52f60e6d276c14 FOREIGN KEY (gridid, resourceid) REFERENCES resource(gridid, resourceid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

