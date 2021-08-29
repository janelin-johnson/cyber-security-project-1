# cyber-security-project-1
UPenn Cyber Bootcamp - Cloud Security Project 1 (Unit 13)
# cyber-security-project-1
UPenn Cyber Bootcamp - Cloud Security Project 1 (Unit 13)

=============================
Automated ELK Stack Deployment
=============================
The files in this repository were used to configure the network depicted below.
janelin-johnson/cyber-security-project-1/Diagrams/Network Diagram.PNG

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.
•	filebeat-playbook.yml,
•	metricbeat-playbook.yml,
•	install-elk.yml

This document contains the following details:
•	Description of the Topology 
•	Access Policies 
•	ELK Configuration 
•	Beats in Use 
•	Machines Being Monitored 
•	How to Use the Ansible Build

===========================
Description of the Topology
==========================

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Load balancing will protect from the denial of service attack as it will help to divert the traffic and to distribute the load. Moreover, It helps with the intrusion prevention by restricting access to the servers holding the application. A jump box provides a controlled access to the servers/VMs holding the applications and helps with the management of these hosts.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metrics.

•	Filebeat watches for the changes in the files in the locations that we specify or the log files and then collects and send the data to logstash/elasticsearch. 
•	Metricbeat collects the metric data from the services and the operating system and sends it to logstash/elasticsearch

The configuration details of each machine may be found below.
| Name                   	| Function 	| IP Address Public 	| IP Address Private 	| Operating System 	|
|------------------------	|----------	|-------------------	|--------------------	|------------------	|
| JumpBoxProvisioner     	| Gateway  	| 20.81.91.185      	| 10.0.0.4           	| Linux Ubuntu     	|
| Web 1 (DVWA) – East US 	| WebApp   	| 20.102.84.46      	| 10.0.0.5           	| Linux Ubuntu     	|
| Web 2 (DVWA) East US   	| WebApp   	| 20.102.84.46      	| 10.0.0.7           	| Linux Ubuntu     	|
| Web 3 (DVWA) East US   	| WebApp   	| 10.0.0.9          	| Linux Ubuntu       	|                  	|
| ELK                    	| ELK      	| 104.43.170.162    	| 10.1.0.4           	| Linux Ubuntu     	|
===============
Access Policies 
===============
The machines on the internal network are not exposed to the public Internet. 

Only the JumpBoxProvisioner machine can accept connections from the Internet.
 
Access to this machine is only allowed from the following IP addresses:
•	Public IP: 173.73.78.212 (Personal PC)

Machines within the network can only be accessed by JumpBoxProvisioner.
•	Public IP: 20.81.91.185
•	Private IP: 10.0.0.4

A summary of the access policies in place can be found in the table below.

|      Name                 	|      Publicly Accessible     	|      Allowed IP    Addresses                                      	|
|---------------------------	|------------------------------	|-------------------------------------------------------------------	|
|     JumpBoxProvisioner    	|     No                       	|     Personal PC Public   IP                                       	|
|     ELK                   	|     No                       	|     Personal PC Public   IP, 173.73.78.212, 10.0.0.5, 10.0.0.7    	|
|     ELK                   	|     Yes                      	|     20.102.84.46                                                  	|
|     Web 1                 	|     No                       	|     Private IP: 10.0.0.5   (LB: 20.102.84.46                      	|
|     Web 2                 	|     No                       	|     Private IP: 10.0.0.7   (LB: 20.102.84.46)                     	|
=================
Elk Configuration
=================
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because:
•	Ansible provides automation daily administrative tasks.
Helps to eliminate syntax errors.
•	Frees up Administrator time to focus more important things.
•	Additional machines can be configured by just running the ansible playbook versus going to every machine and configuring on an individual basis
 
The playbook implements the following tasks:
•	Increasing the memory of the machine
•	Install pip
•	Install docker python module
•	Download and launch docker web container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
janelin-johnson/cyber-security-project-1/Images/Docker PS.PNG

========================
Target Machines & Beats
========================
This ELK server is configured to monitor the following machines:
•	Web 1
•	Web 2
We have installed the following Beats on these machines:
•	Filebeat
•	Metricbeat
Filebeats allow us to collect the following information from each machine:
•	Filebeat collects and forwards log data from the machines it is installed on and sends this information to the ELK stack server for processing. This information can then be viewed through Kibana through customizable charts and tables.

Metricbeat allow us to collect the following information from each machine:
•	Metricbeat collects and forwards metric data from the machines it is installed on and sends this information to the ELK stack server for processing. This information can then be viewed through Kibana through customizable charts and tables.

======================
### Using the Playbook
======================

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 
SSH into the control node and follow the steps below:
SSH into JumpBoxProvisioner from Local Desktop:
•	ssh RedAdmin@20.81.91.185
•	Copy the filebeat-playbook.yml and metricbeat-playbook.yml files to /etc/ansible/. 
•	 Update the /etc/ansible/hosts file to include the ip address of the machine under webservers 
•	Run the playbook, and navigate to http://104.43.170.162:5601/ to check that the installation worked as expected.

Which file is the playbook filebeat-playbook.yml and metricbeat-playbook.yml. 
Where do you copy it?_/etc/ansible/
Which file do you update to make Ansible run the playbook on a specific machine? Ansible-playbook
How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
•	ansible-playbook /etc/ansible/install-elk.yml
•	ansible-playbook /etc/ansible/filebeat-playbook.yml

Open Kibana in browser:
http://104.43.170.162:5601/


Which URL do you navigate to in order to check that the ELK server is running?
http://104.43.170.162:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

Before running the playbook, we need to make sure that the private IP of elk server is added to the ansible hosts file under elkservers group. 
•	nano /etc/ansible/hosts command is used to edit the hosts file
Below command is used to increase the memory
•	sysctl -w vm.max_map_count=262144 . This improves the performance of Elk server.
For Filebeats following needs to be added in the playbook
•	curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.0-amd64.deb sudo dpkg -i filebeat-7.6.2-amd64.deb copy filebeat.yml from /etc/ansible/files/filebeat.yml(ansible) to /etc/metricbeat/filebeat.yml(Webserver) filebeat modules enable system filebeat setup service filebeat start
For Metricbeats following needs to be added in the playbook
•	curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-amd64.deb sudo dpkg -i metricbeat-7.6.2-amd64.deb copy metricbeat.yml from /etc/ansible/files/metricbeat.yml(ansible) to /etc/metricbeat/metricbeat.yml(Webserver) metricbeat modules enable system metricbeat setup service metricbeat start


