# USER GUIDE
 
## Usage
 
Follow these steps to use the repository and its associated workflow:
 
1. **Clone the Repository**: Clone the repository to your local machine using the following Git command:
    ```
    git clone https://github.com/cloudeq-EMU-ORG/ceq_tf_module_gcp_war_Postgresql_sample
    ```
 
2. **Configure Secrets**: Make sure to configure the necessary secrets (`PAT_TOKEN`, `INFRACOST_API_KEY`, `GCP_CREDENTIALS`) in your GitHub repository settings. These secrets are essential for authentication and authorization during workflow execution.
 
3. **Customize Subscription Environment**: During the workflow trigger, select the desired subscription environment (`infra_env`) from the available options (`CEQ-DEVOPS-SANDBOX`, `NON-PROD`, `PROD`).
 
4. **Trigger the Workflow**: Manually trigger the workflow by selecting the desired subscription environment (`infra_env`) using the `workflow_dispatch` event. This event enables you to initiate workflows manually, providing flexibility in managing infrastructure provisioning.
 
5. **Review Workflow Results**: Once triggered, the workflow will execute various steps, such as scanning Terraform configurations, analyzing infrastructure costs, and applying Terraform changes based on the selected environment. Review the workflow logs and outputs to ensure successful execution.
 
By following these steps, you can effectively use the provided repository and its associated GitHub Actions workflow for automating infrastructure provisioning in Google Cloud Platform (GCP).
 
## Repository Structure
 
### `.github/workflows`
This directory contains GitHub Actions workflows, which are automated processes that run based on specified events. In this case, there's an `apply.yml` file, which likely defines a workflow for applying Terraform configurations to provision infrastructure.
 
### `sandbox`
This directory holds various files related to the Terraform provisioning process. Notably, it contains `terraform.tfvars`, a file containing values utilized in GitHub workflows.
 
#### `terraform.tfvars`
This file stores input variables for Terraform configurations. These variables enable customization and flexibility in the infrastructure provisioning process.
 
### `main.tf`
This is a Terraform configuration file. It typically contains the main infrastructure resources and their configurations, such as compute instances, networking components, and storage resources.
 
### `output.tf`
This is another Terraform configuration file used to define output values. Output values are useful for providing information about the infrastructure that was created or modified during the Terraform apply process.
 
### `provider.tf`
This file typically contains the configuration for the Terraform provider, which specifies the cloud provider (in this case, likely Google Cloud Platform) and any necessary authentication details or settings.
 
Each of these files and directories plays a specific role in the infrastructure provisioning process using Terraform and GitHub Actions. They collectively define the infrastructure, its parameters, and the automation workflow for managing it.
 
 
## Workflow Details
 
- **Trigger**: Manually triggered using the workflow_dispatch event.
- **Inputs**:
  - `infra_env`: Allows selecting the subscription environment.
- **Permissions**:
  - `contents`: Read permissions are required.
- **Jobs**:
  - **terraform**: 
    - **Name**: Terraform Scan & Plan
    - **Runs on**: Ubuntu latest
    - **Permissions**:
      - `contents`: Read
      - `security-events`: Write
      - `actions`: Read
    - **Steps**:
      - Checkout the source code.
      - Set up global git config.
      - Install Terrascan for scanning Terraform configurations.
      - Run Terrascan scan.
      - Test with Checkov for security scanning.
      - Install Infracost for cost estimation.
      - Authenticate with Infracost API.
      - Run Infracost to analyze infrastructure cost.
      - Set up environment variables based on the selected subscription.
      - Setup Terraform with the latest version.
      - Login to GCP using Google-GitHub actions.
      - Initialize Terraform with backend configuration.
      - Plan Terraform changes.
 
  - **terraformApply**: 
    - **Name**: Terraform Apply
    - **Runs on**: Ubuntu latest
    - **Needs**: ["terraform"]
    - **Environment**: terraform_apply
    - **Defaults**:
      - **Run**: Shell as bash
    - **Permissions**:
      - `contents`: Read
    - **Steps**:
      - Checkout the source code.
      - Set up environment variables based on the selected subscription.
      - Setup global git config.
      - Initialize Terraform with backend configuration.
      - Apply Terraform changes with auto-approval.
 
### Subscription Environment
 
The subscription environment can be selected during the workflow trigger. Available options include:
- CEQ-DEVOPS-SANDBOX
- NON-PROD
- PROD
 
Based on the selected environment, the necessary project ID, environment, bucket, and prefix are configured.
 
 
Ensure that the necessary secrets (`PAT_TOKEN`, `INFRACOST_API_KEY`, `GCP_CREDENTIALS`) are configured in your GitHub repository settings.
