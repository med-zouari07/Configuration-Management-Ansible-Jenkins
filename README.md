# Configuration Management with Ansible and Jenkins

## Overview
This repository contains configuration files and playbooks for managing infrastructure using Ansible and automating tasks with Jenkins. The setup includes various Jenkins pipelines for different tasks such as Docker, LVM, Nginx, and more.

## Author
**Mohamed ZOUARI**  
GitHub: [med-zouari07](https://github.com/med-zouari07)

## Repository Structure
```
├── inventory                # Inventory files defining hosts and groups
├── playbooks                # Ansible playbooks for automation
├── Jenkinsfile-Docker       # Jenkins pipeline for Docker tasks
├── Jenkinsfile-LVM          # Jenkins pipeline for LVM management
├── Jenkinsfile-Nginx        # Jenkins pipeline for Nginx setup
├── Jenkinsfile-Password     # Jenkins pipeline for password management
├── Jenkinsfile-Password-mfg # Password management pipeline for manufacturing
├── Jenkinsfile-Start-Env    # Pipeline for starting environments
├── Jenkinsfile-Stop-Env     # Pipeline for stopping environments
├── Jenkinsfile-Wine         # Pipeline for Wine-related tasks
├── ansible.cfg              # Ansible configuration file
├── LICENSE                  # License file
└── README.md                # Project overview (this file)
```

## Getting Started

### Prerequisites
Ensure the following tools are installed:
- **Ansible**: Required for executing playbooks.
- **Jenkins**: A running Jenkins server is needed.
- **Docker** *(optional)*: If using Docker-related Jenkins pipelines.
- **LVM Tools** *(optional)*: If using LVM-related Jenkins pipelines.
- **Nginx** *(optional)*: If using Nginx-related Jenkins pipelines.

### Usage
#### Clone the Repository
```bash
git clone https://github.com/med-zouari07/Configuration-Management-Ansible-Jenkins.git
cd Configuration-Management-Ansible-Jenkins
```

#### Configure Ansible
- Modify the `ansible.cfg` file to suit your environment.
- Update the `inventory` file with target hosts.

#### Run Ansible Playbooks
Navigate to the playbooks directory and execute a playbook:
```bash
ansible-playbook -i ../inventory <playbook-name>.yml
```

#### Jenkins Pipelines
- Import the `Jenkinsfile-*` files into your Jenkins server.
- Configure the pipelines as needed (Docker, LVM, Nginx, etc.).

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License
This project is licensed under the **MIT License**. See the `LICENSE` file for details.

For any questions or issues, please contact the author: **Mohamed ZOUARI**.

