# Hitachi Virtual Storage Platform One Object Storage Modules for Red Hat® Ansible® 1.1.0

The Hitachi Virtual Storage Platform One Object Storage Modules for Red Hat Ansible enables IT and data
center administrators to consistently and reliably manage VSP One Object storage systems
via Red Hat Ansible playbooks.
You can use these storage modules in your playbooks to manage infrastructure through
scripts that connect directly to the storage systems.

## Hardware requirements

The version required for the VSP One Object storage system is 3.1.0.2025-08-20.02427-
e3bf05cd.

## Software requirements

The folowing table lists the software requirements for the VSP One Object Storage Modules for Red Hat Ansible:

| Software | Supported version | Related host |
|---|---|---|
| Red Hat Ansible | 2.9.27 | VSP One Object Storage Modules for Red Hat Ansible |
| Ansible core | Red Hat Ansible Core - 2.18.1 | VSP One Object Storage Modules for Red Hat Ansible |
| Python | Full version of Python 3.12.0 or higher | VSP One Object Storage Modules for Red Hat Ansible |

Note: Either Red Hat Ansible or Ansible core must be installed.

The following table lists the host requirements for the VSP One Object Storage Modules for Red Hat Ansible:

### Host requirements

Red Hat Ansible control node:

| Resource | Requirements |
|---|---|
| CPU/vCPU | 2 |
| Memory | 4 GB | 
| Hard disk | 30 GB | 

## Port requirements

Use port 443 with HTTPS protocol to communicate with VSP One Object v3.1 storage.

## Installation package

The installation package for VSP One Object Storage Modules for Red Hat Ansible is
available from the following locations:

- [Hitachi Vantara Support Portal > Downloads](https://support.hitachivantara.com/en/user/answers/downloads.html) (login credentials required) Search
    for Ansible adapters. Click Hardware Download. Click the desired package.
- [Ansible Galaxy](https://galaxy.ansible.com/ui/) Search for the namespace Hitachi Vantara or modules
    vspone_object. Install the adapter following the instructions posted to Ansible Galaxy.
- [Hitachi Vantara GitHub](https://github.com/hitachi-vantara) Install the adapter following the instructions posted
    to Hitachi Vantara GitHub.

The installation package downloaded from the Hitachi Vantara Support Portal contains the following file:

- Compressed tar archive for the Hitachi Object Storage Modules installer only:
    hitachivantara-vspone_object-ansible-1.0.0.tar.gz

The hitachivantara-vspone_object-ansible-1.0.0.tar.gz file contains the following:

- Hitachi Object Storage Modules installer with the 
    hitachivantara-vspone_objectansible-1.0.0-187.tar.gz file name
-EULA: hiAdapterLicense.pdf

## Installation

Use the following procedure to install and configure the VSP One Object Storage Modules for Red Hat
Ansible with a direct connection to your storage systems.

### Before you begin

- Verify that the Ansible control node meets the software requirements posted earlier.
- Verify that the Ansible control node is up and running.

### Procedure

1. From the [Hitachi Vantara Support Portal > Downloads](https://support.hitachivantara.com/en/user/answers/downloads.html) (login credentials required),
search for Ansible adapters, click Hardware Download, and then download the
VSP One Object Storage Modules for Red Hat Ansible to the Ansible control node. The
Ansible modules are version 1.1.0.
1. Extract the following file from the distribution media kit installation TAR file:
    hitachivantara-vspone_object-ansible-1.0.0-187.tar.gz
1. Upload the hitachivantara-vspone_object-ansible-1.0.0-187.tar.gz file
to the Linux host that installs the VSP One Object Storage Modules for Red Hat
Ansible.
1. Extract the installation files on the Linux server using the following command:
    tar -zxvf hitachivantara-vspone_object-ansible-1.0.0-187.tar.gz

    The following files are extracted to the HV_Object_Storage_Ansible_Modules
    folder:

    - hitachivantara-vspone_object-1.0.0-187.tar.gz
    - install.sh
    - uninstall.sh
    - readme.md
    - version.txt

5. Navigate to the HV_Object_Storage_Ansible_Modules folder:

    [root@localhost hitachivantara-vspone_object-ansible-1.0.0]# cd
HV_Object_Storage_Ansible_Modules/

6. Proceed with installation by running the following command:
    [root@localhost HV_Object_Storage_Ansible_Modules]# sh install.sh

   Post-installation, all playbooks are available in the following location:

   $HOME/.ansible/collections/ansible_collections/hitachivantara/vspone_object/
playbooks 

    The following folders and files are created in the playbooks folder:

    - ansible_vault_vars
      This folder contains the following file: ansible_vault_storage_var.yml:
Contains details for VSP One Object systems 

    Note: It is recommended to use the Ansible Vault feature to keep
sensitive data such as passwords or keys in encrypted files.

    - oneobject_node
        Contains playbooks related to VSP One Object storage systems

    - accept_user_consent.yml
        A playbook to gather user consent for data collection.

        Note: After installation of Ansible modules, customers can review and
        execute the accept_user_consent.yml playbook.

    Most of the task-related playbooks are in the format listed below:

    - <entity>.yml
        Contains create, update, and delete entity-related samples. For example:
        storage_component.yml

    - <entity_facts>.yml
        Contains read one or all entities related samples. For example:
        storage_component_facts.yml

7. Copy specific or relevant samples from the master entity.yml file or the
entity_facts.yml file and then create your own playbook.

## Uninstallation

Use the following procedure to uninstall the VSP One Object Storage Modules for Red Hat
Ansible.

### Procedure

1. Open the command-line terminal.
2. Navigate to the <Extracted_directory>/HV_Object_Storage_Ansible_Modules containing the uninstall.sh file that is
extracted from hitachivantara-vspone_object-ansible-1.0.0-187.tar.gz
3. Run the sh uninstall.sh command to uninstall the service.

[root@localhost HV_Object_Storage_Ansible_Modules]# sh uninstall.sh
Starting uninstallation at Thu Jul 24 18:30:13 EDT 2025

4. Confirm that you want to uninstall the package.
5. Delete the remaining files from the installation directory and from the following directory.
    $HOME/.ansible/collections/ansible_collections/hitachivantara/vspone_object/

    Note: After uninstalling the VSP One Object Storage Modules for Red Hat
    Ansible, the following files are not removed from the Ansible system:
    - user_consent.json and usage.json files
    - hv_vspone_object_modules.log files
    You will have to remove the above files manually to complete the cleanup.

## Logging

This section contains information on logging, log collection, and usage data collection.

### Location of log file

The log file is located at:
$HOME/logs/hitachivantara/ansible/vspone_object/hv_vspone_object_modules.log

After the log file size reaches around 5 MB, the existing file is archived and new log file is
created. A maximum of 20 archived files are stored and the oldest file is deleted when a new
archive is generated.

### VSP One Object Storage Modules for Red Hat Ansible logs collection

Set the following environment variables to change the Ansible log level, log directory and log
file name:
- HV_ANSIBLE_LOG_PATH
- HV_ANSIBLE_LOG_LEVEL
- HV_ANSIBLE_LOG_FILE

Note: HV_ANSIBLE_LOG_LEVEL valid values are ""INFO", "DEBUG", "WARNING", "ERROR", "CRITICAL"

In the Ansible Module installed VM, the playbooks are located at:
$HOME/.ansible/collections/ansible_collections/hitachivantara/vspone_object/tools

The name of the playbook is: logbundle.yml
Log bundle generation example:
[root@ol86-host tools]# ansible-playbook logbundle.yml
After executing the script, the resulting ZIP archive is named:
ansible_log_bundle_yyyy_mm_dd_hh_mm_ss.zip

This log bundle is created in the $HOME/logs/hitachivantara/ansible/
vspone_object/log_bundles directory.

The log bundle contains the following:
- modules
    A directory containing copies of all the Hitachi Storage Ansible module logs named
hv_vspone_object_modules.log
- playbooks
    A directory containing copies of all the playbooks.
- usages
    A directory containing the usages.json file, which saves the playbook execution
results (successes or failures) logged in HV module-specific counters.
- user_consent
    A directory containing the user_consent.json file, which saves the user consent
record.
- MANIFEST.json
    Contains the build information of Hitachi VSP One Object Storage Modules for Red
Hat Ansible.
- os_info.txt
    Contains the Ansible client OS version details.

    Note: Both the usage.json file and user_consent.json files are collected
when the Ansible log bundle is generated. For more details, refer to the Usage
data collection section.

### Usage data collection

Hitachi Vantara LLC collects usage data such as VSP Object serial number, operation name,
status (success or failure), and duration. This data is collected for product improvement
purposes only. It remains confidential and it is not shared with any third parties.
accept_user_consent.yml file path:
$HOME/ansible/hitachivantara/vspone_object/playbooks/accept_user_consent.yml

After updating user consent, a record is saved at this location:
File path:
$HOME/ansible/hitachivantara/vspone_object/user_consent/user_consent.json

Note: The accept_user_consent.yml playbook can be executed again to
disable/enable user consent.

Ansible playbook execution results (successes or failures) are automatically logged to HV
module specific counters in a usage.json file.
For example, after a Get certificate facts task execution by a playbook, a
hv_certificates_fact.queryAll success counter is incremented.

Sample usage counters are shown below:
"hv_certificates_fact.queryAll": {
"success": 16,
"failure": 5,
"averageTimeInSec": 0.11
},

The averageTimeInSec counter tracks the average call duration in seconds.

Note:
- The usage.json file is available at:
/$HOME/ansible/hitachivantara/vspone_object/usages/
- The failure counter is incremented if the API call fails during Ansible playbook
execution.
- The usage.json and user_consent.json files are collected when the
Ansible log bundle is generated.

#### Requirements for the Ansible client to support Telemetry - Usage data collection

- Unrestricted Outgoing Traffic:
    Ensure that the client's firewall or security software allows outgoing HTTPS traffic on
port 443.
- Proxy Settings:
    - If the client is behind a proxy, verify that the proxy allows the CONNECT method on
port 443 for HTTPS connections.
    - Configure proxy settings in the client application if needed.
- Trusted Certificates:
    Ensure the client's certificate store trusts the Certificate Authority (CA) that issued the
server's SSL/TLS certificate. This is crucial for establishing a secure connection.
- TLS/SSL Compatibility:
    Confirm that the client supports the required TLS versions (for example, TLS 1.2 or
1.3) used by the server.
- DNS Resolution:
    Make sure the client can resolve the API's domain name correctly to establish a
connection over port 443.

#### Sample usage data collected
"vsponeobject_stats": {
    "f0157575-a23e-467b-8e82-9f9edb29087b": {
    "region": "us-west-2",
    "serial": "S12345678",
    "cluster_name": "vsp1o-k8s.scl.sie.hds.com",
    "MAPITasks": {
        "hv_certificates_fact.queryAll": {
            "success": 1,
            "failure": 0,
            "averageTimeInSec": 0.14
    },
    "hv_certificates_fact.queryOne": {
        "averageTimeInSec": 0.05,
        "success": 0,
        "failure": 1
            }
        }
    }
}

## Add your files

cd existing_repo

git remote add origin https://gitlab.wal.eng.hitachivantara.com/Converged/ansible-vsp-one-object.git

git branch -M main

git push -uf origin main
```
