# Terraform
Automating AWS cloud infrastrure with Terraform

Infrastructure as code (IaC) tools allow you to manage infrastructure with configuration files rather than through a graphical user interface. IaC allows you to build, change, and manage your infrastructure in a safe, consistent, and repeatable way by defining resource configurations that you can version, reuse, and share.

Terraform is HashiCorp's infrastructure as code tool. It lets you define resources and infrastructure in human-readable, declarative configuration files, and manages your infrastructure's lifecycle. Using Terraform has several advantages over manually managing your infrastructure:

main terraform commands are :

- Initialize Terraform

      terraform init 
    
- Review the configuration and verify that the resources that Terraform is going to create or update match your expectations:
   
      terraform plan
     
- Apply the Terraform configuration by running the following command and entering yes at the prompt

      terraform apply
      
-To check whether your configuration is valid, enter the following command:

      terraform validate
      
- Remove resources previously applied with your Terraform configuration by running the following command and entering yes at the prompt:

      terraform destroy
