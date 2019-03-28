# Chrome On Windows

## What

This terraform script sets up ownCloud (the open source file sharing and document management solution) on an ECS instance running Ubuntu 18.04. A separate RDS database is also configured, rather than locally installing MySQL. An EIP is assigned to the ECS instance so that the instance can be replaced in the future without the need to change the public IP address associated with ownCloud.

Once the script has run, it outputs login information for the ECS instance, as well as all the database configuration information needed by the ownCloud setup page. All you need to do after running "terraform apply" is visit the public IP address of the ECS instance (the EIP IP address) in a web browser, and enter the database connection information output by the terraform script (database name, database username, database password, and connection string). It's that easy!

Directory contents:

```
.
├── README.md
├── diagrams
│   ├── document_management_system.drawio
│   └── document_management_system.png
├── install_ownCloud.sh
├── main.tf
├── outputs.tf
└── variables.tf
```

The readme and diagrams (done using [draw.io](https://about.draw.io/)) are here for explanatory purposes. The files you probably care about are:

- main.tf (create a VPC group, security group, vSwitch, ECS instance, EIP, and an RDS instance)
- variables.tf (variables used in main.tf)
- outputs.tf (outputs database connection info and ECS instance login information for SSH)
- install_ownCloud.sh (fetches and installs apache2, PHP, and ownCloud packages, and does some configuration to change apache2 to point at /var/www/owncloud)

## Why

Your customer may not be sure *why* they need cloud services. Virtually every small to medium sized business could use a document management and sharing system. This script makes it very easy to create a demo system to show to customers.

## How

From your command line, "cd" into this directory. Then run:

```
terraform init
```

And then:

```
terraform plan
```

Check the output. Make sure the proposed changes look sane (i.e. ECS, RDS, EIP and associated resources like security groups and VPC are all set to be created). Then run:

```
terraform apply
```

Say "yes" when prompted to continue with the "apply" operation. That's it! In a few minutes you'll have a working ownCloud document sharing system!

## Architecture

The architecture for this system is as follows:

![Simple ownCloud Document Management System](diagrams/document_management_system.png)

This architecture could easily be expanded by decoupling ownCloud's document storage (say, using Alibaba Cloud's NAS) and then creating an auto-scaling group to allow ownCloud to scale in and out as demand changes.