LAPPS Grid LDDL Scripts
============

The [Lappsgrid Database Definition Language](http://github.com/lappsgrid-incubator/org.anc.lapps.lddl) (LDDL) is a Groovy DSL for configuring the Postgres database used by [Service Manager](https://github.com/openlangrid/langrid) instances. See http://lappsgrid.org/software/lddl for more information on the LDDL syntax.

## Usage

Configuring the Posgres database and registering services requires the following steps.

1. Run the *DatabaseCreate.lddl* script to create the Postgres database.  If the database already exists it will be dropped first.
1. Start then Stop the Tomcat instance hosting the Service Manager.  The Service Manager will create all of the required tables when it first connects to the Postgres database.
1. Run the *DatabaseSetup.lddl* script which creates the indices and stored procedure used by the Serivce Manager. **Note:** The *Vassar.lddl* script includes the *DatabaseSetup.lddl* script so it does not need to be run separately.
1. Register your services with the Service Manager. See the *Vassar.lddl* script for an example setup.

For example, setting up the Vassar node might go something like:

```bash
$> lddl DatabaseCreate.lddl
$> sudo service tomcat start
$> sudo service tomcat stop
$> lddl Vassar.lddl
```

## Scripts

There are three main scripts used to initialize nodes on the LAPPS Grid:

1. **Brandeis.lddl**<br/>
Initializes the services on the Brandeis node.
1. **Vassar.lddl**<br/>
Initializes the services on the Vassar node.
1. **Update.lddl**<br/>
Use the *Update.lddl* script to register one, or more, services with out re-initializing the entire database.

The *Vassar.lddl* scripts accepts two optional parameters:

1. **-server=&lt;URL>**<br/>
Specifies the URL of the server hosting the services being registered. The services being registered by the LDDL script must be online and available as the LDDL script will need to fetch the WSDL file from the service to register it with the Service Manager.
1. **-clean**<br/>
Deletes existing data from the database.  Use the *-clean* option when the database has been previously populated by the Service Manager.  If the *-clean* parameter is not provided it is assumed that the database is being configured for the first time and the indices and stored procedure will be added to the database.

```bash
$> lddl Vassar.lddl -clean -server=http://grid.anc.org:9080
```

## Updating the Service Manager

Use the *Update.lddl* script to register one or more services without reinitializing the entire database.  This is useful to add services to an already configured Service Manager instance.  For example:

```bash
$> lddl Update.lddl -server=vassar vassar/Gate vassar/Stanford vassar/MASC
```

## Other Useful Scripts

- **Copyright.lddl**<br/>
Edit the *Copyright.lddl* script to update the copyright noticed added to resources and services registered with the Service Manager.
- **Database.lddl**<br/>
Database connection information for the Postgres database: connection URL, username, and password.
- **Setup.lddl**<br/>
Include the `Setup.lddl` script to initialize the database with the metadata, resources, and service definitions required by all nodes in the LAPPS Grid.
