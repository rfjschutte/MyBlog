#!/usr/bin/ansible-playbook -e 'ansible_python_interpreter=/usr/bin/python3' 
---
- hosts: localhost
  gather_facts: True
  tasks:
  - name: pip and git installed on Ubuntu-Debian
    apt:
      pkg:
      state: present
    with_items:
        - python3
        - python3-dev
        - python3-pip
        - git
    when: ansible_distribution == 'Debian' or ansible_distribution == 'Ubuntu'

  - name: pip and git installed on Centos-RedHat
    become: yes
    yum: 
      name: "{{ packages }}" 
    vars:
      packages:
       - epel-release
       - python3
       - python3-pip
       - git
    when: ansible_distribution == 'CentOS' or ansible_distribution == 'Red Hat Enterprise Linux'  

  - name: mkdocs packages installed
    become: yes
    pip:
      name:
        - wheel
        - mkdocs
        - mkdocs-material
        - pymdown-extensions
        - markdown-blockdiag
        - markdown-include
        - mkdocs-pdf-export-plugin
        - mkdocs-git-revision-date-localized-plugin

  - name: "Clone git repo"
    git:
      repo: 'https://foo.example.org/path/to/repo.git'
      dest: /var/www
      clone: yes
      update: yes

