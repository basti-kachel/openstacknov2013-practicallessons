% Practical Lessons from Building a Highly Available OpenStack Private Cloud
% Sebastian Kachel, Florian Haas
% Fall 2013 OpenStack Summit, Hong Kong, November 7, 2013

This presentation is **licensed** under the
[Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).

Get the **sources** on GitHub:

* <https://github.com/basti-kachel/openstacknov2013-practicallessons>
* <https://github.com/fghaas/openstacknov2013-practicallessons>

# What's this about?

## What's this about?

**Best Practices** and **Lessons Learned** from pixelpark's Highly
  Available Private Cloud

# Who are we?

## Sebastian Kachel 
	
IT Cloud-Manager / IT Operator

![](img/logo-pixelpark.png)

* Seasoned Unix/Linux sysadmin/devops guy
* Became involved in OpenStack in 2012
* Based in Berlin, Germany
* One of the movers and shakers of all things OpenStack at Pixelpark
	
## Florian Haas

* HA/Storage/Cloud guy, consultant, instructor
* hastexo co-founder & CEO
* Based in seat 10C, Economy Class
* Occasionally returns to home base near Vienna, Austria

# What was our challenge to solve?

## Ensure high availability for all services that we want use for our customers

## Pixelpark AG 
	
### Full-service agency for multimedia communications & e-business solutions
	
**departments:** concepts, project management, editorial, design,
  development & hosting

## Challenges

* Hosting department needs benefits of cloud computing
* cloud software that is/become more than IaaS, that can be use by
  other departments like PaaS for development
* OpenStack is the best base for Pixelpark as a full-service agency

## Why high availability ?

* Business need
* We provide our customers SLAs with availability up to 99,99%.

# How did we do it?

## Highly available storage

* Highly available storage as base data store to make it scale
![](img/logo-ceph.png)

## Why Ceph?

* Ceph is a distributed object store and file system designed to
  provide excellent performance, reliability and scalability
* Guarantees reliable storage with no data loss
* Stores: Cinder volumes, Glance images, static data (S3) over radosgw
  & instances
* Ceph is an excellent, reliable basis for cloud storage

## How did we build our Ceph store?

![](img/ha-storage.png)

* Working with 3 copies
* 1 disk per OSD
* XFS filesystem
* Journal on separate SSD
* Storage nodes with 8 x 1GBit/s Ports in trunk mode

## Highly available networking

![](img/ha-network.png)
  
* `quantum-dhcp-agent` **active/active** over two nodes
* `quantum-l3-agent` **active/passive** over two nodes
* `quantum-plugin-openvswitch-agent` **active/active** over all compute &
  network nodes


## Highly available OpenStack services and APIs

### 2 controller nodes in Pacemaker cluster

![](img/logo-pacemaker.svg)

* Runs horizon, keystone, glance, nova, rabbitmq, quantum-server & mysql database

## Pacemaker managed services on API nodes

![](img/ha-controller.png)

* Active/passive (distributed)
* MySQL/RabbitMQ stored on DRBD
* DRBD on RAID-1

## Highly available Nova guests

* Instances store ephemeral data in Ceph, too
* Pacemaker manages services

![](img/ha-compute.png)

## Working around limitations in CephFS

* RBD mounts to `/var/lib/nova/instances`
* Separate Ceph pool
* OCFS2 filesystem
* Requires good network connection to storage nodes
* 6 x 1GBit/s Ports on every compute node

# How did this affect our organization?

## Lessons Learned from a Production OpenStack Implementation

* Implementing an OpenStack environment is a **challenge**
* Getting **training and support** is a good idea
* Ensure **quality,** work **efficiently**
* Create a basis for **further innovation**
* Be ready for up & coming **technology**
* **Have fun!**

# Get in touch!

## Contact Details

* <sebastian.kachel@pixelpark.com>
* <florian.haas@hastexo.com>

# Thank you !
