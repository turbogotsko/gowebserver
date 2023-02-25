steps:
terraform
- infrastructure
	- vpc & subnet
	- ec2
	- Security Group with Rules - open ports for ssh, http & https
	- internet gateway & route tables - for external access
	- ec2 profile | 
	- iam role    | access EC2 to S3 		
	- iam policy  |
- provisiners
	- remote - make sure sever up & running
	- local -  pass server ip to inventory file and fire up ansible-playbook
ansible
	- enable & install epel repo
	- install nginx packages
	- get app from s3 & put it in a bin folder
	- configure nginx from template & start daemon
	- run app