# Ubuntu Lab Setup TODO

## Overview
This project aims to simplify the setup of Ubuntu lab servers using Ansible.

## Status Summary
- [x] Create a dedicated user for Ansible automation tasks
- [x] Set a root password
- [x] Install required tools (`vim`, `screen`, `net-tools`)
- [x] Configure basic Vim settings
- [ ] Convert hardcoded values to variable-based configuration
- [ ] Add validation and security checks for SSH and sudo configuration
- [ ] Document setup and usage steps for the lab environment

## Completed Tasks
- Create user for the Ansible plays
- Set root password
- Install required packages
- Configure Vim defaults

## Pending Tasks
- Convert the playbook to use variables instead of hardcoded values
- Review security settings for SSH and sudo access
- Add more robust task tracking and issue documentation

## Known Issues
- Credentials are currently embedded in the playbook and should be moved to variables or Ansible Vault
- SSH configuration should be validated before service reload/restart
- The playbook should be reviewed for production-ready hardening practices

## Notes
- This file is intended to track both completed work and follow-up improvements.
- Keep tasks actionable, specific, and small enough to complete in one pass.